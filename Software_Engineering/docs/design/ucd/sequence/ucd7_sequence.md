# Sequence Diagram สำหรับ UCD7: แก้ไขรายวิชา

ต่อไปนี้เป็น Sequence Diagram ที่แสดงขั้นตอนการทำงานของระบบแก้ไขรายวิชาตาม UCD7

## Sequence Diagram หลักของการแก้ไขรายวิชา (Edit Courses)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant EditCoursePage as หน้าแก้ไขรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Validator as ระบบตรวจสอบข้อมูล
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. เลือกรายวิชาที่ต้องการแก้ไข
    CourseListPage->>CourseSystem: 2. ขอข้อมูลรายวิชาที่ต้องการแก้ไข
    CourseSystem->>Database: 3. ดึงข้อมูลรายวิชา
    Database-->>CourseSystem: 4. ส่งข้อมูลรายวิชา
    CourseSystem-->>EditCoursePage: 5. ส่งข้อมูลรายวิชา
    EditCoursePage-->>User: 6. แสดงฟอร์มแก้ไขข้อมูลพร้อมข้อมูลที่มีอยู่แล้ว
    
    User->>EditCoursePage: 7. แก้ไขข้อมูลรายวิชาส่วนที่ต้องการ
    EditCoursePage->>CourseSystem: 8. บันทึกข้อมูลที่แก้ไขชั่วคราว
    User->>EditCoursePage: 9. ยืนยันการแก้ไขข้อมูล
    EditCoursePage->>CourseSystem: 10. ส่งข้อมูลเพื่อตรวจสอบ
    CourseSystem->>Validator: 11. ตรวจสอบความถูกต้องและครบถ้วนของข้อมูล
    
    alt ข้อมูลถูกต้องและครบถ้วน
        Validator-->>CourseSystem: 12. ยืนยันข้อมูลถูกต้อง
        CourseSystem->>Database: 13. ตรวจสอบรหัสวิชาซ้ำ (กรณีมีการเปลี่ยนรหัสวิชา)
        
        alt ไม่มีรหัสวิชาซ้ำ
            Database-->>CourseSystem: 14. ยืนยันไม่มีรหัสวิชาซ้ำ
            CourseSystem->>Database: 15. บันทึกข้อมูลที่แก้ไขลงในฐานข้อมูล
            Database-->>CourseSystem: 16. ยืนยันการบันทึกข้อมูลสำเร็จ
            CourseSystem-->>EditCoursePage: 17. แจ้งผลการบันทึกสำเร็จ
            EditCoursePage-->>User: 18. แสดงข้อความยืนยันการแก้ไขสำเร็จ
            CourseSystem->>CourseListPage: 19. กลับไปยังหน้ารายการวิชา
            CourseListPage->>CourseSystem: 20. ขอข้อมูลรายวิชาที่อัพเดทแล้ว
            CourseSystem->>Database: 21. ดึงข้อมูลรายวิชาทั้งหมด
            Database-->>CourseSystem: 22. ส่งข้อมูลรายวิชาทั้งหมด
            CourseSystem-->>CourseListPage: 23. ส่งข้อมูลรายวิชาที่อัพเดทแล้ว
            CourseListPage-->>User: 24. แสดงรายการวิชาที่มีข้อมูลอัปเดตแล้ว
        else มีรหัสวิชาซ้ำ
            Database-->>CourseSystem: 14. แจ้งว่ามีรหัสวิชาซ้ำ
            CourseSystem-->>EditCoursePage: 15. แจ้งเตือนรหัสวิชาซ้ำ
            EditCoursePage-->>User: 16. แสดงข้อความแจ้งเตือนว่ามีรายวิชาที่ใช้รหัสนี้อยู่แล้ว
            EditCoursePage-->>User: 17. ให้ผู้ใช้เปลี่ยนรหัสวิชาหรือยกเลิกการเปลี่ยนรหัส
        end
    else ข้อมูลไม่ถูกต้องหรือไม่ครบถ้วน
        Validator-->>CourseSystem: 12. แจ้งข้อผิดพลาดของข้อมูล
        CourseSystem-->>EditCoursePage: 13. ส่งข้อผิดพลาด
        EditCoursePage-->>User: 14. แสดงข้อความแจ้งเตือนข้อผิดพลาด
        EditCoursePage-->>User: 15. ไฮไลท์ช่องกรอกข้อมูลที่มีปัญหา
        User->>EditCoursePage: 16. แก้ไขข้อมูล
        EditCoursePage->>CourseSystem: 17. ส่งข้อมูลที่แก้ไขเพื่อตรวจสอบอีกครั้ง
    end
