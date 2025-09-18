# Sequence Diagram สำหรับ UCD6: เพิ่มรายวิชา

ต่อไปนี้เป็น Sequence Diagram ที่แสดงขั้นตอนการทำงานของระบบเพิ่มรายวิชาตาม UCD6

## Sequence Diagram หลักของการเพิ่มรายวิชา (Add Courses)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant AddCoursePage as หน้าเพิ่มรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Validator as ระบบตรวจสอบข้อมูล
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. คลิกที่ปุ่ม "เพิ่มรายวิชา"
    CourseListPage->>AddCoursePage: 2. เปิดหน้าฟอร์มเพิ่มรายวิชา
    AddCoursePage-->>User: 3. แสดงฟอร์มสำหรับกรอกข้อมูลรายวิชา
    User->>AddCoursePage: 4. กรอกข้อมูลรายละเอียดของรายวิชา
    AddCoursePage->>CourseSystem: 5. บันทึกข้อมูลที่กรอกชั่วคราว
    User->>AddCoursePage: 6. ยืนยันการเพิ่มรายวิชา
    AddCoursePage->>CourseSystem: 7. ส่งข้อมูลเพื่อตรวจสอบ
    CourseSystem->>Validator: 8. ตรวจสอบความถูกต้องและครบถ้วนของข้อมูล
    
    alt ข้อมูลถูกต้องและครบถ้วน
        Validator-->>CourseSystem: 9. ยืนยันข้อมูลถูกต้อง
        CourseSystem->>Database: 10. ตรวจสอบรหัสวิชาซ้ำ
        
        alt ไม่มีรหัสวิชาซ้ำ
            Database-->>CourseSystem: 11. ยืนยันไม่มีรหัสวิชาซ้ำ
            CourseSystem->>Database: 12. บันทึกข้อมูลรายวิชาลงในฐานข้อมูล
            Database-->>CourseSystem: 13. ยืนยันการบันทึกข้อมูลสำเร็จ
            CourseSystem-->>AddCoursePage: 14. แจ้งผลการบันทึกสำเร็จ
            AddCoursePage-->>User: 15. แสดงข้อความยืนยันการเพิ่มรายวิชาสำเร็จ
            CourseSystem->>AddCoursePage: 16. รีเซ็ตฟอร์มให้กลับสู่ค่าเริ่มต้น
            AddCoursePage-->>User: 17. แสดงฟอร์มว่างพร้อมสำหรับการเพิ่มรายวิชาครั้งต่อไป
        else มีรหัสวิชาซ้ำ
            Database-->>CourseSystem: 11. แจ้งว่ามีรหัสวิชาซ้ำ
            CourseSystem-->>AddCoursePage: 12. แจ้งเตือนรหัสวิชาซ้ำ
            AddCoursePage-->>User: 13. แสดงข้อความแจ้งเตือนว่ามีรายวิชานี้อยู่แล้ว
            AddCoursePage-->>User: 14. ให้ผู้ใช้เปลี่ยนรหัสวิชาหรือยกเลิก
        end
    else ข้อมูลไม่ถูกต้องหรือไม่ครบถ้วน
        Validator-->>CourseSystem: 9. แจ้งข้อผิดพลาดของข้อมูล
        CourseSystem-->>AddCoursePage: 10. ส่งข้อผิดพลาด
        AddCoursePage-->>User: 11. แสดงข้อความแจ้งเตือนข้อผิดพลาด
        AddCoursePage-->>User: 12. ไฮไลท์ช่องกรอกข้อมูลที่มีปัญหา
        User->>AddCoursePage: 13. แก้ไขข้อมูล
        AddCoursePage->>CourseSystem: 14. ส่งข้อมูลที่แก้ไขเพื่อตรวจสอบอีกครั้ง
    end
