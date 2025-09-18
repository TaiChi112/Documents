# Sequence Diagram สำหรับ UCD2: ระบบแนะนำรายวิชา

ต่อไปนี้เป็น Sequence Diagram ที่แสดงขั้นตอนการทำงานของระบบแนะนำรายวิชาตาม UCD2

## Sequence Diagram สำหรับการแนะนำรายวิชา (Recommend Course)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant RecommendPage as หน้าแนะนำรายวิชา
    participant RecSystem as ระบบแนะนำรายวิชา
    participant Database as ฐานข้อมูลรายวิชาและข้อมูลนักศึกษา
    participant CourseDetail as หน้าแสดงรายละเอียดรายวิชา
    
    Student->>RecommendPage: 1. เข้าสู่หน้าแนะนำรายวิชา
    RecommendPage->>RecSystem: 2. ขอข้อมูลรายวิชาแนะนำ
    RecSystem->>Database: 3. ขอข้อมูลประวัติการเรียนของนักศึกษา
    Database-->>RecSystem: 4. ส่งข้อมูลประวัติการเรียน
    RecSystem->>Database: 5. ขอข้อมูลรายวิชาที่ยังไม่ได้ลงทะเบียน
    Database-->>RecSystem: 6. ส่งข้อมูลรายวิชา
    RecSystem->>RecSystem: 7. วิเคราะห์และประมวลผลรายวิชาที่เหมาะสม
    RecSystem-->>RecommendPage: 8. ส่งรายการวิชาแนะนำ
    RecommendPage-->>Student: 9. แสดงรายการวิชาแนะนำที่เหมาะสม
    
    Student->>RecommendPage: 10. เลือกดูรายละเอียดของรายวิชา
    RecommendPage->>RecSystem: 11. ขอข้อมูลรายละเอียดรายวิชา
    RecSystem->>Database: 12. ขอข้อมูลรายละเอียดของรายวิชาที่เลือก
    Database-->>RecSystem: 13. ส่งข้อมูลรายละเอียดรายวิชา
    RecSystem-->>CourseDetail: 14. ส่งข้อมูลรายละเอียดรายวิชา
    CourseDetail-->>Student: 15. แสดงรายละเอียดของรายวิชาที่เลือก
    
    Student->>CourseDetail: 16. เลือกวิชาที่สนใจ
    CourseDetail->>RecSystem: 17. บันทึกวิชาที่เลือก
    RecSystem->>Database: 18. บันทึกข้อมูลวิชาที่นักศึกษาสนใจ
    Database-->>RecSystem: 19. ยืนยันการบันทึกข้อมูล
    RecSystem->>RecSystem: 20. ปรับปรุงการแนะนำรายวิชา
    RecSystem-->>RecommendPage: 21. ส่งรายการวิชาแนะนำที่ปรับปรุงแล้ว
    RecommendPage-->>Student: 22. แสดงรายการวิชาแนะนำที่ปรับปรุงแล้ว
```

## Sequence Diagram สำหรับการค้นหารายวิชา (Search Course)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant RecommendPage as หน้าแนะนำรายวิชา
    participant SearchSystem as ระบบค้นหารายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    participant CourseDetail as หน้าแสดงรายละเอียดรายวิชา
    
    Student->>RecommendPage: 1. เลือกใช้ฟังก์ชันค้นหารายวิชา
    RecommendPage-->>Student: 2. แสดงช่องสำหรับกรอกคำค้นหา
    Student->>RecommendPage: 3. กรอกคำค้นหา (ชื่อวิชา, รหัสวิชา, อาจารย์)
    RecommendPage->>SearchSystem: 4. ส่งคำค้นหา
    SearchSystem->>Database: 5. ค้นหารายวิชาตามคำค้นหา
    Database-->>SearchSystem: 6. ส่งผลลัพธ์การค้นหา
    SearchSystem-->>RecommendPage: 7. ส่งผลลัพธ์การค้นหา
    RecommendPage-->>Student: 8. แสดงผลการค้นหา
    
    Student->>RecommendPage: 9. เลือกวิชาจากผลการค้นหา
    RecommendPage->>SearchSystem: 10. ขอข้อมูลรายละเอียดรายวิชา
    SearchSystem->>Database: 11. ขอข้อมูลรายละเอียดของรายวิชาที่เลือก
    Database-->>SearchSystem: 12. ส่งข้อมูลรายละเอียดรายวิชา
    SearchSystem-->>CourseDetail: 13. ส่งข้อมูลรายละเอียดรายวิชา
    CourseDetail-->>Student: 14. แสดงรายละเอียดของรายวิชาที่เลือก
```

