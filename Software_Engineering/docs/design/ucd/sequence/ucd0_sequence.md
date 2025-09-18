# Sequence Diagram สำหรับ UCD0: ระบบแนะนำการลงทะเบียนเรียน

ต่อไปนี้เป็น Sequence Diagram ที่แสดงภาพรวมของการทำงานของระบบแนะนำการลงทะเบียนเรียนตาม UCD0

## Sequence Diagram ของนักศึกษา (Student)

```mermaid
sequenceDiagram
    actor Student
    participant LoginPage as หน้าเข้าสู่ระบบนักศึกษา
    participant System as ระบบหลัก
    participant Dashboard as หน้าหลักของนักศึกษา
    participant CourseRecSys as ระบบแนะนำรายวิชา
    participant CourseDetail as รายละเอียดรายวิชา
    participant Database as ฐานข้อมูล
    
    Student->>LoginPage: 1. เข้าสู่หน้าเข้าสู่ระบบนักศึกษา
    LoginPage->>Student: 2. แสดงฟอร์มเข้าสู่ระบบ
    Student->>LoginPage: 3. กรอกรหัสนักศึกษาและรหัสผ่าน
    LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
    System->>Database: 5. ตรวจสอบความถูกต้องของข้อมูล
    Database-->>System: 6. ผลการตรวจสอบ
    
    alt เข้าสู่ระบบสำเร็จ
        System->>Dashboard: 7. เข้าสู่หน้าหลัก
        Dashboard-->>Student: 8. แสดงหน้าหลักของนักศึกษา
        Student->>CourseRecSys: 9. เลือกฟังก์ชันแนะนำรายวิชา
        CourseRecSys->>Database: 10. ดึงข้อมูลนักศึกษาและรายวิชา
        Database-->>CourseRecSys: 11. ส่งข้อมูล
        CourseRecSys->>Student: 12. แสดงรายวิชาแนะนำ
        Student->>CourseDetail: 13. เลือกดูรายละเอียดรายวิชา
        CourseDetail->>Database: 14. ดึงข้อมูลรายวิชา
        Database-->>CourseDetail: 15. ส่งข้อมูลรายวิชา
        CourseDetail-->>Student: 16. แสดงรายละเอียดรายวิชา
        Student->>CourseRecSys: 17. เลือกรายวิชา
        CourseRecSys->>Database: 18. บันทึกรายวิชาที่เลือก
        Database-->>CourseRecSys: 19. ยืนยันการบันทึก
        CourseRecSys-->>Student: 20. แจ้งบันทึกสำเร็จ
    else เข้าสู่ระบบไม่สำเร็จ
        System-->>LoginPage: 7. แจ้งเตือนข้อมูลไม่ถูกต้อง
        LoginPage-->>Student: 8. แสดงข้อความแจ้งเตือน
    end
```

## Sequence Diagram ของอาจารย์และผู้ดูแลระบบ (Professor & Admin)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant LoginPage as หน้าเข้าสู่ระบบ
    participant System as ระบบหลัก
    participant Dashboard as หน้าหลักของผู้ใช้งาน
    participant CourseList as รายการวิชา
    participant CourseForm as หน้าฟอร์มจัดการรายวิชา
    participant CourseDetail as รายละเอียดรายวิชา
    participant Database as ฐานข้อมูล
    
    User->>LoginPage: 1. เข้าสู่หน้าเข้าสู่ระบบ
    LoginPage->>User: 2. แสดงฟอร์มเข้าสู่ระบบ
    User->>LoginPage: 3. กรอกชื่อผู้ใช้และรหัสผ่าน
    LoginPage->>System: 4. ส่งข้อมูลเพื่อตรวจสอบ
    System->>Database: 5. ตรวจสอบความถูกต้องของข้อมูล
    Database-->>System: 6. ผลการตรวจสอบ
    
    alt เข้าสู่ระบบสำเร็จ
        System->>Dashboard: 7. เข้าสู่หน้าหลัก
        Dashboard-->>User: 8. แสดงหน้าหลักของผู้ใช้งาน
        
        alt ดูรายการวิชา
            User->>CourseList: 9. เลือกฟังก์ชันแสดงรายการวิชา
            CourseList->>Database: 10. ดึงข้อมูลรายวิชาทั้งหมด
            Database-->>CourseList: 11. ส่งข้อมูลรายวิชา
            CourseList-->>User: 12. แสดงรายการวิชาทั้งหมด
            User->>CourseDetail: 13. เลือกดูรายละเอียดรายวิชา
            CourseDetail->>Database: 14. ดึงข้อมูลรายวิชา
            Database-->>CourseDetail: 15. ส่งข้อมูลรายวิชา
            CourseDetail-->>User: 16. แสดงรายละเอียดรายวิชา
        else เพิ่มรายวิชาใหม่
            User->>CourseForm: 9. เลือกฟังก์ชันเพิ่มรายวิชาใหม่
            CourseForm-->>User: 10. แสดงฟอร์มกรอกข้อมูลรายวิชา
            User->>CourseForm: 11. กรอกข้อมูลรายวิชาและยืนยัน
            CourseForm->>Database: 12. ตรวจสอบความถูกต้องและบันทึกข้อมูล
            alt บันทึกสำเร็จ
                Database-->>CourseForm: 13. ยืนยันการบันทึกสำเร็จ
                CourseForm-->>User: 14. แจ้งบันทึกสำเร็จ
            else บันทึกไม่สำเร็จ
                Database-->>CourseForm: 13. แจ้งข้อผิดพลาด
                CourseForm-->>User: 14. แสดงข้อความแจ้งเตือน
            end
        end
    else เข้าสู่ระบบไม่สำเร็จ
        System-->>LoginPage: 7. แจ้งเตือนข้อมูลไม่ถูกต้อง
        LoginPage-->>User: 8. แสดงข้อความแจ้งเตือน
    end