```

## Sequence Diagram สำหรับการแสดงข้อมูลรายวิชาเดิม (Show Course Information)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant EditCoursePage as หน้าแก้ไขรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. เลือกรายวิชาที่ต้องการแก้ไข
    CourseListPage->>CourseSystem: 2. ส่งคำขอข้อมูลรายวิชา
    CourseSystem->>Database: 3. ดึงข้อมูลพื้นฐานของรายวิชา
    Database-->>CourseSystem: 4. ส่งข้อมูลพื้นฐานของรายวิชา
    CourseSystem->>Database: 5. ดึงข้อมูลเพิ่มเติม (ผู้สอน, ห้องเรียน)
    Database-->>CourseSystem: 6. ส่งข้อมูลเพิ่มเติม
    CourseSystem->>Database: 7. ดึงข้อมูลความสัมพันธ์กับรายวิชาอื่น
    Database-->>CourseSystem: 8. ส่งข้อมูลความสัมพันธ์
    
    CourseSystem-->>EditCoursePage: 9. ส่งข้อมูลรายวิชาทั้งหมด
    EditCoursePage-->>User: 10. แสดงข้อมูลรายวิชาบนฟอร์มการแก้ไข
    EditCoursePage-->>User: 11. ไฮไลท์ข้อมูลสำคัญที่อาจต้องได้รับการตรวจสอบ
```

## Sequence Diagram สำหรับการแก้ไขข้อมูลรายวิชา (Input Course Information)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant EditCoursePage as หน้าแก้ไขรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    
    Note over User,CourseSystem: หลังจากแสดงฟอร์มแก้ไขพร้อมข้อมูลเดิม
    
    User->>EditCoursePage: 1. แก้ไขรหัสวิชา (ถ้าต้องการ)
    User->>EditCoursePage: 2. แก้ไขชื่อวิชา (ถ้าต้องการ)
    User->>EditCoursePage: 3. แก้ไขหน่วยกิต (ถ้าต้องการ)
    User->>EditCoursePage: 4. แก้ไขคำอธิบายรายวิชา (ถ้าต้องการ)
    User->>EditCoursePage: 5. เปลี่ยนภาคการศึกษา (ถ้าต้องการ)
    User->>EditCoursePage: 6. แก้ไขผู้สอน (ถ้าต้องการ)
    User->>EditCoursePage: 7. แก้ไขจำนวนที่นั่ง (ถ้าต้องการ)
    User->>EditCoursePage: 8. แก้ไขห้องเรียนและเวลาเรียน (ถ้าต้องการ)
    User->>EditCoursePage: 9. แก้ไขวิชาที่ต้องเรียนก่อน (ถ้าต้องการ)
    
    alt มีการเปลี่ยนแปลงข้อมูล
        EditCoursePage->>CourseSystem: 10. บันทึกข้อมูลที่แก้ไขชั่วคราว
        CourseSystem-->>EditCoursePage: 11. ยืนยันการบันทึกข้อมูลชั่วคราว
        EditCoursePage-->>User: 12. แสดงการเปลี่ยนแปลง (ไฮไลท์ข้อมูลที่เปลี่ยนไป)
    end
