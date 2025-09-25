#!/bin/bash

DATA_FILE="emails.txt"

# ==== Mailtrap Config (กรอกของคุณเอง) ====
API_TOKEN="83ea3492a96f402ad5920a73ec432ead"
SANDBOX_ID="4009396"
MAILTRAP_URL="https://sandbox.api.mailtrap.io/api/send/${SANDBOX_ID}"

# ====== init / migrate header ======
init_file() {
  if [ ! -f "$DATA_FILE" ]; then
    echo "ID|Email|Subject|Body|Category|Sent" > "$DATA_FILE"
  else
    # ถ้ายังไม่มีคอลัมน์ Sent ให้ migrate โดยเติม |No ท้ายทุกแถว (ยกเว้น header)
    header=$(head -n1 "$DATA_FILE")
    if ! echo "$header" | grep -q "|Sent$"; then
      tmp="$(mktemp)"
      {
        echo "${header}|Sent"
        tail -n +2 "$DATA_FILE" | awk '{print $0"|No"}'
      } > "$tmp"
      mv "$tmp" "$DATA_FILE"
    fi
  fi
}

# ====== helpers ======
next_id() {
  awk -F'|' 'NR>1 && $1+0>max {max=$1+0} END{print (max?max:0)+1}' "$DATA_FILE"
}

rewrite_file_from_lines() {
  {
    echo "ID|Email|Subject|Body|Category|Sent"
    for line in "${lines[@]}"; do
      [ -n "$line" ] && echo "$line"
    done
  } > "$DATA_FILE"
}

validate_email() {
  local email="$1"
  # คร่าว ๆ: ต้องมี @ และ โดเมนมีจุด
  [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]
}

