# Sequence Diagram สำหรับ UCD5: รายการวิชาทั้งหมด

ต่อไปนี้เป็น Sequence Diagram ที่แสดงขั้นตอนการทำงานของระบบรายการวิชาทั้งหมดตาม UCD5

## Sequence Diagram สำหรับการแสดงรายการวิชาทั้งหมด (List Courses)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    participant CourseDetailPage as หน้าแสดงรายละเอียดรายวิชา
    
    User->>CourseListPage: 1. เข้าสู่หน้าจัดการรายวิชา
    CourseListPage->>CourseSystem: 2. ขอข้อมูลรายวิชาทั้งหมด
    CourseSystem->>Database: 3. ดึงข้อมูลรายวิชาทั้งหมด
    Database-->>CourseSystem: 4. ส่งข้อมูลรายวิชาทั้งหมด
    CourseSystem-->>CourseListPage: 5. ส่งข้อมูลรายวิชาทั้งหมด
    CourseListPage-->>User: 6. แสดงรายการวิชาทั้งหมดในระบบ
    
    User->>CourseListPage: 7. เลือกดูรายละเอียดของรายวิชา
    CourseListPage->>CourseSystem: 8. ขอข้อมูลรายละเอียดของรายวิชาที่เลือก
    CourseSystem->>Database: 9. ดึงข้อมูลรายละเอียดของรายวิชาที่เลือก
    Database-->>CourseSystem: 10. ส่งข้อมูลรายละเอียดของรายวิชา
    CourseSystem-->>CourseDetailPage: 11. ส่งข้อมูลรายละเอียดของรายวิชา
    CourseDetailPage-->>User: 12. แสดงรายละเอียดของรายวิชาที่เลือก
```

## Sequence Diagram สำหรับการเพิ่มรายวิชาใหม่ (Add Course)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant AddCoursePage as หน้าเพิ่มรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. เลือกฟังก์ชันเพิ่มรายวิชาใหม่
    CourseListPage->>AddCoursePage: 2. เปิดหน้าฟอร์มเพิ่มรายวิชา
    AddCoursePage-->>User: 3. แสดงหน้าฟอร์มเพิ่มรายวิชา
    User->>AddCoursePage: 4. กรอกข้อมูลรายวิชาและยืนยัน
    AddCoursePage->>CourseSystem: 5. ส่งข้อมูลรายวิชาใหม่
    CourseSystem->>CourseSystem: 6. ตรวจสอบความถูกต้องของข้อมูล
    
    alt ข้อมูลถูกต้อง
        CourseSystem->>Database: 7. บันทึกข้อมูลรายวิชาใหม่
        Database-->>CourseSystem: 8. ยืนยันการบันทึกข้อมูลสำเร็จ
        CourseSystem-->>AddCoursePage: 9. แจ้งผลการบันทึกสำเร็จ
        AddCoursePage-->>User: 10. แสดงข้อความแจ้งเพิ่มรายวิชาสำเร็จ
        CourseSystem->>CourseListPage: 11. อัพเดทรายการวิชา
        CourseListPage-->>User: 12. แสดงรายการวิชาที่อัพเดทแล้ว
    else ข้อมูลไม่ถูกต้อง
        CourseSystem-->>AddCoursePage: 7. แจ้งข้อผิดพลาดของข้อมูล
        AddCoursePage-->>User: 8. แสดงข้อความแจ้งเตือนข้อมูลไม่ถูกต้อง
    end
```

## Sequence Diagram สำหรับการแก้ไขรายวิชา (Edit Course)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant EditCoursePage as หน้าแก้ไขรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. เลือกรายวิชาที่ต้องการแก้ไข
    CourseListPage->>CourseSystem: 2. ขอข้อมูลรายวิชาที่ต้องการแก้ไข
    CourseSystem->>Database: 3. ดึงข้อมูลรายวิชา
    Database-->>CourseSystem: 4. ส่งข้อมูลรายวิชา
    CourseSystem-->>EditCoursePage: 5. ส่งข้อมูลรายวิชา
    EditCoursePage-->>User: 6. แสดงหน้าฟอร์มแก้ไขข้อมูลรายวิชาพร้อมข้อมูลเดิม
    User->>EditCoursePage: 7. แก้ไขข้อมูลและยืนยัน
    EditCoursePage->>CourseSystem: 8. ส่งข้อมูลที่แก้ไข
    CourseSystem->>CourseSystem: 9. ตรวจสอบความถูกต้องของข้อมูล
    
    alt ข้อมูลถูกต้อง
        CourseSystem->>Database: 10. อัพเดทข้อมูลรายวิชา
        Database-->>CourseSystem: 11. ยืนยันการอัพเดทข้อมูลสำเร็จ
        CourseSystem-->>EditCoursePage: 12. แจ้งผลการอัพเดทสำเร็จ
        EditCoursePage-->>User: 13. แสดงข้อความแจ้งแก้ไขรายวิชาสำเร็จ
        CourseSystem->>CourseListPage: 14. อัพเดทรายการวิชา
        CourseListPage-->>User: 15. แสดงรายการวิชาที่อัพเดทแล้ว
    else ข้อมูลไม่ถูกต้อง
        CourseSystem-->>EditCoursePage: 10. แจ้งข้อผิดพลาดของข้อมูล
        EditCoursePage-->>User: 11. แสดงข้อความแจ้งเตือนข้อมูลไม่ถูกต้อง
    end
