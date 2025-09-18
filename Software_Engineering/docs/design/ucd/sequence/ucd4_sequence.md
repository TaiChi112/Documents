# Sequence Diagram สำหรับ UCD4: ระบบเข้าสู่ระบบสำหรับอาจารย์และผู้ดูแลระบบ

ต่อไปนี้เป็น Sequence Diagram ที่แสดงขั้นตอนการทำงานของระบบเข้าสู่ระบบสำหรับอาจารย์และผู้ดูแลระบบตาม UCD4

## Sequence Diagram หลักสำหรับการเข้าสู่ระบบของอาจารย์และผู้ดูแลระบบ

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant System as ระบบตรวจสอบ
    participant Database as ฐานข้อมูลผู้ใช้
    participant Dashboard as หน้าหลัก
    participant CourseList as หน้ารายการวิชา
    
    User->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>User: 2. แสดงหน้าจอเข้าสู่ระบบสำหรับอาจารย์และผู้ดูแลระบบ
    User->>LoginPage: 3. กรอกชื่อผู้ใช้และรหัสผ่าน
    LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
    System->>Database: 5. ตรวจสอบความถูกต้องของชื่อผู้ใช้และรหัสผ่าน
    Database-->>System: 6. ส่งผลการตรวจสอบความถูกต้อง
    System->>Database: 7. ตรวจสอบสิทธิ์ผู้ใช้งาน (อาจารย์/ผู้ดูแลระบบ)
    Database-->>System: 8. ส่งข้อมูลสิทธิ์ผู้ใช้งาน
    
    alt เข้าสู่ระบบสำเร็จ
        System-->>LoginPage: 9. แจ้งผลการเข้าสู่ระบบสำเร็จ
        LoginPage-->>User: 10. แสดงข้อความแจ้งเข้าสู่ระบบสำเร็จ
        System->>Dashboard: 11. ส่งข้อมูลผู้ใช้ไปยังหน้าหลัก
        Dashboard-->>User: 12. แสดงหน้าหลัก
        Dashboard->>CourseList: 13. นำทางไปยังหน้ารายการวิชาทั้งหมด
        CourseList-->>User: 14. แสดงหน้ารายการวิชาทั้งหมด
    else เข้าสู่ระบบไม่สำเร็จ
        System-->>LoginPage: 9. แจ้งผลการเข้าสู่ระบบไม่สำเร็จ
        LoginPage-->>User: 10. แสดงข้อความแจ้งเตือนว่าเข้าสู่ระบบไม่สำเร็จ
        LoginPage-->>User: 11. ระบบให้กรอกข้อมูลใหม่อีกครั้ง
    end
```

## Sequence Diagram กรณีลืมรหัสผ่าน

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant ForgotPwd as หน้ารีเซ็ตรหัสผ่าน
    participant System as ระบบจัดการผู้ใช้
    participant Database as ฐานข้อมูลผู้ใช้
    participant EmailService as ระบบส่งอีเมล
    
    User->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>User: 2. แสดงหน้าจอเข้าสู่ระบบสำหรับอาจารย์และผู้ดูแลระบบ
    User->>LoginPage: 3. คลิกที่ "ลืมรหัสผ่าน"
    LoginPage->>ForgotPwd: 4. เปิดหน้ารีเซ็ตรหัสผ่าน
    ForgotPwd-->>User: 5. แสดงหน้าสำหรับรีเซ็ตรหัสผ่าน
    User->>ForgotPwd: 6. กรอกอีเมล
    ForgotPwd->>System: 7. ส่งข้อมูลอีเมลเพื่อตรวจสอบ
    System->>Database: 8. ตรวจสอบว่าอีเมลมีอยู่ในระบบหรือไม่
    
    alt อีเมลมีอยู่ในระบบ
        Database-->>System: 9. ยืนยันว่าอีเมลมีอยู่ในระบบ
        System->>EmailService: 10. สร้างลิงก์รีเซ็ตรหัสผ่าน
        EmailService-->>System: 11. ลิงก์รีเซ็ตรหัสผ่านถูกสร้างสำเร็จ
        System->>EmailService: 12. ส่งอีเมลพร้อมลิงก์รีเซ็ตรหัสผ่าน
        EmailService-->>User: 13. ส่งอีเมลไปยังผู้ใช้
        System-->>ForgotPwd: 14. แจ้งผลการดำเนินการสำเร็จ
        ForgotPwd-->>User: 15. แสดงข้อความให้ตรวจสอบอีเมล
    else อีเมลไม่มีอยู่ในระบบ
        Database-->>System: 9. แจ้งว่าไม่พบอีเมลในระบบ
        System-->>ForgotPwd: 10. แจ้งผลการดำเนินการ
        ForgotPwd-->>User: 11. แสดงข้อความแจ้งว่าไม่พบอีเมลในระบบ
    end
```