```

## Sequence Diagram สำหรับการตรวจสอบความถูกต้องของข้อมูล (Validate Course Information)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant EditCoursePage as หน้าแก้ไขรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Validator as ระบบตรวจสอบข้อมูล
    
    User->>EditCoursePage: 1. ยืนยันการแก้ไขข้อมูล
    EditCoursePage->>CourseSystem: 2. ส่งข้อมูลที่แก้ไขเพื่อตรวจสอบ
    CourseSystem->>Validator: 3. เริ่มกระบวนการตรวจสอบข้อมูล
    
    Validator->>Validator: 4. ตรวจสอบรูปแบบรหัสวิชา (ถ้ามีการเปลี่ยนแปลง)
    Validator->>Validator: 5. ตรวจสอบความครบถ้วนของชื่อวิชา
    Validator->>Validator: 6. ตรวจสอบความถูกต้องของหน่วยกิต
    Validator->>Validator: 7. ตรวจสอบการกรอกคำอธิบายรายวิชา
    Validator->>Validator: 8. ตรวจสอบการเลือกภาคการศึกษา
    Validator->>Validator: 9. ตรวจสอบการเลือกผู้สอน
    Validator->>Validator: 10. ตรวจสอบจำนวนที่นั่ง
    Validator->>Validator: 11. ตรวจสอบข้อมูลห้องเรียนและเวลาเรียน
    
    alt ข้อมูลไม่ถูกต้องหรือไม่ครบถ้วน
        Validator-->>CourseSystem: 12. ส่งรายการข้อผิดพลาด
        CourseSystem-->>EditCoursePage: 13. แจ้งข้อผิดพลาด
        EditCoursePage-->>User: 14. แสดงข้อความแจ้งเตือนและไฮไลท์ช่องที่มีปัญหา
    else ข้อมูลถูกต้องและครบถ้วน
        Validator-->>CourseSystem: 12. ยืนยันข้อมูลถูกต้อง
        CourseSystem-->>EditCoursePage: 13. ข้อมูลผ่านการตรวจสอบ
    end
```

## Sequence Diagram สำหรับการบันทึกข้อมูลที่แก้ไข (Save Course Information)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant EditCoursePage as หน้าแก้ไขรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    participant CourseListPage as หน้าจัดการรายวิชา
    
    Note over User,Database: หลังจากตรวจสอบข้อมูลถูกต้องและไม่มีรหัสวิชาซ้ำ
    
    CourseSystem->>Database: 1. เริ่มการบันทึกการเปลี่ยนแปลง
    CourseSystem->>Database: 2. อัพเดทข้อมูลพื้นฐานของรายวิชา
    Database-->>CourseSystem: 3. ยืนยันการอัพเดทข้อมูลพื้นฐาน
    CourseSystem->>Database: 4. อัพเดทข้อมูลเพิ่มเติม (ผู้สอน, ห้องเรียน, เวลาเรียน)
    Database-->>CourseSystem: 5. ยืนยันการอัพเดทข้อมูลเพิ่มเติม
    CourseSystem->>Database: 6. อัพเดทความสัมพันธ์กับรายวิชาอื่น (วิชาที่ต้องเรียนก่อน)
    Database-->>CourseSystem: 7. ยืนยันการอัพเดทความสัมพันธ์
    
    CourseSystem-->>EditCoursePage: 8. แจ้งผลการบันทึกสำเร็จ
    EditCoursePage-->>User: 9. แสดงข้อความยืนยันการแก้ไขสำเร็จ
    
    alt กลับไปยังหน้ารายการวิชา
        User->>EditCoursePage: 10. เลือกกลับไปยังหน้ารายการวิชา
        EditCoursePage->>CourseListPage: 11. นำทางกลับไปยังหน้ารายการวิชา
        CourseListPage->>CourseSystem: 12. ขอข้อมูลรายการวิชาที่อัพเดทแล้ว
        CourseSystem->>Database: 13. ดึงข้อมูลรายวิชาทั้งหมด
        Database-->>CourseSystem: 14. ส่งข้อมูลรายวิชาทั้งหมด
        CourseSystem-->>CourseListPage: 15. ส่งข้อมูลรายวิชาที่อัพเดทแล้ว
        CourseListPage-->>User: 16. แสดงรายการวิชาทั้งหมดที่มีข้อมูลอัปเดตแล้ว
    else ดำเนินการแก้ไขรายวิชาอื่นต่อ
        User->>CourseListPage: 10. เลือกรายวิชาอื่นเพื่อแก้ไข
        Note over User,CourseListPage: เริ่มกระบวนการใหม่กับรายวิชาอื่น
    end
