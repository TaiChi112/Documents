#!/bin/bash

# โหลดตัวแปรจากไฟล์ .env.local
[ -f .env ] && source .env
# ข้อความแนะนำ
echo "Sending test email with Mailtrap API..."

# กำหนดค่า API Token และ Sandbox ID
curl --location --request POST "https://sandbox.api.mailtrap.io/api/send/$SANDBOX_ID" \
  --header "Authorization: Bearer $API_TOKEN" \
  --header "Content-Type: application/json" \
  --data-raw '{
    "from": {
      "email": "sender@example.com",
      "name": "Mailtrap Test"
    },
    "to": [
      {
        "email": "receiver@example.com"
      }
    ],
    "subject": "You are awesome!",
    "text": "Congrats for sending test email with Mailtrap!",
    "category": "Integration Test"
  }'