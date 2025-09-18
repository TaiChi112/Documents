# Sequence Diagram สำหรับ UCD1: ระบบเข้าสู่ระบบสำหรับนักศึกษา

ต่อไปนี้เป็น Sequence Diagram ที่แสดงขั้นตอนการทำงานของระบบเข้าสู่ระบบสำหรับนักศึกษาตาม UCD1

## Sequence Diagram หลักของระบบเข้าสู่ระบบสำหรับนักศึกษา

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant System as ระบบตรวจสอบ
    participant EService as ระบบ E-Service มหาวิทยาลัย
    participant RecSystem as ระบบแนะนำรายวิชา
    
    Student->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>Student: 2. แสดงหน้าจอเข้าสู่ระบบสำหรับนักศึกษา
    Student->>LoginPage: 3. กรอกรหัสนักศึกษาและรหัสผ่าน
    LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
    System->>EService: 5. เชื่อมต่อกับฐานข้อมูล E-Service
    EService->>System: 6. ตรวจสอบความถูกต้องของรหัสนักศึกษาและรหัสผ่าน
    
    alt เข้าสู่ระบบสำเร็จ
        EService-->>System: 7. ยืนยันข้อมูลถูกต้อง
        System-->>LoginPage: 8. แจ้งผลการเข้าสู่ระบบสำเร็จ
        LoginPage-->>Student: 9. แสดงข้อความแจ้งเข้าสู่ระบบสำเร็จ
        System->>RecSystem: 10. เริ่มการทำงานของระบบแนะนำรายวิชา
        RecSystem-->>Student: 11. แสดงหน้าแนะนำรายวิชา
    else เข้าสู่ระบบไม่สำเร็จ
        EService-->>System: 7. แจ้งข้อมูลไม่ถูกต้อง
        System-->>LoginPage: 8. แจ้งผลการเข้าสู่ระบบไม่สำเร็จ
        LoginPage-->>Student: 9. แสดงข้อความแจ้งเตือนว่าเข้าสู่ระบบไม่สำเร็จ
        LoginPage-->>Student: 10. ระบบให้กรอกข้อมูลใหม่อีกครั้ง
    end
```

## Sequence Diagram กรณีลืมรหัสผ่าน

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant ForgotPwd as หน้ารีเซ็ตรหัสผ่าน
    participant System as ระบบจัดการผู้ใช้
    participant EService as ระบบ E-Service มหาวิทยาลัย
    participant EmailService as ระบบส่งอีเมล
    
    Student->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>Student: 2. แสดงหน้าจอเข้าสู่ระบบสำหรับนักศึกษา
    Student->>LoginPage: 3. คลิกที่ "ลืมรหัสผ่าน"
    LoginPage->>ForgotPwd: 4. เปิดหน้ารีเซ็ตรหัสผ่าน
    ForgotPwd-->>Student: 5. แสดงฟอร์มรีเซ็ตรหัสผ่าน
    Student->>ForgotPwd: 6. กรอกข้อมูลสำหรับการรีเซ็ตรหัสผ่าน (รหัสนักศึกษา/อีเมล)
    ForgotPwd->>System: 7. ส่งข้อมูลเพื่อตรวจสอบ
    System->>EService: 8. ตรวจสอบข้อมูลกับระบบ E-Service
    
    alt ข้อมูลถูกต้อง
        EService-->>System: 9. ยืนยันข้อมูลถูกต้อง
        System->>EmailService: 10. สร้างลิงก์รีเซ็ตรหัสผ่าน
        EmailService->>System: 11. ลิงก์รีเซ็ตรหัสผ่านถูกสร้างสำเร็จ
        System->>EmailService: 12. ส่งอีเมลพร้อมลิงก์รีเซ็ตรหัสผ่าน
        EmailService-->>Student: 13. ส่งอีเมลไปยังผู้ใช้
        System-->>ForgotPwd: 14. แจ้งผลการดำเนินการ
        ForgotPwd-->>Student: 15. แสดงข้อความให้ตรวจสอบอีเมล
    else ข้อมูลไม่ถูกต้อง
        EService-->>System: 9. แจ้งข้อมูลไม่ถูกต้อง
        System-->>ForgotPwd: 10. แจ้งผลการดำเนินการ
        ForgotPwd-->>Student: 11. แสดงข้อความแจ้งเตือนว่าไม่พบข้อมูล
    end
```