```

## Sequence Diagram กรณีรหัสวิชาซ้ำ (Exception)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant EditCoursePage as หน้าแก้ไขรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>EditCoursePage: 1. แก้ไขรหัสวิชาเป็นรหัสใหม่
    User->>EditCoursePage: 2. ยืนยันการแก้ไขข้อมูล
    EditCoursePage->>CourseSystem: 3. ส่งข้อมูลที่แก้ไขเพื่อตรวจสอบ
    CourseSystem->>Database: 4. ตรวจสอบรหัสวิชาซ้ำ
    Database-->>CourseSystem: 5. แจ้งว่ามีรายวิชาที่ใช้รหัสนี้อยู่แล้ว
    CourseSystem-->>EditCoursePage: 6. แจ้งเตือนรหัสวิชาซ้ำ
    EditCoursePage-->>User: 7. แสดงข้อความแจ้งเตือนว่ามีรายวิชาที่ใช้รหัสนี้อยู่แล้ว
    
    alt ผู้ใช้เลือกเปลี่ยนรหัสวิชาใหม่
        User->>EditCoursePage: 8. แก้ไขรหัสวิชาเป็นรหัสอื่น
        EditCoursePage->>CourseSystem: 9. ส่งข้อมูลเพื่อตรวจสอบอีกครั้ง
    else ผู้ใช้เลือกใช้รหัสวิชาเดิม
        User->>EditCoursePage: 8. กดปุ่มยกเลิกการเปลี่ยนรหัสวิชา
        EditCoursePage->>CourseSystem: 9. ขอรีเซ็ตรหัสวิชากลับเป็นรหัสเดิม
        CourseSystem-->>EditCoursePage: 10. ส่งรหัสวิชาเดิม
        EditCoursePage-->>User: 11. แสดงรหัสวิชาเดิมในฟอร์ม
    end
```

## Sequence Diagram กรณีการเชื่อมต่อฐานข้อมูลมีปัญหา (Exception)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant EditCoursePage as หน้าแก้ไขรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant LocalStorage as ระบบจัดเก็บข้อมูลชั่วคราว
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>EditCoursePage: 1. ยืนยันการแก้ไขข้อมูล
    EditCoursePage->>CourseSystem: 2. ส่งข้อมูลเพื่อบันทึก
    CourseSystem->>Database: 3. พยายามบันทึกข้อมูลลงฐานข้อมูล
    Database--xCourseSystem: 4. เกิดข้อผิดพลาดในการเชื่อมต่อ
    
    CourseSystem->>LocalStorage: 5. บันทึกข้อมูลการแก้ไขไว้ชั่วคราว
    LocalStorage-->>CourseSystem: 6. ยืนยันการบันทึกข้อมูลชั่วคราว
    CourseSystem-->>EditCoursePage: 7. แจ้งเตือนการเชื่อมต่อมีปัญหา
    EditCoursePage-->>User: 8. แสดงข้อความแจ้งเตือนว่าไม่สามารถบันทึกข้อมูลได้
    EditCoursePage-->>User: 9. แจ้งว่าบันทึกข้อมูลการแก้ไขไว้ชั่วคราวแล้ว
    EditCoursePage-->>User: 10. แนะนำให้ลองใหม่อีกครั้งในภายหลัง
    
    alt ผู้ใช้เลือกลองใหม่
        User->>EditCoursePage: 11. กดปุ่มลองใหม่
        EditCoursePage->>CourseSystem: 12. ส่งข้อมูลเพื่อบันทึกอีกครั้ง
        CourseSystem->>Database: 13. พยายามบันทึกข้อมูลลงฐานข้อมูลอีกครั้ง
    else ผู้ใช้เลือกกลับไปยังหน้ารายการวิชา
        User->>EditCoursePage: 11. กดปุ่มกลับ
        EditCoursePage-->>User: 12. แจ้งเตือนว่าการเปลี่ยนแปลงยังไม่ถูกบันทึก
        User->>EditCoursePage: 13. ยืนยันการออกจากหน้าแก้ไข
        EditCoursePage->>CourseSystem: 14. นำทางกลับไปยังหน้ารายการวิชา
    end