```

## Sequence Diagram สำหรับการค้นหารายวิชา (Search Course)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant SearchSystem as ระบบค้นหารายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. กรอกคำค้นหา
    CourseListPage->>SearchSystem: 2. ส่งคำค้นหา
    SearchSystem->>Database: 3. ค้นหารายวิชาตามเงื่อนไข
    Database-->>SearchSystem: 4. ส่งผลการค้นหา
    SearchSystem-->>CourseListPage: 5. ส่งผลการค้นหา
    CourseListPage-->>User: 6. แสดงผลการค้นหาตามเงื่อนไข
    
    alt ไม่พบรายวิชาที่ตรงตามเงื่อนไข
        CourseListPage-->>User: 7. แสดงข้อความไม่พบรายวิชาที่ตรงตามเงื่อนไข
    end
```

## Sequence Diagram สำหรับการกรองรายวิชา (Filter Course)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant FilterSystem as ระบบกรองรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. เลือกตัวกรอง (ภาคการศึกษา, หมวดหมู่, ฯลฯ)
    CourseListPage->>FilterSystem: 2. ส่งเงื่อนไขการกรอง
    FilterSystem->>Database: 3. ค้นหารายวิชาตามเงื่อนไขการกรอง
    Database-->>FilterSystem: 4. ส่งผลการกรอง
    FilterSystem-->>CourseListPage: 5. ส่งรายการวิชาที่ตรงตามเงื่อนไข
    CourseListPage-->>User: 6. แสดงรายวิชาที่ตรงตามเงื่อนไขการกรอง
    
    alt ไม่พบรายวิชาที่ตรงตามเงื่อนไขการกรอง
        CourseListPage-->>User: 7. แสดงข้อความไม่พบรายวิชาที่ตรงตามเงื่อนไข
    end
```

## Sequence Diagram กรณีไม่มีรายวิชาในระบบ (Exception)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. เข้าสู่หน้าจัดการรายวิชา
    CourseListPage->>CourseSystem: 2. ขอข้อมูลรายวิชาทั้งหมด
    CourseSystem->>Database: 3. ดึงข้อมูลรายวิชาทั้งหมด
    Database-->>CourseSystem: 4. แจ้งว่าไม่มีรายวิชาในระบบ
    CourseSystem-->>CourseListPage: 5. แจ้งว่าไม่มีรายวิชา
    CourseListPage-->>User: 6. แสดงข้อความว่าไม่พบรายวิชา
    CourseListPage-->>User: 7. แนะนำให้เพิ่มรายวิชาใหม่
```

## Sequence Diagram กรณีการเชื่อมต่อฐานข้อมูลมีปัญหา (Exception)

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    User->>CourseListPage: 1. เข้าสู่หน้าจัดการรายวิชา
    CourseListPage->>CourseSystem: 2. ขอข้อมูลรายวิชาทั้งหมด
    CourseSystem->>Database: 3. พยายามเชื่อมต่อกับฐานข้อมูล
    Database--xCourseSystem: 4. ไม่สามารถเชื่อมต่อได้ (Timeout)
    CourseSystem-->>CourseListPage: 5. แจ้งว่าเกิดข้อผิดพลาดในการเชื่อมต่อ
    CourseListPage-->>User: 6. แสดงข้อความแจ้งเตือนว่าไม่สามารถเชื่อมต่อกับฐานข้อมูลได้
    CourseListPage-->>User: 7. แนะนำให้ลองใหม่ภายหลังหรือติดต่อผู้ดูแลระบบ
