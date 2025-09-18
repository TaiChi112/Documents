# Use Case Description: ระบบแนะนำการลงทะเบียนเรียนที่เหมาะสมสำหรับแต่ละบุคคล

## UCD 00: MAIN - แนะนำรายวิชาลงทะเบียนที่เหมาะสมสำหรับแต่ละบุคคล

| รายการ         | รายละเอียด                                                                                      |
| -------------- | ---------------------------------------------------------------------------------------------- |
| Use Case Name  | ระบบแนะนำการลงทะเบียนเรียนที่เหมาะสมสำหรับแต่ละบุคคล                                                    |
| Actor          | Student, Professor, Admin                                                                      |
| Description    | ระบบหลักสำหรับการแนะนำรายวิชาที่เหมาะสมสำหรับนักศึกษาแต่ละคน โดยมีส่วนของการจัดการรายวิชาสำหรับอาจารย์และผู้ดูแลระบบ |
| Pre-condition  | - ผู้ใช้งานต้องสามารถเข้าถึงระบบได้                                                                   |
| Post-condition | - นักศึกษาได้รับคำแนะนำรายวิชาที่เหมาะสม<br>- อาจารย์และผู้ดูแลระบบสามารถจัดการรายวิชาได้                      |

## Use Cases ย่อย

### UC1: Login For Student
- **Actor**: Student
- **Description**: นักศึกษาเข้าสู่ระบบด้วย Student ID และรหัสผ่าน
- **Pre-condition**: นักศึกษามีบัญชีผู้ใช้งานในระบบ
- **Post-condition**: นักศึกษาเข้าสู่ระบบสำเร็จและสามารถใช้งานฟังก์ชันต่างๆ ได้

### UC2: Recommend Courses
- **Actor**: Student
- **Description**: ระบบแนะนำรายวิชาที่เหมาะสมให้กับนักศึกษาแต่ละคนตามข้อมูลและประวัติการเรียน
- **Pre-condition**: นักศึกษาเข้าสู่ระบบแล้ว
- **Post-condition**: นักศึกษาได้รับรายการวิชาแนะนำที่เหมาะสม

### UC3: Show Detail Course
- **Actor**: Student, Professor, Admin
- **Description**: แสดงรายละเอียดของรายวิชาที่เลือก
- **Pre-condition**: เลือกรายวิชาที่ต้องการดูรายละเอียด
- **Post-condition**: ระบบแสดงรายละเอียดของรายวิชาทั้งหมด

### UC4: Login for Professor & Admin
- **Actor**: Professor, Admin
- **Description**: อาจารย์และผู้ดูแลระบบเข้าสู่ระบบ
- **Pre-condition**: อาจารย์หรือผู้ดูแลระบบมีบัญชีผู้ใช้งานในระบบ
- **Post-condition**: อาจารย์หรือผู้ดูแลระบบเข้าสู่ระบบสำเร็จและสามารถใช้งานฟังก์ชันต่างๆ ได้

### UC5: Show Course List
- **Actor**: Professor, Admin
- **Description**: แสดงรายการวิชาทั้งหมดในระบบ
- **Pre-condition**: อาจารย์หรือผู้ดูแลระบบเข้าสู่ระบบแล้ว
- **Post-condition**: ระบบแสดงรายการวิชาทั้งหมด

### UC6: Add New Course
- **Actor**: Professor, Admin
- **Description**: เพิ่มรายวิชาใหม่เข้าสู่ระบบ
- **Pre-condition**: อาจารย์หรือผู้ดูแลระบบเข้าสู่ระบบแล้ว
- **Post-condition**: รายวิชาใหม่ถูกเพิ่มเข้าสู่ระบบ

## ความสัมพันธ์ระหว่าง Use Cases และ Actors

### Student
- สามารถเข้าสู่ระบบผ่าน UC1 (Login For Student)
- สามารถรับคำแนะนำรายวิชาผ่าน UC2 (Recommend Courses)
- สามารถดูรายละเอียดรายวิชาผ่าน UC3 (Show Detail Course)

### Professor
- สามารถดูรายละเอียดรายวิชาผ่าน UC3 (Show Detail Course)
- สามารถเข้าสู่ระบบผ่าน UC4 (Login for Professor & Admin)
- สามารถดูรายการวิชาทั้งหมดผ่าน UC5 (Show Course List)
- สามารถเพิ่มรายวิชาใหม่ผ่าน UC6 (Add New Course)

### Admin
- สามารถดูรายละเอียดรายวิชาผ่าน UC3 (Show Detail Course)
- สามารถเข้าสู่ระบบผ่าน UC4 (Login for Professor & Admin)
- สามารถดูรายการวิชาทั้งหมดผ่าน UC5 (Show Course List)
- สามารถเพิ่มรายวิชาใหม่ผ่าน UC6 (Add New Course)

## Flow Diagram

```mermaid
flowchart TD
    [Student] --> [UC1: Login For Student] --> [UC2: Recommend Courses] --> [UC3: Show Detail Course]
    [Professor/Admin] --> [UC4: Login for Professor & Admin] --> [UC5: Show Course List] --> [UC6: Add New Course]
```