```

## Sequence Diagram ภาพรวมของระบบแก้ไขรายวิชา

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant EditCoursePage as หน้าแก้ไขรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Validator as ระบบตรวจสอบข้อมูล
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. เลือกรายวิชาที่ต้องการแก้ไข
    CourseListPage->>EditCoursePage: 2. เปิดหน้าแก้ไขรายวิชา
    EditCoursePage->>CourseSystem: 3. ขอข้อมูลรายวิชา
    CourseSystem->>Database: 4. ดึงข้อมูลรายวิชา
    Database-->>CourseSystem: 5. ส่งข้อมูลรายวิชา
    CourseSystem-->>EditCoursePage: 6. ส่งข้อมูลรายวิชา
    EditCoursePage-->>User: 7. แสดงฟอร์มแก้ไขพร้อมข้อมูลเดิม
    
    User->>EditCoursePage: 8. แก้ไขข้อมูลรายวิชาส่วนที่ต้องการ
    EditCoursePage->>CourseSystem: 9. บันทึกการเปลี่ยนแปลงชั่วคราว
    User->>EditCoursePage: 10. ยืนยันการแก้ไขข้อมูล
    
    EditCoursePage->>CourseSystem: 11. ส่งข้อมูลที่แก้ไขเพื่อตรวจสอบ
    CourseSystem->>Validator: 12. ตรวจสอบความถูกต้องของข้อมูล
    
    alt ข้อมูลไม่ถูกต้อง
        Validator-->>CourseSystem: 13. แจ้งข้อผิดพลาดของข้อมูล
        CourseSystem-->>EditCoursePage: 14. ส่งรายการข้อผิดพลาด
        EditCoursePage-->>User: 15. แสดงข้อความแจ้งเตือนและไฮไลท์ช่องที่มีปัญหา
        User->>EditCoursePage: 16. แก้ไขข้อมูล
        Note over User,EditCoursePage: กลับไปที่ขั้นตอนที่ 10
    else ข้อมูลถูกต้อง แต่มีการเปลี่ยนรหัสวิชา
        Validator-->>CourseSystem: 13. ยืนยันข้อมูลถูกต้อง
        CourseSystem->>Database: 14. ตรวจสอบรหัสวิชาซ้ำ
        
        alt มีรหัสวิชาซ้ำ
            Database-->>CourseSystem: 15. แจ้งว่ามีรหัสวิชาซ้ำ
            CourseSystem-->>EditCoursePage: 16. แจ้งเตือนรหัสวิชาซ้ำ
            EditCoursePage-->>User: 17. แสดงข้อความแจ้งเตือนและให้แก้ไขรหัสวิชา
            User->>EditCoursePage: 18. แก้ไขรหัสวิชาหรือยกเลิกการเปลี่ยน
            Note over User,EditCoursePage: กลับไปที่ขั้นตอนที่ 10 (หากแก้ไข)
        else ไม่มีรหัสวิชาซ้ำหรือไม่ได้เปลี่ยนรหัสวิชา
            Database-->>CourseSystem: 15. ยืนยันไม่มีรหัสวิชาซ้ำ
            
            alt การเชื่อมต่อปกติ
                CourseSystem->>Database: 16. บันทึกการเปลี่ยนแปลง
                Database-->>CourseSystem: 17. ยืนยันการบันทึกข้อมูลสำเร็จ
                CourseSystem-->>EditCoursePage: 18. แจ้งผลการบันทึกสำเร็จ
                EditCoursePage-->>User: 19. แสดงข้อความยืนยันการแก้ไขสำเร็จ
                EditCoursePage->>CourseListPage: 20. นำทางกลับไปยังหน้ารายการวิชา
                CourseListPage->>CourseSystem: 21. ขอข้อมูลรายวิชาที่อัพเดทแล้ว
                CourseSystem->>Database: 22. ดึงข้อมูลรายวิชา
                Database-->>CourseSystem: 23. ส่งข้อมูลรายวิชา
                CourseSystem-->>CourseListPage: 24. ส่งข้อมูลรายวิชา
                CourseListPage-->>User: 25. แสดงรายการวิชาที่มีข้อมูลอัปเดตแล้ว
            else การเชื่อมต่อมีปัญหา
                CourseSystem->>Database: 16. พยายามบันทึกข้อมูล
                Database--xCourseSystem: 17. เชื่อมต่อไม่สำเร็จ
                CourseSystem-->>EditCoursePage: 18. แจ้งเตือนการเชื่อมต่อมีปัญหา
                EditCoursePage-->>User: 19. แสดงข้อความแจ้งเตือน
                EditCoursePage-->>User: 20. แจ้งว่าบันทึกข้อมูลการแก้ไขไว้ชั่วคราว
                EditCoursePage-->>User: 21. แนะนำให้ลองใหม่อีกครั้ง
            end
        end
    end
```