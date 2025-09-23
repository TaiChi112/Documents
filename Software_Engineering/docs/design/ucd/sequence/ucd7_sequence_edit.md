# Sequence Diagram สำหรับ UCD7: แก้ไขรายวิชา (Simplified Version)

ต่อไปนี้เป็น Sequence Diagram ที่แสดงขั้นตอนการทำงานของระบบแก้ไขรายวิชาตาม UCD7 แบบเรียบง่าย

## Sequence Diagram หลักของการแก้ไขรายวิชา (Edit Courses)

```mermaid
sequenceDiagram
    actor Professor as "อาจารย์/ผู้ดูแลระบบ"
    participant System as "ระบบจัดการรายวิชา"
    participant Database as "ฐานข้อมูล"
    
    Professor->>System: 1. เข้ามายังหน้าแก้ไข
    System->>Database: 2. ดึงข้อมูลวิชาโดยอ้างอิง ID จาก URL Params
    Database-->>System: 3. ส่งข้อมูลวิชากลับ
    System-->>Professor: 4. นำข้อมูลวิชามาแสดงในฟอร์ม
    
    Professor->>System: 5. ป้อนข้อมูลที่ต้องการแก้ไข
    System->>System: 6. ตรวจสอบความถูกต้องของข้อมูล
    
    alt ข้อมูลถูกต้อง
        System->>Database: 7. บันทึกข้อมูล
        Database-->>System: 8. แจ้งการบันทึกสำเร็จ
        System-->>Professor: 9. แสดงข้อความบันทึกแล้ว
    else ข้อมูลไม่ถูกต้อง
        System-->>Professor: 7. แจ้งว่าข้อมูลผิด
    end
```