## Sequence Diagram กรณีเข้าสู่ระบบครั้งแรก

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant System as ระบบตรวจสอบ
    participant Database as ฐานข้อมูลผู้ใช้
    participant ChangePwd as หน้าเปลี่ยนรหัสผ่าน
    participant Dashboard as หน้าหลัก
    
    User->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>User: 2. แสดงหน้าจอเข้าสู่ระบบสำหรับอาจารย์และผู้ดูแลระบบ
    User->>LoginPage: 3. กรอกชื่อผู้ใช้และรหัสผ่านชั่วคราว
    LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
    System->>Database: 5. ตรวจสอบความถูกต้องของชื่อผู้ใช้และรหัสผ่าน
    Database-->>System: 6. ส่งผลการตรวจสอบความถูกต้อง
    System->>Database: 7. ตรวจสอบสถานะการเข้าสู่ระบบครั้งแรก
    Database-->>System: 8. แจ้งว่าเป็นการเข้าสู่ระบบครั้งแรก
    
    System->>ChangePwd: 9. เปิดหน้าเปลี่ยนรหัสผ่าน
    ChangePwd-->>User: 10. แสดงหน้าเปลี่ยนรหัสผ่านชั่วคราว
    User->>ChangePwd: 11. กรอกรหัสผ่านใหม่และยืนยัน
    ChangePwd->>System: 12. ส่งข้อมูลรหัสผ่านใหม่
    System->>Database: 13. บันทึกรหัสผ่านใหม่
    Database-->>System: 14. แจ้งผลการบันทึกรหัสผ่าน
    System-->>ChangePwd: 15. แจ้งผลการเปลี่ยนรหัสผ่านสำเร็จ
    ChangePwd-->>User: 16. แสดงข้อความเปลี่ยนรหัสผ่านสำเร็จ
    System->>Dashboard: 17. นำทางไปยังหน้าหลัก
    Dashboard-->>User: 18. แสดงหน้าหลัก
```

## Sequence Diagram กรณีระบบไม่ตอบสนอง (Exception)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant System as ระบบตรวจสอบ
    participant Database as ฐานข้อมูลผู้ใช้
    
    User->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>User: 2. แสดงหน้าจอเข้าสู่ระบบสำหรับอาจารย์และผู้ดูแลระบบ
    User->>LoginPage: 3. กรอกชื่อผู้ใช้และรหัสผ่าน
    LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
    System->>Database: 5. พยายามเชื่อมต่อกับฐานข้อมูล
    
    alt ระบบฐานข้อมูลไม่ตอบสนอง
        Database--xSystem: 6. ไม่สามารถเชื่อมต่อได้ (Timeout)
        System-->>LoginPage: 7. แจ้งว่าไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้
        LoginPage-->>User: 8. แสดงข้อความแจ้งเตือนว่าไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้
        LoginPage-->>User: 9. แนะนำให้ลองใหม่ภายหลัง
    end
```

## Sequence Diagram กรณีบัญชีถูกระงับ (Exception)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant System as ระบบตรวจสอบ
    participant Database as ฐานข้อมูลผู้ใช้
    
    User->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>User: 2. แสดงหน้าจอเข้าสู่ระบบสำหรับอาจารย์และผู้ดูแลระบบ
    User->>LoginPage: 3. กรอกชื่อผู้ใช้และรหัสผ่าน
    LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
    System->>Database: 5. ตรวจสอบความถูกต้องของชื่อผู้ใช้และรหัสผ่าน
    Database-->>System: 6. ส่งผลการตรวจสอบความถูกต้อง
    System->>Database: 7. ตรวจสอบสถานะบัญชี
    Database-->>System: 8. แจ้งว่าบัญชีถูกระงับ
    
    System-->>LoginPage: 9. แจ้งว่าบัญชีถูกระงับ
    LoginPage-->>User: 10. แสดงข้อความแจ้งเตือนว่าบัญชีถูกระงับ
    LoginPage-->>User: 11. แนะนำให้ติดต่อผู้ดูแลระบบหลัก
