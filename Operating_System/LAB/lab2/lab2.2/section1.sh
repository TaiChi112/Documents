#!/bin/bash
FILE="emails.txt"

add_new_email() {
    email="$(whiptail --inputbox "Enter your email?" 10 30  3>&1 1>&2 2>&3)"
    printf "Your email is : %s\n" "${email}"

    subject="$(whiptail --inputbox "Enter your subject?" 10 30  3>&1 1>&2 2>&3)"
    printf "Your subjectis : %s\n" "${subject}"

    body=$(whiptail --inputbox "Enter your note:" 10 40 "" 3>&1 1>&2 2>&3)
    echo "You typed: $body"

    category=$(whiptail \
    --radiolist "Select Category" 0 0 3 \
    "Personal" "personal" 1 \
    "Work"  "Work"  1 \
    "Marketing" "Marketing" 1 \
    "Newsletter" "Newsletter"  1 \
    3>&1 1>&2 2>&3)

    echo "You selected: $category"

    #$id=$((id+1))

    echo "$id|$email|$subject|$body|$category|0" >> "$FILE"
    echo "✅ New record saved: $id|$email|$subject|$body|$category|0"
}

view_all_emails() {
    echo " View All Emails"
    message=$(<"$FILE")
    whiptail --msgbox --title "All Emails" "$message" 0 0
}

edit_email() {
    # ดึงรายการ ID และ Subject มาโชว์ให้เลือก
    options=()
    while IFS="|" read -r id email subject body category sent; do
        options+=("$id" "$email")
    done < "$FILE"

    choice=$(whiptail --menu "Select Email ID to edit" 20 70 10 "${options[@]}" 3>&1 1>&2 2>&3) || return

    # อ่านข้อมูลบรรทัดที่เลือก
    line=$(grep "^$choice|" "$FILE")
    IFS="|" read -r id email subject body category sent <<< "$line"

    # ให้แก้ไข
    email=$(whiptail --inputbox "Edit email:" 10 50 "$email" 3>&1 1>&2 2>&3)

    # เขียนไฟล์ใหม่ (แทนที่บรรทัดเก่า)
    tmpfile=$(mktemp)
    grep -v "^$choice|" "$FILE" > "$tmpfile"
    echo "$id|$email|$subject|$body|$category|$sent" >> "$tmpfile"
    mv "$tmpfile" "$FILE"

    whiptail --msgbox "Email $email updated successfully!" 10 50
}

delete_email() {
      echo "Delete Email "
      id="$(whiptail --inputbox "Enter ID to delete:" 10 30 "" 3>&1 1>&2 2>&3)"
          if grep -q "^$id|" "$FILE"; then
              sed -i "/^$id|/d" "$FILE"
               whiptail --msgbox "✅ Email with ID $id deleted." 10 40
          else
              whiptail --msgbox "❌ ID $id not found." 10 40
          fi

}

while true
do
  result=$(whiptail \
    --menu "Email Scheduler" 0 0 5 \
    "create" "1. Add New Email" \
    "show"   "2. View All Emails" \
    "edit"   "3. Edit Email" \
    "delete" "4. Delete Email" \
    "exit"   "5. Exit" \
    3>&1 1>&2 2>&3)

  case "$result" in
    create)
      add_new_email
      ;;
    show)
      view_all_emails
      ;;
    edit)
      edit_email
      ;;
    delete)
      delete_email
      ;;
    exit)
      echo "Bye!"
      break
      ;;
    *)
      echo "Invalid choice"
      ;;
  esac
done