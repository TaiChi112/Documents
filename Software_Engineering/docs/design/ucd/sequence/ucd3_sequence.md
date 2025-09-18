# Sequence Diagram สำหรับ UCD3: แสดงรายละเอียดรายวิชา

ต่อไปนี้เป็น Sequence Diagram ที่แสดงขั้นตอนการทำงานของระบบแสดงรายละเอียดรายวิชาตาม UCD3

## Sequence Diagram หลักสำหรับการแสดงรายละเอียดรายวิชา (Course Detail)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant CoursePage as หน้ารายวิชา
    participant DetailSystem as ระบบแสดงรายละเอียดรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    Student->>CoursePage: 1. เลือกรายวิชาที่ต้องการดูรายละเอียด
    CoursePage->>DetailSystem: 2. ขอข้อมูลรายละเอียดของรายวิชา
    DetailSystem->>Database: 3. ดึงข้อมูลรายละเอียดทั้งหมดของรายวิชา
    Database-->>DetailSystem: 4. ส่งข้อมูลรายละเอียดทั้งหมด
    DetailSystem-->>CoursePage: 5. ส่งข้อมูลรายละเอียดวิชา
    CoursePage-->>Student: 6. แสดงหน้าจอข้อมูลรายวิชา
```

## Sequence Diagram การแสดงรายละเอียดรายวิชาแบบเต็ม (Show Detail Course)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant CoursePage as หน้ารายวิชา
    participant DetailSystem as ระบบแสดงรายละเอียดรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    Note over Student,Database: ต่อจากขั้นตอนแรกที่นักศึกษาเลือกรายวิชา
    
    DetailSystem->>Database: 1. ดึงข้อมูลรายละเอียดทั้งหมดของรายวิชา
    Database-->>DetailSystem: 2. ส่งข้อมูลทั่วไป (รหัสวิชา, ชื่อวิชา, หน่วยกิต)
    Database-->>DetailSystem: 3. ส่งข้อมูลการเรียนการสอน (อาจารย์, เวลาเรียน, ห้องเรียน)
    Database-->>DetailSystem: 4. ส่งข้อมูลเนื้อหา (คำอธิบายรายวิชา, หัวข้อที่สอน)
    Database-->>DetailSystem: 5. ส่งข้อมูลเพิ่มเติม (วิชาที่ต้องเรียนก่อน, ความคิดเห็น)
    
    DetailSystem-->>CoursePage: 6. ส่งข้อมูลทั่วไป
    CoursePage-->>Student: 7. แสดงข้อมูลทั่วไป (รหัสวิชา, ชื่อวิชา, หน่วยกิต)
    DetailSystem-->>CoursePage: 8. ส่งข้อมูลการเรียนการสอน
    CoursePage-->>Student: 9. แสดงข้อมูลการเรียนการสอน (อาจารย์, เวลาเรียน, ห้องเรียน)
    DetailSystem-->>CoursePage: 10. ส่งข้อมูลเนื้อหา
    CoursePage-->>Student: 11. แสดงข้อมูลเนื้อหา (คำอธิบายรายวิชา, หัวข้อที่สอน)
    DetailSystem-->>CoursePage: 12. ส่งข้อมูลเพิ่มเติม
    CoursePage-->>Student: 13. แสดงข้อมูลเพิ่มเติม (วิชาที่ต้องเรียนก่อน, ความคิดเห็น)
```

