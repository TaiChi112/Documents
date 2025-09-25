#!/bin/bash

DATA_FILE="emails.txt"

# สร้างไฟล์ + ส่วนหัว หากยังไม่มี
if [ ! -f "$DATA_FILE" ]; then
  echo "ID|Email|Subject|Body|Category" > "$DATA_FILE"
fi

# ฟังก์ชันหา ID ถัดไป (max(ID)+1)
next_id() {
  awk -F'|' 'NR>1 && $1+0>max {max=$1+0} END{print (max?max:0)+1}' "$DATA_FILE"
}

# ฟังก์ชันเขียนไฟล์กลับจากอาร์เรย์ lines[]
rewrite_file() {
  {
    echo "ID|Email|Subject|Body|Category"
    for line in "${lines[@]}"; do
      [ -n "$line" ] && echo "$line"
    done
  } > "$DATA_FILE"
}

while true; do
  result=$(whiptail --title "Email Scheduler" \
  --menu "Please select an option:" 15 60 6 \
  "1" "Add New Email" \
  "2" "View All Emails" \
  "3" "Edit Email" \
  "4" "Delete Email" \
  "5" "Exit" \
  3>&1 1>&2 2>&3)

  exitstatus=$?
  if [ $exitstatus -ne 0 ]; then
    echo "User canceled the menu."
    exit 0
  fi

  case $result in
    1)
      # 1) Email
      email=$(whiptail --title "Enter Email Address" \
        --inputbox "Enter Email Address:" 10 60 "user@example.com" \
        3>&1 1>&2 2>&3) || continue

      # 2) Subject
      subject=$(whiptail --title "Enter Email Subject" \
        --inputbox "Enter Subject Line:" 10 60 "Daily Newsletter" \
        3>&1 1>&2 2>&3) || continue

      # 3) Body (\\n แทนขึ้นบรรทัดใหม่)
      body=$(whiptail --title "Enter Email Body" \
        --inputbox "Enter Body (use \\n for new lines):" 12 70 "Hello,\\nThis is your daily newsletter..." \
        3>&1 1>&2 2>&3) || continue

      # 4) Category
      Category=$(whiptail --title "Select Category" \
        --radiolist "Choose one category:" 15 50 4 \
        "Personal"   "" ON  \
        "Work"       "" OFF \
        "Marketing"  "" OFF \
        "Newsletter" "" OFF \
        3>&1 1>&2 2>&3) || continue

      new_id=$(next_id)
      echo "${new_id}|${email}|${subject}|${body}|${Category}" >> "$DATA_FILE"

      whiptail --msgbox "ADDED\n\nID: $new_id\nEmail: $email\nSubject: $subject\nCategory: $Category" 12 60
      ;;

    2)
      # ดูทั้งหมด (จัดคอลัมน์ให้อ่านง่าย)
      message=$(column -t -s '|' "$DATA_FILE")
      whiptail --msgbox --title "All Emails" "$message" 0 0
      ;;

    3)
      # EDIT
      mapfile -t lines < <(tail -n +2 "$DATA_FILE")
      if [ ${#lines[@]} -eq 0 ]; then
        whiptail --msgbox "No data to edit." 10 40
        continue
      fi

      options=()
      for i in "${!lines[@]}"; do
        IFS="|" read -r id email subject body category <<< "${lines[$i]}"
        options+=("$i" "[$id] $email | $subject")
      done

      choice=$(whiptail --title "Select Email to Edit" \
        --menu "Choose a record to edit:" 20 78 10 \
        "${options[@]}" \
        3>&1 1>&2 2>&3) || continue

      IFS="|" read -r id email subject body category <<< "${lines[$choice]}"

      new_email=$(whiptail --inputbox "Edit Email Address:" 10 60 "$email" 3>&1 1>&2 2>&3) || continue
      new_subject=$(whiptail --inputbox "Edit Subject:" 10 60 "$subject" 3>&1 1>&2 2>&3) || continue
      new_body=$(whiptail --inputbox "Edit Body (\\n = newline):" 12 70 "$body" 3>&1 1>&2 2>&3) || continue

      new_category=$(whiptail --title "Edit Category" \
        --radiolist "Choose a category:" 15 50 4 \
        "Personal" "" $([ "$category" = "Personal" ] && echo ON || echo OFF) \
        "Work" "" $([ "$category" = "Work" ] && echo ON || echo OFF) \
        "Marketing" "" $([ "$category" = "Marketing" ] && echo ON || echo OFF) \
        "Newsletter" "" $([ "$category" = "Newsletter" ] && echo ON || echo OFF) \
        3>&1 1>&2 2>&3) || continue

      lines[$choice]="$id|$new_email|$new_subject|$new_body|$new_category"
      rewrite_file
      whiptail --msgbox "Email [ID: $id] updated successfully!" 10 50
      ;;

    4)
      # DELETE
      mapfile -t lines < <(tail -n +2 "$DATA_FILE")
      if [ ${#lines[@]} -eq 0 ]; then
        whiptail --msgbox "No data to delete." 10 40
        continue
      fi

      options=()
      for i in "${!lines[@]}"; do
        IFS="|" read -r id email subject body category <<< "${lines[$i]}"
        options+=("$i" "[$id] $email | $subject")
      done

      choice=$(whiptail --title "Select Email to Delete" \
        --menu "Choose a record to delete:" 20 78 10 \
        "${options[@]}" \
        3>&1 1>&2 2>&3) || continue

      confirm=$(whiptail --title "Confirm Delete" \
        --yesno "Are you sure you want to delete:\n\n${lines[$choice]}" 12 70 \
        3>&1 1>&2 2>&3)

      if [ $? -eq 0 ]; then
        # ลบรายการตาม index ที่เลือก
        unset "lines[$choice]"
        # pack ช่องว่างของอาร์เรย์ (bash จะ preserve index เดิม)
        lines=("${lines[@]}")
        rewrite_file
        whiptail --msgbox "Email deleted successfully!" 10 40
      else
        whiptail --msgbox "Delete canceled." 10 40
      fi
      ;;

    5)
      echo "Exit"
      exit 0
      ;;
  esac
done