```

## Sequence Diagram สำหรับการกรอกข้อมูลรายวิชา (Input Course Information)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant AddCoursePage as หน้าเพิ่มรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant AutoComplete as ระบบช่วยเติมข้อมูลอัตโนมัติ
    
    User->>AddCoursePage: 1. เริ่มกรอกข้อมูลรายวิชา
    AddCoursePage-->>User: 2. แสดงช่องสำหรับกรอกข้อมูลต่างๆ
    User->>AddCoursePage: 3. กรอกรหัสวิชา
    AddCoursePage->>AutoComplete: 4. ตรวจสอบรูปแบบรหัสวิชา
    AutoComplete-->>AddCoursePage: 5. ให้คำแนะนำรูปแบบรหัสวิชา
    
    User->>AddCoursePage: 6. กรอกชื่อวิชา
    User->>AddCoursePage: 7. กรอกหน่วยกิต
    User->>AddCoursePage: 8. กรอกคำอธิบายรายวิชา
    User->>AddCoursePage: 9. เลือกภาคการศึกษา
    User->>AddCoursePage: 10. เลือกผู้สอน
    User->>AddCoursePage: 11. กำหนดจำนวนที่นั่ง
    User->>AddCoursePage: 12. กำหนดห้องเรียนและเวลาเรียน
    User->>AddCoursePage: 13. เลือกวิชาที่ต้องเรียนก่อน (ถ้ามี)
    
    AddCoursePage->>CourseSystem: 14. บันทึกข้อมูลชั่วคราวระหว่างการกรอก
    CourseSystem-->>AddCoursePage: 15. ยืนยันการบันทึกข้อมูลชั่วคราว
```

## Sequence Diagram สำหรับการตรวจสอบความถูกต้องของข้อมูล (Validate Course Information)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant AddCoursePage as หน้าเพิ่มรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Validator as ระบบตรวจสอบข้อมูล
    
    User->>AddCoursePage: 1. ยืนยันการเพิ่มรายวิชา
    AddCoursePage->>CourseSystem: 2. ส่งข้อมูลเพื่อตรวจสอบ
    CourseSystem->>Validator: 3. เริ่มกระบวนการตรวจสอบข้อมูล
    
    Validator->>Validator: 4. ตรวจสอบรูปแบบรหัสวิชา
    Validator->>Validator: 5. ตรวจสอบความครบถ้วนของชื่อวิชา
    Validator->>Validator: 6. ตรวจสอบความถูกต้องของหน่วยกิต
    Validator->>Validator: 7. ตรวจสอบการกรอกคำอธิบายรายวิชา
    Validator->>Validator: 8. ตรวจสอบการเลือกภาคการศึกษา
    Validator->>Validator: 9. ตรวจสอบการเลือกผู้สอน
    Validator->>Validator: 10. ตรวจสอบจำนวนที่นั่ง
    Validator->>Validator: 11. ตรวจสอบข้อมูลห้องเรียนและเวลาเรียน
    
    alt ข้อมูลไม่ถูกต้องหรือไม่ครบถ้วน
        Validator-->>CourseSystem: 12. ส่งรายการข้อผิดพลาด
        CourseSystem-->>AddCoursePage: 13. แจ้งข้อผิดพลาด
        AddCoursePage-->>User: 14. แสดงข้อความแจ้งเตือนและไฮไลท์ช่องที่มีปัญหา
    else ข้อมูลถูกต้องและครบถ้วน
        Validator-->>CourseSystem: 12. ยืนยันข้อมูลถูกต้อง
        CourseSystem-->>AddCoursePage: 13. ข้อมูลผ่านการตรวจสอบ
    end