## Sequence Diagram กรณีเกิดข้อผิดพลาดในการเชื่อมต่อ

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant System as ระบบตรวจสอบ
    participant EService as ระบบ E-Service มหาวิทยาลัย
    
    Student->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>Student: 2. แสดงหน้าจอเข้าสู่ระบบสำหรับนักศึกษา
    Student->>LoginPage: 3. กรอกรหัสนักศึกษาและรหัสผ่าน
    LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
    System->>EService: 5. พยายามเชื่อมต่อกับฐานข้อมูล E-Service
    
    alt ระบบ E-Service ไม่ตอบสนอง
        EService--xSystem: 6. ไม่สามารถเชื่อมต่อได้ (Timeout)
        System-->>LoginPage: 7. แจ้งว่าไม่สามารถเชื่อมต่อกับระบบได้
        LoginPage-->>Student: 8. แสดงข้อความแจ้งเตือนให้ลองใหม่ภายหลัง
    else ไม่พบบัญชีผู้ใช้งาน
        EService-->>System: 6. แจ้งว่าไม่พบบัญชีผู้ใช้งาน
        System-->>LoginPage: 7. แจ้งว่าไม่พบบัญชีผู้ใช้งาน
        LoginPage-->>Student: 8. แสดงข้อความแจ้งเตือนและแนะนำให้ติดต่อผู้ดูแลระบบ
    end
```

## Sequence Diagram ภาพรวมของกระบวนการทั้งหมด

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant ForgotPwd as หน้ารีเซ็ตรหัสผ่าน
    participant System as ระบบตรวจสอบ
    participant EService as ระบบ E-Service มหาวิทยาลัย
    participant RecSystem as ระบบแนะนำรายวิชา
    participant EmailService as ระบบส่งอีเมล
    
    Student->>LoginPage: 1. เปิดหน้าเข้าสู่ระบบ
    LoginPage-->>Student: 2. แสดงหน้าจอเข้าสู่ระบบสำหรับนักศึกษา
    
    alt กรณีเข้าสู่ระบบ
        Student->>LoginPage: 3. กรอกรหัสนักศึกษาและรหัสผ่าน
        LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
        System->>EService: 5. เชื่อมต่อกับฐานข้อมูล E-Service
        EService->>System: 6. ตรวจสอบความถูกต้องของข้อมูล
        
        alt เข้าสู่ระบบสำเร็จ
            EService-->>System: 7. ยืนยันข้อมูลถูกต้อง
            System-->>LoginPage: 8. แจ้งผลการเข้าสู่ระบบสำเร็จ
            LoginPage-->>Student: 9. แสดงข้อความแจ้งเข้าสู่ระบบสำเร็จ
            System->>RecSystem: 10. เริ่มการทำงานของระบบแนะนำรายวิชา
            RecSystem-->>Student: 11. แสดงหน้าแนะนำรายวิชา
        else เข้าสู่ระบบไม่สำเร็จ
            EService-->>System: 7. แจ้งข้อมูลไม่ถูกต้อง
            System-->>LoginPage: 8. แจ้งผลการเข้าสู่ระบบไม่สำเร็จ
            LoginPage-->>Student: 9. แสดงข้อความแจ้งเตือน
            LoginPage-->>Student: 10. ระบบให้กรอกข้อมูลใหม่อีกครั้ง
        end
    else กรณีลืมรหัสผ่าน
        Student->>LoginPage: 3. คลิกที่ "ลืมรหัสผ่าน"
        LoginPage->>ForgotPwd: 4. เปิดหน้ารีเซ็ตรหัสผ่าน
        ForgotPwd-->>Student: 5. แสดงฟอร์มรีเซ็ตรหัสผ่าน
        Student->>ForgotPwd: 6. กรอกข้อมูลสำหรับการรีเซ็ตรหัสผ่าน
        ForgotPwd->>System: 7. ส่งข้อมูลเพื่อตรวจสอบ
        System->>EService: 8. ตรวจสอบข้อมูล
        EService-->>System: 9. ยืนยันข้อมูลถูกต้อง
        System->>EmailService: 10. สร้างและส่งอีเมลพร้อมลิงก์รีเซ็ตรหัสผ่าน
        EmailService-->>Student: 11. ส่งอีเมลไปยังผู้ใช้
        System-->>ForgotPwd: 12. แจ้งผลการดำเนินการ
        ForgotPwd-->>Student: 13. แสดงข้อความให้ตรวจสอบอีเมล
    end
```