```

## Sequence Diagram ภาพรวมของระบบ (Overview)

```mermaid
sequenceDiagram
    actor Student
    actor Professor
    actor Admin
    participant System as ระบบแนะนำการลงทะเบียน
    participant Database as ฐานข้อมูล
    
    Student->>System: 1. เข้าสู่ระบบสำหรับนักศึกษา
    System->>Database: 2. ตรวจสอบข้อมูล
    Database-->>System: 3. ผลการตรวจสอบ
    System-->>Student: 4. แสดงผลการเข้าสู่ระบบ
    
    Student->>System: 5. ขอคำแนะนำรายวิชา
    System->>Database: 6. วิเคราะห์ข้อมูลนักศึกษา
    Database-->>System: 7. ส่งข้อมูลรายวิชาแนะนำ
    System-->>Student: 8. แสดงรายวิชาแนะนำ
    
    Student->>System: 9. ขอดูรายละเอียดรายวิชา
    Professor->>System: 10. ขอดูรายละเอียดรายวิชา
    Admin->>System: 11. ขอดูรายละเอียดรายวิชา
    System->>Database: 12. ดึงข้อมูลรายวิชา
    Database-->>System: 13. ส่งข้อมูลรายวิชา
    System-->>Student: 14. แสดงรายละเอียดรายวิชา
    System-->>Professor: 15. แสดงรายละเอียดรายวิชา
    System-->>Admin: 16. แสดงรายละเอียดรายวิชา
    
    Professor->>System: 17. เข้าสู่ระบบสำหรับอาจารย์
    Admin->>System: 18. เข้าสู่ระบบสำหรับผู้ดูแล
    System->>Database: 19. ตรวจสอบข้อมูล
    Database-->>System: 20. ผลการตรวจสอบ
    System-->>Professor: 21. แสดงผลการเข้าสู่ระบบ
    System-->>Admin: 22. แสดงผลการเข้าสู่ระบบ
    
    Professor->>System: 23. ขอดูรายการวิชาทั้งหมด
    Admin->>System: 24. ขอดูรายการวิชาทั้งหมด
    System->>Database: 25. ดึงข้อมูลรายวิชาทั้งหมด
    Database-->>System: 26. ส่งข้อมูลรายวิชาทั้งหมด
    System-->>Professor: 27. แสดงรายการวิชาทั้งหมด
    System-->>Admin: 28. แสดงรายการวิชาทั้งหมด
    
    Professor->>System: 29. เพิ่มรายวิชาใหม่
    Admin->>System: 30. เพิ่มรายวิชาใหม่
    System->>Database: 31. บันทึกรายวิชาใหม่
    Database-->>System: 32. ยืนยันการบันทึกสำเร็จ
    System-->>Professor: 33. แจ้งบันทึกสำเร็จ
    System-->>Admin: 34. แจ้งบันทึกสำเร็จ
```