## Sequence Diagram สำหรับการดูสรุปรายวิชาที่เลือก (Summary)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant RecommendPage as หน้าแนะนำรายวิชา
    participant SummarySystem as ระบบสรุปรายวิชา
    participant Database as ฐานข้อมูลรายวิชาและการเลือกของนักศึกษา
    participant SummaryPage as หน้าสรุปรายวิชาที่เลือก
    
    Student->>RecommendPage: 1. ขอดูสรุปรายวิชาที่เลือกไว้
    RecommendPage->>SummarySystem: 2. ขอข้อมูลสรุปรายวิชา
    SummarySystem->>Database: 3. ขอข้อมูลรายวิชาที่นักศึกษาเลือกไว้
    Database-->>SummarySystem: 4. ส่งข้อมูลรายวิชาที่เลือก
    SummarySystem->>SummarySystem: 5. คำนวณข้อมูลสรุป (หน่วยกิต, ตารางเรียน)
    SummarySystem-->>SummaryPage: 6. ส่งข้อมูลสรุป
    SummaryPage-->>Student: 7. แสดงสรุปรายวิชาที่เลือก พร้อมตารางเรียน หน่วยกิต และข้อมูลอื่นๆ
```

## Sequence Diagram สำหรับการจัดเรียงรายวิชา (Sorting Ranking)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant RecommendPage as หน้าแนะนำรายวิชา
    participant SortSystem as ระบบจัดเรียงรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    Student->>RecommendPage: 1. เลือกเกณฑ์การจัดเรียง
    RecommendPage->>SortSystem: 2. ส่งเกณฑ์การจัดเรียงที่เลือก
    SortSystem->>Database: 3. ขอข้อมูลรายวิชาทั้งหมด
    Database-->>SortSystem: 4. ส่งข้อมูลรายวิชา
    SortSystem->>SortSystem: 5. จัดเรียงรายวิชาตามเกณฑ์ที่เลือก
    SortSystem-->>RecommendPage: 6. ส่งรายการวิชาที่จัดเรียงแล้ว
    RecommendPage-->>Student: 7. แสดงรายวิชาที่จัดเรียงตามเกณฑ์ที่เลือก
```

## Sequence Diagram กรณีไม่พบรายวิชาที่เหมาะสม (Exception)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant RecommendPage as หน้าแนะนำรายวิชา
    participant RecSystem as ระบบแนะนำรายวิชา
    participant Database as ฐานข้อมูลรายวิชาและข้อมูลนักศึกษา
    
    Student->>RecommendPage: 1. เข้าสู่หน้าแนะนำรายวิชา
    RecommendPage->>RecSystem: 2. ขอข้อมูลรายวิชาแนะนำ
    RecSystem->>Database: 3. ขอข้อมูลประวัติการเรียนของนักศึกษา
    Database-->>RecSystem: 4. ส่งข้อมูลประวัติการเรียน
    RecSystem->>Database: 5. ขอข้อมูลรายวิชาที่ยังไม่ได้ลงทะเบียน
    Database-->>RecSystem: 6. ส่งข้อมูลรายวิชา
    RecSystem->>RecSystem: 7. วิเคราะห์และประมวลผล
    RecSystem-->>RecommendPage: 8. แจ้งไม่พบรายวิชาที่เหมาะสม
    RecommendPage-->>Student: 9. แสดงข้อความแจ้งว่าไม่สามารถหารายวิชาที่เหมาะสมได้
    RecommendPage-->>Student: 10. แสดงข้อความแนะนำให้ปรึกษาอาจารย์ที่ปรึกษา
```

## Sequence Diagram กรณีรายวิชามีจำนวนที่นั่งเต็ม (Exception)

```mermaid
sequenceDiagram
    actor Student as นักศึกษา
    participant CourseDetail as หน้าแสดงรายละเอียดรายวิชา
    participant RecSystem as ระบบแนะนำรายวิชา
    participant Database as ฐานข้อมูลรายวิชา
    
    Student->>CourseDetail: 1. เลือกวิชาที่สนใจ
    CourseDetail->>RecSystem: 2. ขอตรวจสอบสถานะรายวิชา
    RecSystem->>Database: 3. ตรวจสอบข้อมูลที่นั่งของรายวิชา
    Database-->>RecSystem: 4. แจ้งสถานะที่นั่งเต็ม
    RecSystem->>Database: 5. ค้นหารายวิชาที่มีเนื้อหาใกล้เคียง
    Database-->>RecSystem: 6. ส่งข้อมูลรายวิชาที่มีเนื้อหาใกล้เคียง
    RecSystem-->>CourseDetail: 7. ส่งสถานะรายวิชาเต็มและรายวิชาทางเลือก
    CourseDetail-->>Student: 8. แสดงสถานะว่ารายวิชาเต็มแล้ว
    CourseDetail-->>Student: 9. แนะนำรายวิชาอื่นที่มีเนื้อหาใกล้เคียงกัน
```