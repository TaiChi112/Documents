#!/bin/bash

FILE="/home/c/cos3105/lab_2_2/emails.txt"
TMP_FILE="/tmp/emails_tmp.txt"

add_new_email() {
    while true; do
        email="$(whiptail --inputbox "Enter your email?" 10 30 3>&1 1>&2 2>&3)"

        # ถ้ากด Cancel
        if [ $? -ne 0 ]; then
            echo "User cancelled"
            return
        fi

        # ตรวจสอบว่ามี @ อยู่หรือไม่
        if [[ "$email" == *"@"* ]]; then
            printf "Your email is : %s\n" "${email}"
            break
        else
            whiptail --msgbox "Invalid email. Please enter again (must contain @)." 10 40
        fi
    done

    while true; do
        subject="$(whiptail --inputbox "Enter your subject?" 10 30 3>&1 1>&2 2>&3)"

        # ถ้ากด Cancel
        if [ $? -ne 0 ]; then
            echo "User cancelled"
            return
        fi

        # ตรวจสอบว่าไม่ว่าง
        if [ -n "$subject" ]; then
            printf "Your subject is : %s\n" "${subject}"
            break
        else
            whiptail --msgbox "Subject cannot be empty. Please enter again." 10 40
        fi
    done


    while true; do
        body="$(whiptail --inputbox "Enter your note:" 10 40 "" 3>&1 1>&2 2>&3)"

        if [ $? -ne 0 ]; then
            echo "User cancelled"
            return
        fi

        if [ -n "$body" ]; then
            echo "You typed: $body"
            break
        else
            whiptail --msgbox "Note cannot be empty. Please enter again." 10 40
        fi
    done

    category=$(whiptail \
    --radiolist "Select Category" 0 0 3 \
    "Personal" "personal" 1 \
    "Work"  "Work"  1 \
    "Marketing" "Marketing" 1 \
    "Newsletter" "Newsletter"  1 \
    3>&1 1>&2 2>&3)

    echo "You selected: $category"

    id=2
    id=$((id+1))

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

    choice=$(whiptail --menu "Select Email ID to edit" 0 0 0 "${options[@]}" 3>&1 1>&2 2>&3) || return

    # อ่านข้อมูลบรรทัดที่เลือก
    line=$(grep "^$choice|" "$FILE")
    IFS="|" read -r id email subject body category sent <<< "$line"

    # ให้แก้ไข
    email=$(whiptail --inputbox "Edit email:" 10 40 "$email" 3>&1 1>&2 2>&3)

    # เขียนไฟล์ใหม่ (แทนที่บรรทัดเก่า)
    tmpfile=$(mktemp)
    grep -v "^$choice|" "$FILE" > "$tmpfile"
    echo "$id|$email|$subject|$body|$category|$sent" >> "$tmpfile"
    mv "$tmpfile" "$FILE"

    whiptail --msgbox "Email $email updated successfully!" 10 40
}

delete_email() {
      echo "Delete Email "
      id="$(whiptail --inputbox "Enter ID to delete:" 10 40 "" 3>&1 1>&2 2>&3)"
          if grep -q "^$id|" "$FILE"; then
              sed -i "/^$id|/d" "$FILE"
               whiptail --msgbox "✅ Email with ID $id deleted." 10 40
          else
              whiptail --msgbox "❌ ID $id not found." 10 40
          fi

}

sent_email() {
INPUT_FILE="/home/c/cos3105/lab_2_2/emails.txt"
TMP_FILE=$(mktemp)

# copy header ไปก่อน
head -n 1 "$INPUT_FILE" > "$TMP_FILE"

# อ่านบรรทัดที่ SENT=0
tail -n +2 "$INPUT_FILE" | while IFS="|" read -r ID EMAIL SUBJECT BODY CATEGORY SENT; do
    if [ "$SENT" -eq 0 ]; then
        echo "ส่งอีเมลไปที่ $EMAIL (ID: $ID)"

        # เรียก API ส่งเมล
        RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" \
          --location --request POST \
          'https://sandbox.api.mailtrap.io/api/send/3997787' \
          --header 'Authorization: Bearer 451b9857109b55cfca028944174c97a2' \
          --header 'Content-Type: application/json' \
          --data-raw "{
            \"from\":{\"email\":\"hello@example.com\",\"name\":\"Mailtrap Test\"},
            \"to\":[{\"email\":\"$EMAIL\"}],
            \"subject\":\"$SUBJECT\",
            \"text\":\"$BODY\",
            \"category\":\"$CATEGORY\"
          }")

        # ถ้าส่งสำเร็จ (HTTP 200 หรือ 201)
        if [ "$RESPONSE" -eq 200 ] || [ "$RESPONSE" -eq 201 ]; then
            echo "อีเมล ID $ID ส่งสำเร็จ ✅"
            echo "$ID|$EMAIL|$SUBJECT|$BODY|$CATEGORY|1" >> "$TMP_FILE"
        else
            echo "อีเมล ID $ID ส่งไม่สำเร็จ ❌ (HTTP $RESPONSE)"
            echo "$ID|$EMAIL|$SUBJECT|$BODY|$CATEGORY|$SENT" >> "$TMP_FILE"
        fi
    else
        # แถวที่ส่งไปแล้วก็ copy ลงไปเหมือนเดิม
        echo "$ID|$EMAIL|$SUBJECT|$BODY|$CATEGORY|$SENT" >> "$TMP_FILE"
    fi
done

# เขียนไฟล์กลับ
mv "$TMP_FILE" "$INPUT_FILE"

touch "/home/c/cos3105/lab_2_2/log/log_3_$(date +"%Y_%m_%d_%H_%M_%S.txt")"
}

while true
do
  result=$(whiptail \
    --menu "Email Scheduler" 0 0 5 \
    "create" "1. Add New Email" \
    "show"   "2. View All Emails" \
    "edit"   "3. Edit Email" \
    "delete" "4. Delete Email" \
    "sent"   "5.sent Email"\
    "exit"   "6. Exit" \
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
    sent)
      sent_email
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