## Sequence Diagram การดูรายละเอียดเฉพาะกลุ่ม/เซคชั่น (View Multiple Sections)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant CoursePage as หน้ารายวิชา
    participant SectionSystem as ระบบแสดงข้อมูลเซคชั่น
    participant Database as ฐานข้อมูลรายวิชา
    
    Student->>CoursePage: 1. เลือกดูรายละเอียดเฉพาะกลุ่ม/เซคชั่น
    CoursePage->>SectionSystem: 2. ขอข้อมูลเซคชั่นที่มีสำหรับรายวิชา
    SectionSystem->>Database: 3. ดึงข้อมูลเซคชั่นทั้งหมดของรายวิชา
    Database-->>SectionSystem: 4. ส่งข้อมูลเซคชั่นทั้งหมด
    SectionSystem-->>CoursePage: 5. ส่งข้อมูลเซคชั่นทั้งหมด
    CoursePage-->>Student: 6. แสดงรายการเซคชั่นที่มีให้เลือก
    
    Student->>CoursePage: 7. เลือกเซคชั่นที่ต้องการดูรายละเอียด
    CoursePage->>SectionSystem: 8. ขอข้อมูลรายละเอียดของเซคชั่นที่เลือก
    SectionSystem->>Database: 9. ดึงข้อมูลรายละเอียดของเซคชั่นที่เลือก
    Database-->>SectionSystem: 10. ส่งข้อมูลรายละเอียดของเซคชั่น
    SectionSystem-->>CoursePage: 11. ส่งข้อมูลรายละเอียดของเซคชั่น
    CoursePage-->>Student: 12. แสดงรายละเอียดของกลุ่ม/เซคชั่นที่เลือก
```

## Sequence Diagram การดูความคิดเห็นทั้งหมด (View All Comments)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant CoursePage as หน้ารายวิชา
    participant CommentSystem as ระบบแสดงความคิดเห็น
    participant Database as ฐานข้อมูลความคิดเห็น
    
    Student->>CoursePage: 1. กดปุ่ม "ดูความคิดเห็นทั้งหมด"
    CoursePage->>CommentSystem: 2. ขอข้อมูลความคิดเห็นทั้งหมด
    CommentSystem->>Database: 3. ดึงข้อมูลความคิดเห็นทั้งหมดของรายวิชา
    Database-->>CommentSystem: 4. ส่งข้อมูลความคิดเห็นทั้งหมด
    CommentSystem-->>CoursePage: 5. ส่งข้อมูลความคิดเห็นทั้งหมด
    CoursePage-->>Student: 6. แสดงความคิดเห็นทั้งหมดจากนักศึกษาที่เคยลงทะเบียน
    
    alt ไม่มีความคิดเห็น
        CoursePage-->>Student: 7. แสดงข้อความว่ายังไม่มีความคิดเห็นสำหรับรายวิชานี้
    end
```

## Sequence Diagram กรณีไม่พบข้อมูลรายวิชา (Exception)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant CoursePage as หน้ารายวิชา
    participant DetailSystem as ระบบแสดงรายละเอียดรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    Student->>CoursePage: 1. เลือกรายวิชาที่ต้องการดูรายละเอียด
    CoursePage->>DetailSystem: 2. ขอข้อมูลรายละเอียดของรายวิชา
    DetailSystem->>Database: 3. พยายามดึงข้อมูลรายละเอียดของรายวิชา
    Database-->>DetailSystem: 4. แจ้งว่าไม่พบข้อมูลรายวิชา
    DetailSystem-->>CoursePage: 5. แจ้งว่าไม่พบข้อมูลรายวิชา
    CoursePage-->>Student: 6. แสดงข้อความแจ้งว่าไม่พบข้อมูล
    CoursePage-->>Student: 7. แสดงคำแนะนำให้ติดต่อผู้ดูแลระบบ
```

## Sequence Diagram กรณีข้อมูลไม่ครบถ้วน (Exception)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant CoursePage as หน้ารายวิชา
    participant DetailSystem as ระบบแสดงรายละเอียดรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    Student->>CoursePage: 1. เลือกรายวิชาที่ต้องการดูรายละเอียด
    CoursePage->>DetailSystem: 2. ขอข้อมูลรายละเอียดของรายวิชา
    DetailSystem->>Database: 3. ดึงข้อมูลรายละเอียดของรายวิชา
    Database-->>DetailSystem: 4. ส่งข้อมูลรายวิชาที่มี (ไม่ครบถ้วน)
    DetailSystem-->>DetailSystem: 5. ตรวจสอบความครบถ้วนของข้อมูล
    DetailSystem-->>CoursePage: 6. ส่งข้อมูลรายวิชาที่มีพร้อมสถานะข้อมูลไม่ครบ
    CoursePage-->>Student: 7. แสดงข้อมูลเท่าที่มี
    CoursePage-->>Student: 8. แสดงข้อความแจ้งว่าข้อมูลบางส่วนยังไม่พร้อมใช้งาน
```