```

## Sequence Diagram ภาพรวมของระบบรายการวิชาทั้งหมด

```mermaid
sequenceDiagram
    actor User as อาจารย์/ผู้ดูแลระบบ
    participant CourseListPage as หน้าจัดการรายวิชา
    participant CourseSystem as ระบบจัดการรายวิชา
    participant SearchFilter as ระบบค้นหาและกรอง
    participant Database as ฐานข้อมูลรายวิชา
    participant AddEditPage as หน้าเพิ่ม/แก้ไขรายวิชา
    participant DetailPage as หน้ารายละเอียดรายวิชา
    
    User->>CourseListPage: 1. เข้าสู่หน้าจัดการรายวิชา
    CourseListPage->>CourseSystem: 2. ขอข้อมูลรายวิชาทั้งหมด
    CourseSystem->>Database: 3. ดึงข้อมูลรายวิชา
    Database-->>CourseSystem: 4. ส่งข้อมูลรายวิชา
    CourseSystem-->>CourseListPage: 5. ส่งข้อมูลรายวิชา
    CourseListPage-->>User: 6. แสดงรายการวิชาทั้งหมด
    
    alt ดูรายละเอียดรายวิชา
        User->>CourseListPage: 7. เลือกดูรายละเอียดรายวิชา
        CourseListPage->>DetailPage: 8. เปิดหน้ารายละเอียดรายวิชา
        DetailPage->>CourseSystem: 9. ขอข้อมูลรายละเอียดรายวิชา
        CourseSystem->>Database: 10. ดึงข้อมูลรายละเอียด
        Database-->>CourseSystem: 11. ส่งข้อมูลรายละเอียด
        CourseSystem-->>DetailPage: 12. ส่งข้อมูลรายละเอียด
        DetailPage-->>User: 13. แสดงรายละเอียดรายวิชา
    else เพิ่มรายวิชาใหม่
        User->>CourseListPage: 7. เลือกเพิ่มรายวิชาใหม่
        CourseListPage->>AddEditPage: 8. เปิดหน้าเพิ่มรายวิชา
        AddEditPage-->>User: 9. แสดงฟอร์มเพิ่มรายวิชา
        User->>AddEditPage: 10. กรอกข้อมูลและยืนยัน
        AddEditPage->>CourseSystem: 11. ส่งข้อมูลรายวิชาใหม่
        CourseSystem->>Database: 12. บันทึกข้อมูลรายวิชาใหม่
        Database-->>CourseSystem: 13. ยืนยันการบันทึกสำเร็จ
        CourseSystem-->>CourseListPage: 14. อัพเดทรายการวิชา
        CourseListPage-->>User: 15. แสดงรายการวิชาที่อัพเดทแล้ว
    else แก้ไขรายวิชา
        User->>CourseListPage: 7. เลือกแก้ไขรายวิชา
        CourseListPage->>AddEditPage: 8. เปิดหน้าแก้ไขรายวิชา
        AddEditPage->>CourseSystem: 9. ขอข้อมูลรายวิชาเดิม
        CourseSystem->>Database: 10. ดึงข้อมูลรายวิชา
        Database-->>CourseSystem: 11. ส่งข้อมูลรายวิชา
        CourseSystem-->>AddEditPage: 12. ส่งข้อมูลรายวิชา
        AddEditPage-->>User: 13. แสดงฟอร์มแก้ไขพร้อมข้อมูลเดิม
        User->>AddEditPage: 14. แก้ไขข้อมูลและยืนยัน
        AddEditPage->>CourseSystem: 15. ส่งข้อมูลที่แก้ไข
        CourseSystem->>Database: 16. อัพเดทข้อมูล
        Database-->>CourseSystem: 17. ยืนยันการอัพเดทสำเร็จ
        CourseSystem-->>CourseListPage: 18. อัพเดทรายการวิชา
        CourseListPage-->>User: 19. แสดงรายการวิชาที่อัพเดทแล้ว
    else ค้นหาหรือกรองรายวิชา
        User->>CourseListPage: 7. กรอกคำค้นหา/เลือกตัวกรอง
        CourseListPage->>SearchFilter: 8. ส่งเงื่อนไขการค้นหา/กรอง
        SearchFilter->>Database: 9. ค้นหาตามเงื่อนไข
        Database-->>SearchFilter: 10. ส่งผลลัพธ์
        SearchFilter-->>CourseListPage: 11. ส่งผลลัพธ์
        CourseListPage-->>User: 12. แสดงรายการวิชาที่ตรงตามเงื่อนไข
    end
```