json_escape() {
  # escape สำหรับฝังลง JSON string
  local s=$1
  s=${s//\\/\\\\}   # backslash -> \\
  s=${s//\"/\\\"}   # quote -> \"
  s=${s//$'\n'/\\n} # newline -> \n
  s=${s//
/}        # strip CR (ถ้ามี)
  printf '%s' "$s"
}

# body ในไฟล์เก็บเป็น "\n" ให้แปลงเป็น newline จริงตอนส่ง
literal_newlines() {
  printf '%b' "$1"
}

send_mailtrap() {
  local from_email="$1" from_name="$2" to_email="$3" subject="$4" text="$5" category="$6"

  # เตรียม payload JSON (escape ให้เรียบร้อย)
  local subject_j text_j cat_j from_name_j
  subject_j=$(json_escape "$subject")
  text_j=$(json_escape "$(literal_newlines "$text")")
  cat_j=$(json_escape "$category")
  from_name_j=$(json_escape "$from_name")

  curl --silent --show-error --fail \
    --location --request POST "$MAILTRAP_URL" \
    --header "Authorization: Bearer $API_TOKEN" \
    --header "Content-Type: application/json" \
    --data-raw "{
      \"from\": {\"email\": \"${from_email}\", \"name\": \"${from_name_j}\"},
      \"to\": [{\"email\": \"${to_email}\"}],
      \"subject\": \"${subject_j}\",
      \"text\": \"${text_j}\",
      \"category\": \"${cat_j}\"
    }"
}

init_file

# ====== UI loop ======
while true; do
  choice=$(whiptail --title "Email Scheduler" \
    --menu "Please select an option:" 16 70 8 \
    "1" "Add New Email" \
    "2" "View All Emails" \
    "3" "Edit Email" \
    "4" "Delete Email" \
    "5" "Send Pending (Mailtrap)" \
    "6" "Exit" \
    3>&1 1>&2 2>&3) || exit 0

  case "$choice" in
    1)  # Add
      email=$(whiptail --title "Enter Email Address" \
        --inputbox "Enter Email Address:" 10 65 "user@example.com" \
        3>&1 1>&2 2>&3) || continue
      if ! validate_email "$email"; then
        whiptail --msgbox "Invalid email format." 10 40; continue
      fi

      subject=$(whiptail --title "Enter Subject" \
        --inputbox "Enter Subject:" 10 65 "Daily Newsletter" \
        3>&1 1>&2 2>&3) || continue
      [ -z "$subject" ] && { whiptail --msgbox "Subject must not be empty." 10 45; continue; }

      body=$(whiptail --title "Enter Body" \
        --inputbox "Enter Body (use \\n for new lines):" 12 70 "Hello,\\nThis is your daily newsletter..." \
        3>&1 1>&2 2>&3) || continue

      category=$(whiptail --title "Select Category" \
        --radiolist "Choose one category:" 15 50 4 \
        "Personal"   "" ON  \
        "Work"       "" OFF \
        "Marketing"  "" OFF \
        "Newsletter" "" OFF \
        3>&1 1>&2 2>&3) || continue
      [ -z "$category" ] && { whiptail --msgbox "Category must not be empty." 10 45; continue; }

      new_id=$(next_id)
      echo "${new_id}|${email}|${subject}|${body}|${category}|No" >> "$DATA_FILE"
      whiptail --msgbox "Added ID: $new_id" 8 30
      ;;

    2)  # View
      message=$(column -t -s '|' "$DATA_FILE")
      whiptail --msgbox --title "All Emails" "$message" 0 0
      ;;

    3)  # Edit
      mapfile -t lines < <(tail -n +2 "$DATA_FILE")
      [ ${#lines[@]} -eq 0 ] && { whiptail --msgbox "No data to edit." 8 30; continue; }
      opts=()
      for i in "${!lines[@]}"; do
        IFS="|" read -r id email subject body category sent <<<"${lines[$i]}"
        opts+=("$i" "[$id] $email | $subject | Sent:$sent")
      done
      idx=$(whiptail --menu "Select record to edit:" 20 78 10 "${opts[@]}" 3>&1 1>&2 2>&3) || continue
      IFS="|" read -r id email subject body category sent <<<"${lines[$idx]}"

      new_email=$(whiptail --inputbox "Edit Email:" 10 65 "$email" 3>&1 1>&2 2>&3) || continue
      if ! validate_email "$new_email"; then whiptail --msgbox "Invalid email." 8 30; continue; fi
      new_subject=$(whiptail --inputbox "Edit Subject:" 10 65 "$subject" 3>&1 1>&2 2>&3) || continue
      [ -z "$new_subject" ] && { whiptail --msgbox "Subject must not be empty." 10 45; continue; }
      new_body=$(whiptail --inputbox "Edit Body (\\n=newline):" 12 70 "$body" 3>&1 1>&2 2>&3) || continue
      new_category=$(whiptail --radiolist "Edit Category:" 15 50 4 \
        "Personal" "" $([ "$category" = "Personal" ] && echo ON || echo OFF) \
        "Work" "" $([ "$category" = "Work" ] && echo ON || echo OFF) \
        "Marketing" "" $([ "$category" = "Marketing" ] && echo ON || echo OFF) \
        "Newsletter" "" $([ "$category" = "Newsletter" ] && echo ON || echo OFF) \
        3>&1 1>&2 2>&3) || continue

      lines[$idx]="$id|$new_email|$new_subject|$new_body|$new_category|$sent"
      rewrite_file_from_lines
      whiptail --msgbox "Updated ID: $id" 8 30
      ;;

    4)  # Delete
      mapfile -t lines < <(tail -n +2 "$DATA_FILE")
      [ ${#lines[@]} -eq 0 ] && { whiptail --msgbox "No data to delete." 8 30; continue; }
      opts=()
      for i in "${!lines[@]}"; do
        IFS="|" read -r id email subject body category sent <<<"${lines[$i]}"
        opts+=("$i" "[$id] $email | $subject | Sent:$sent")
      done
      idx=$(whiptail --menu "Select record to delete:" 20 78 10 "${opts[@]}" 3>&1 1>&2 2>&3) || continue
      if whiptail --yesno "Delete this?\n\n${lines[$idx]}" 12 70; then
        unset "lines[$idx]"; lines=("${lines[@]}")
        rewrite_file_from_lines
        whiptail --msgbox "Deleted." 8 30
      fi
      ;;

    5)  # Send Pending (Mailtrap)
      # อ่านทุกรายการที่ Sent != Yes
      mapfile -t lines < <(tail -n +2 "$DATA_FILE")
      [ ${#lines[@]} -eq 0 ] && { whiptail --msgbox "No data." 8 30; continue; }

      total=0; sent_ok=0; skipped=0; failed=0
      for i in "${!lines[@]}"; do
        IFS="|" read -r id email subject body category sent <<<"${lines[$i]}"
        [ "$sent" = "Yes" ] && { ((skipped++)); continue; }   # ป้องกันส่งซ้ำ
        ((total++))

        # validations
        if ! validate_email "$email"; then ((failed++)); continue; fi
        [ -z "$subject" ] && { ((failed++)); continue; }
        [ -z "$category" ] && { ((failed++)); continue; }

        # ส่งด้วย Mailtrap
        if response=$(send_mailtrap "sender@example.com" "Mailtrap Test" "$email" "$subject" "$body" "$category" 2>&1); then
          # สำเร็จ -> mark Sent = Yes
          lines[$i]="$id|$email|$subject|$body|$category|Yes"
          ((sent_ok++))
        else
          # ล้มเหลว -> คงสถานะเดิม
          ((failed++))
        fi
      done

      rewrite_file_from_lines
      whiptail --msgbox "Send Pending Done
Processed: $total
Sent OK : $sent_ok
Skipped  : $skipped (already Sent)
Failed   : $failed" 12 50
      ;;

    6)
      exit 0
      ;;
  esac
done