```

## Sequence Diagram ภาพรวมของระบบเข้าสู่ระบบสำหรับอาจารย์และผู้ดูแลระบบ

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant ForgotPwd as หน้ารีเซ็ตรหัสผ่าน
    participant System as ระบบตรวจสอบ
    participant Database as ฐานข้อมูลผู้ใช้
    participant EmailService as ระบบส่งอีเมล
    participant ChangePwd as หน้าเปลี่ยนรหัสผ่าน
    participant Dashboard as หน้าหลัก
    participant CourseList as หน้ารายการวิชา
    
    User->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>User: 2. แสดงหน้าจอเข้าสู่ระบบ
    
    alt กรณีเข้าสู่ระบบปกติ
        User->>LoginPage: 3. กรอกชื่อผู้ใช้และรหัสผ่าน
        LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
        System->>Database: 5. ตรวจสอบข้อมูลผู้ใช้และสิทธิ์
        Database-->>System: 6. ส่งผลการตรวจสอบ
        
        alt เข้าสู่ระบบสำเร็จ
            System-->>LoginPage: 7. แจ้งผลการเข้าสู่ระบบสำเร็จ
            LoginPage-->>User: 8. แสดงข้อความแจ้งเข้าสู่ระบบสำเร็จ
            System->>Dashboard: 9. นำทางไปยังหน้าหลัก
            Dashboard-->>User: 10. แสดงหน้าหลัก
            Dashboard->>CourseList: 11. นำทางไปยังหน้ารายการวิชา
            CourseList-->>User: 12. แสดงหน้ารายการวิชา
        else บัญชีถูกระงับ
            Database-->>System: 7. แจ้งว่าบัญชีถูกระงับ
            System-->>LoginPage: 8. แจ้งว่าบัญชีถูกระงับ
            LoginPage-->>User: 9. แสดงข้อความแจ้งเตือนและแนะนำให้ติดต่อผู้ดูแลระบบหลัก
        else เข้าสู่ระบบครั้งแรก
            Database-->>System: 7. แจ้งว่าเป็นการเข้าสู่ระบบครั้งแรก
            System->>ChangePwd: 8. เปิดหน้าเปลี่ยนรหัสผ่าน
            ChangePwd-->>User: 9. แสดงหน้าเปลี่ยนรหัสผ่าน
            User->>ChangePwd: 10. กรอกรหัสผ่านใหม่
            ChangePwd->>System: 11. บันทึกรหัสผ่านใหม่
            System->>Dashboard: 12. นำทางไปยังหน้าหลัก
            Dashboard-->>User: 13. แสดงหน้าหลัก
        else เข้าสู่ระบบไม่สำเร็จ
            Database-->>System: 7. แจ้งว่าข้อมูลไม่ถูกต้อง
            System-->>LoginPage: 8. แจ้งผลการเข้าสู่ระบบไม่สำเร็จ
            LoginPage-->>User: 9. แสดงข้อความแจ้งเตือนและให้กรอกข้อมูลใหม่
        end
    else กรณีลืมรหัสผ่าน
        User->>LoginPage: 3. คลิกที่ "ลืมรหัสผ่าน"
        LoginPage->>ForgotPwd: 4. เปิดหน้ารีเซ็ตรหัสผ่าน
        ForgotPwd-->>User: 5. แสดงฟอร์มรีเซ็ตรหัสผ่าน
        User->>ForgotPwd: 6. กรอกอีเมล
        ForgotPwd->>System: 7. ส่งข้อมูลอีเมล
        System->>Database: 8. ตรวจสอบอีเมล
        Database-->>System: 9. ยืนยันอีเมลมีอยู่ในระบบ
        System->>EmailService: 10. สร้างและส่งลิงก์รีเซ็ตรหัสผ่าน
        EmailService-->>User: 11. ส่งอีเมลลิงก์รีเซ็ตรหัสผ่าน
        System-->>ForgotPwd: 12. แจ้งผลการส่งอีเมล
        ForgotPwd-->>User: 13. แสดงข้อความแจ้งให้ตรวจสอบอีเมล
    end
```