```

## Sequence Diagram สำหรับการบันทึกข้อมูลรายวิชาลงฐานข้อมูล (Save Course Information)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant AddCoursePage as หน้าเพิ่มรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    participant CourseListPage as หน้าจัดการรายวิชา
    
    Note over User,Database: หลังจากตรวจสอบข้อมูลถูกต้องและไม่มีรหัสวิชาซ้ำ
    
    CourseSystem->>Database: 1. เริ่มการบันทึกข้อมูล
    CourseSystem->>Database: 2. บันทึกข้อมูลพื้นฐานของรายวิชา
    Database-->>CourseSystem: 3. ยืนยันการบันทึกข้อมูลพื้นฐาน
    CourseSystem->>Database: 4. บันทึกข้อมูลเพิ่มเติม (ผู้สอน, ห้องเรียน, เวลาเรียน)
    Database-->>CourseSystem: 5. ยืนยันการบันทึกข้อมูลเพิ่มเติม
    CourseSystem->>Database: 6. บันทึกความสัมพันธ์กับรายวิชาอื่น (วิชาที่ต้องเรียนก่อน)
    Database-->>CourseSystem: 7. ยืนยันการบันทึกความสัมพันธ์
    
    CourseSystem-->>AddCoursePage: 8. แจ้งผลการบันทึกสำเร็จ
    AddCoursePage-->>User: 9. แสดงข้อความยืนยันการเพิ่มรายวิชาสำเร็จ
    
    AddCoursePage->>CourseSystem: 10. ขอรีเซ็ตฟอร์ม
    CourseSystem-->>AddCoursePage: 11. ส่งข้อมูลค่าเริ่มต้น
    AddCoursePage-->>User: 12. แสดงฟอร์มว่างพร้อมสำหรับการเพิ่มรายวิชาครั้งต่อไป
    
    alt กลับไปยังหน้ารายการวิชา
        User->>AddCoursePage: 13. เลือกกลับไปยังหน้ารายการวิชา
        AddCoursePage->>CourseListPage: 14. นำทางกลับไปยังหน้ารายการวิชา
        CourseListPage->>CourseSystem: 15. ขอข้อมูลรายการวิชาที่อัพเดทแล้ว
        CourseSystem->>Database: 16. ดึงข้อมูลรายวิชาทั้งหมด
        Database-->>CourseSystem: 17. ส่งข้อมูลรายวิชาทั้งหมด
        CourseSystem-->>CourseListPage: 18. ส่งข้อมูลรายวิชาที่อัพเดทแล้ว
        CourseListPage-->>User: 19. แสดงรายการวิชาทั้งหมดรวมรายวิชาที่เพิ่งเพิ่ม
    end
```

## Sequence Diagram กรณีรหัสวิชาซ้ำ (Exception)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant AddCoursePage as หน้าเพิ่มรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>AddCoursePage: 1. ยืนยันการเพิ่มรายวิชา
    AddCoursePage->>CourseSystem: 2. ส่งข้อมูลเพื่อตรวจสอบ
    CourseSystem->>Database: 3. ตรวจสอบรหัสวิชาซ้ำ
    Database-->>CourseSystem: 4. แจ้งว่ามีรหัสวิชานี้อยู่แล้ว
    CourseSystem-->>AddCoursePage: 5. แจ้งเตือนรหัสวิชาซ้ำ
    AddCoursePage-->>User: 6. แสดงข้อความแจ้งเตือนว่ามีรายวิชานี้อยู่แล้ว
    AddCoursePage-->>User: 7. แนะนำให้เปลี่ยนรหัสวิชา
    
    alt ผู้ใช้เลือกเปลี่ยนรหัสวิชา
        User->>AddCoursePage: 8. แก้ไขรหัสวิชา
        AddCoursePage->>CourseSystem: 9. ส่งข้อมูลเพื่อตรวจสอบอีกครั้ง
    else ผู้ใช้เลือกยกเลิก
        User->>AddCoursePage: 8. กดปุ่มยกเลิก
        AddCoursePage->>CourseSystem: 9. ยกเลิกการเพิ่มรายวิชา
        CourseSystem-->>AddCoursePage: 10. ยืนยันการยกเลิก
    end
```

## Sequence Diagram กรณีการเชื่อมต่อฐานข้อมูลมีปัญหา (Exception)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant AddCoursePage as หน้าเพิ่มรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>AddCoursePage: 1. ยืนยันการเพิ่มรายวิชา
    AddCoursePage->>CourseSystem: 2. ส่งข้อมูลเพื่อบันทึก
    CourseSystem->>Database: 3. พยายามบันทึกข้อมูลลงฐานข้อมูล
    Database--xCourseSystem: 4. เกิดข้อผิดพลาดในการเชื่อมต่อ
    CourseSystem-->>AddCoursePage: 5. แจ้งเตือนการเชื่อมต่อมีปัญหา
    AddCoursePage-->>User: 6. แสดงข้อความแจ้งเตือนว่าไม่สามารถบันทึกข้อมูลได้
    AddCoursePage-->>User: 7. แนะนำให้ลองใหม่ภายหลัง
    
    alt ผู้ใช้เลือกลองใหม่
        User->>AddCoursePage: 8. กดปุ่มลองใหม่
        AddCoursePage->>CourseSystem: 9. ส่งข้อมูลเพื่อบันทึกอีกครั้ง
    else ผู้ใช้เลือกบันทึกร่างไว้
        User->>AddCoursePage: 8. กดปุ่มบันทึกร่าง
        AddCoursePage->>CourseSystem: 9. บันทึกข้อมูลชั่วคราวในเครื่องลูกข่าย
        CourseSystem-->>AddCoursePage: 10. ยืนยันการบันทึกข้อมูลชั่วคราว
        AddCoursePage-->>User: 11. แจ้งว่าบันทึกร่างสำเร็จ
    end
```

