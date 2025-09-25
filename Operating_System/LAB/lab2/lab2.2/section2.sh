#!/bin/bash

INPUT_FILE="/home/c/cos3105/lab_2_2/emails.txt"

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
            echo "$ID|$EMAIL|$SUBJECT|$BODY|$CATEGORY|"
        else
            echo "อีเมล ID $ID ส่งไม่สำเร็จ ❌ (HTTP $RESPONSE)"
            echo "$ID|$EMAIL|$SUBJECT|$BODY|$CATEGORY|$SENT" 
        fi
    fi
done

touch "/home/c/cos3105/lab_2_2/log/log_$(date +"%Y_%m_%d_%H_%M_%S.txt")"
#* * * * * /home/c/cos3105/lab_2_2/lab_2_2_2.sh >> /home/c/cos3105/lab_2_2/lab_2_2_2_output.log 2>&1