## Sequence Diagram ภาพรวมของระบบเพิ่มรายวิชา

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant AddCoursePage as หน้าเพิ่มรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Validator as ระบบตรวจสอบข้อมูล
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. คลิกที่ปุ่ม "เพิ่มรายวิชา"
    CourseListPage->>AddCoursePage: 2. เปิดหน้าฟอร์มเพิ่มรายวิชา
    AddCoursePage-->>User: 3. แสดงฟอร์มสำหรับกรอกข้อมูลรายวิชา
    
    User->>AddCoursePage: 4. กรอกข้อมูลรายวิชา (รหัส, ชื่อ, หน่วยกิต, ฯลฯ)
    AddCoursePage->>CourseSystem: 5. บันทึกข้อมูลชั่วคราว
    User->>AddCoursePage: 6. ยืนยันการเพิ่มรายวิชา
    
    AddCoursePage->>CourseSystem: 7. ส่งข้อมูลเพื่อตรวจสอบ
    CourseSystem->>Validator: 8. ตรวจสอบความถูกต้องของข้อมูล
    
    alt ข้อมูลไม่ถูกต้อง
        Validator-->>CourseSystem: 9. แจ้งข้อผิดพลาดของข้อมูล
        CourseSystem-->>AddCoursePage: 10. ส่งรายการข้อผิดพลาด
        AddCoursePage-->>User: 11. แสดงข้อความแจ้งเตือนและไฮไลท์ช่องที่มีปัญหา
        User->>AddCoursePage: 12. แก้ไขข้อมูล
        Note over User,AddCoursePage: กลับไปที่ขั้นตอนที่ 6
    else ข้อมูลถูกต้อง
        Validator-->>CourseSystem: 9. ยืนยันข้อมูลถูกต้อง
        CourseSystem->>Database: 10. ตรวจสอบรหัสวิชาซ้ำ
        
        alt มีรหัสวิชาซ้ำ
            Database-->>CourseSystem: 11. แจ้งว่ามีรหัสวิชาซ้ำ
            CourseSystem-->>AddCoursePage: 12. แจ้งเตือนรหัสวิชาซ้ำ
            AddCoursePage-->>User: 13. แสดงข้อความแจ้งเตือนและให้แก้ไขรหัสวิชา
            User->>AddCoursePage: 14. แก้ไขรหัสวิชาหรือยกเลิก
            Note over User,AddCoursePage: กลับไปที่ขั้นตอนที่ 6 (หากแก้ไข)
        else ไม่มีรหัสวิชาซ้ำ
            Database-->>CourseSystem: 11. ยืนยันไม่มีรหัสวิชาซ้ำ
            
            alt การเชื่อมต่อปกติ
                CourseSystem->>Database: 12. บันทึกข้อมูลรายวิชา
                Database-->>CourseSystem: 13. ยืนยันการบันทึกข้อมูลสำเร็จ
                CourseSystem-->>AddCoursePage: 14. แจ้งผลการบันทึกสำเร็จ
                AddCoursePage-->>User: 15. แสดงข้อความยืนยันการเพิ่มรายวิชาสำเร็จ
                CourseSystem->>AddCoursePage: 16. รีเซ็ตฟอร์มให้กลับสู่ค่าเริ่มต้น
                AddCoursePage-->>User: 17. แสดงฟอร์มว่างพร้อมสำหรับการเพิ่มรายวิชาครั้งต่อไป
            else การเชื่อมต่อมีปัญหา
                CourseSystem->>Database: 12. พยายามบันทึกข้อมูล
                Database--xCourseSystem: 13. เชื่อมต่อไม่สำเร็จ
                CourseSystem-->>AddCoursePage: 14. แจ้งเตือนการเชื่อมต่อมีปัญหา
                AddCoursePage-->>User: 15. แสดงข้อความแจ้งเตือนและตัวเลือกลองใหม่หรือบันทึกร่าง
            end
        end
    end
```