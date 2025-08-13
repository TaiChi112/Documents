# **(Software Design Models) แบบจำลองการออกแบบซอฟต์แวร์** 

คือ แผนภาพหรือเครื่องมือที่ใช้ในการแสดงโครงสร้างและพฤติกรรมของระบบซอฟต์แวร์ ก่อนที่จะเริ่มเขียนโค้ดจริง ๆ ลองนึกภาพเหมือนสถาปนิกที่ต้องวาดแบบแปลนบ้านก่อนลงมือก่อสร้างจริง ๆ เพื่อให้เห็นภาพรวมและรายละเอียดต่าง ๆ ได้อย่างชัดเจน แบบจำลองเหล่านี้ช่วยให้นักพัฒนามองเห็นภาพเดียวกัน ลดความผิดพลาด และทำให้การสื่อสารระหว่างทีมเป็นไปอย่างราบรื่นมากขึ้น

- แบบจำลองการออกแบบซอฟต์แวร์แบ่งออกเป็นหลายประเภท แต่หลัก ๆ แล้วสามารถแบ่งตามมุมมองที่ใช้ในการนำเสนอได้ 2 ประเภทใหญ่ ๆ คือ

## 1. แบบจำลองเชิงโครงสร้าง **(Structural Models)**
แบบจำลองประเภทนี้จะเน้นไปที่ โครงสร้างของระบบ และความสัมพันธ์ระหว่างองค์ประกอบต่าง ๆ 

![Structural Models](structural.jpg "Structural Models")
   - **Class Diagram**: เป็นแบบจำลองที่ใช้บ่อยที่สุด ใช้แสดงคลาส (Class) ต่าง ๆ ในระบบ คุณสมบัติ (Attributes) และการกระทำ (Methods) ของแต่ละคลาส รวมถึงความสัมพันธ์ระหว่างคลาสเหล่านั้น เช่น ความสัมพันธ์แบบสืบทอด (Inheritance) หรือการประกอบเข้าด้วยกัน (Composition)
   - **Component Diagram**: ใช้แสดงองค์ประกอบ (Component) ระดับสูงของระบบ เช่น โมดูลย่อยต่าง ๆ และความสัมพันธ์ระหว่างกัน แบบจำลองนี้เหมาะสำหรับการมองภาพรวมของระบบขนาดใหญ่
   - **Deployment Diagram**: ใช้แสดงว่าซอฟต์แวร์และฮาร์ดแวร์จะถูกติดตั้งและทำงานร่วมกันอย่างไรในสภาพแวดล้อมจริง เช่น Server และ Database อยู่ที่ไหน

## 2. แบบจำลองเชิงพฤติกรรม **(Behavioral Models)**
แบบจำลองประเภทนี้จะเน้นไปที่ การทำงานหรือพฤติกรรมของระบบ และวิธีการที่องค์ประกอบต่าง ๆ โต้ตอบกัน

   - **Use Case Diagram**: แสดงว่าผู้ใช้ (Actor) โต้ตอบกับระบบอย่างไร โดยจะระบุหน้าที่หลัก (Use Case) ที่ระบบต้องทำ
   - **Sequence Diagram**: แสดงลำดับการโต้ตอบของ Object ต่าง ๆ ในระบบในช่วงเวลาหนึ่ง แบบจำลองนี้เหมาะสำหรับการดูขั้นตอนการทำงานของฟังก์ชันเฉพาะเจาะจง
   - **Activity Diagram**: แสดงลำดับกิจกรรมหรือขั้นตอนการทำงานของกระบวนการใดกระบวนการหนึ่งในระบบ คล้ายกับ Flowchart

**ประโยชน์ของการใช้แบบจำลองการออกแบบซอฟต์แวร์**
   - **ช่วยให้เห็นภาพรวมของระบบ**: ช่วยให้ทุกคนในทีมเข้าใจภาพรวมของระบบตรงกันตั้งแต่เนิ่น ๆ
   - **ลดความผิดพลาดในการพัฒนา**: การออกแบบที่ดีตั้งแต่ต้นจะช่วยลดข้อผิดพลาดที่อาจเกิดขึ้นระหว่างการเขียนโค้ด
   - **ช่วยให้การสื่อสารระหว่างทีมดีขึ้น**: เป็นภาษาภาพที่ทุกคนเข้าใจร่วมกัน ไม่ว่าจะเป็นนักพัฒนา นักวิเคราะห์ หรือผู้จัดการโครงการ
   - **ง่ายต่อการบำรุงรักษาและปรับปรุง**: เมื่อระบบมีแบบจำลองที่ดี การแก้ไขหรือเพิ่มเติมส่วนต่าง ๆ ในอนาคตก็จะทำได้ง่ายขึ้น

## Design Models pyramid
- component-level design
- interface design
- architectural design
- data/class design

- เราจะทำการ move ข้อมูลจาก **Analysis Models** ไปยัง **Design Models** เพื่อให้เห็นภาพรวมของการออกแบบซอฟต์แวร์ที่ชัดเจนยิ่งขึ้น โดยจะมีการจัดระเบียบข้อมูลและเพิ่มรายละเอียดที่จำเป็นสำหรับการพัฒนาระบบในขั้นตอนถัดไป

```mermaid
flowchart TD
    A[Analysis Models] --> B[Design Models]
    B --> C[Component-level Design]
    B --> D[Interface Design]
    B --> E[Architectural Design]
    B --> F[Data/Class Design]
```
#

## ตัวอย่าง Diagrams เพิ่มเติมสำหรับระบบลงทะเบียนเรียน

สำหรับตัวอย่าง diagram ที่ครบถ้วนและรายละเอียดมากขึ้น กรุณาดูในไฟล์: **[enrollment_system_diagrams.md](./enrollment_system_diagrams.md)**
# ระบบการลงทะเบียนเรียน - Enrollment System Diagrams

## 1. Class Diagram

```mermaid
classDiagram
    direction RL
    class Student {
        +String studentId
        +String name
        +String email
        +int age
        +List~Course~ enrolledCourses
        +float gpa
        +enrollCourse(Course course) boolean
        +dropCourse(Course course) boolean
        +viewEnrolledCourses() List~Course~
        +checkPrerequisites(Course course) boolean
    }
    
    class Course {
        +String courseId
        +String courseName
        +String description
        +int credits
        +int maxCapacity
        +int currentEnrollment
        +List~Student~ enrolledStudents
        +List~Course~ prerequisites
        +Instructor instructor
        +Schedule schedule
        +enrollStudent(Student student) boolean
        +dropStudent(Student student) boolean
        +isCapacityFull() boolean
        +checkPrerequisites(Student student) boolean
    }
    
    class Instructor {
        +String employeeId
        +String name
        +String email
        +int age
        +String department
        +List~Course~ assignedCourses
        +assignCourse(Course course) void
        +unassignCourse(Course course) void
        +viewStudents() List~Student~
        +gradeStudent(Student student, float grade) void
    }
    
    class Schedule {
        +String timeSlot
        +String dayOfWeek
        +String classroom
        +Date startDate
        +Date endDate
        +checkConflict(Schedule other) boolean
    }
    
    class EnrollmentSystem {
        +List~Student~ students
        +List~Course~ courses
        +List~Instructor~ instructors
        +processEnrollment(Student student, Course course) boolean
        +processWithdrawal(Student student, Course course) boolean
        +generateReport() Report
        +checkScheduleConflicts(Student student, Course course) boolean
    }
    
    class Grade {
        +String studentId
        +String courseId
        +float score
        +String letterGrade
        +Date gradedDate
        +calculateLetterGrade(float score) String
    }

    Student --o Course : enrolls
    Course -- Instructor : taught_by
    Course -- Schedule : has
    Student --o Grade : receives
    Course --o Grade : gives
    Course --o Course : prerequisites
    EnrollmentSystem --o Student : manages
    EnrollmentSystem --o Course : manages
    EnrollmentSystem --o Instructor : manages
```

## 2. Sequence Diagram - การลงทะเบียนเรียน

```mermaid
sequenceDiagram
    participant S as Student
    participant ES as EnrollmentSystem
    participant C as Course
    participant I as Instructor
    participant DB as Database

    S->>ES: requestEnrollment(studentId, courseId)
    ES->>DB: getStudent(studentId)
    DB-->>ES: studentData
    ES->>DB: getCourse(courseId)
    DB-->>ES: courseData
    
    ES->>C: checkCapacity()
    C-->>ES: capacityStatus
    
    alt Course is full
        ES-->>S: enrollmentFailed("Course is full")
    else Course has space
        ES->>C: checkPrerequisites(student)
        C-->>ES: prerequisiteStatus
        
        alt Prerequisites not met
            ES-->>S: enrollmentFailed("Prerequisites not met")
        else Prerequisites met
            ES->>ES: checkScheduleConflicts(student, course)
            
            alt Schedule conflict exists
                ES-->>S: enrollmentFailed("Schedule conflict")
            else No conflicts
                ES->>C: enrollStudent(student)
                C->>C: updateEnrollmentCount()
                C-->>ES: enrollmentSuccess
                ES->>DB: updateStudentCourses(studentId, courseId)
                ES->>I: notifyNewStudent(student, course)
                ES-->>S: enrollmentSuccess("Successfully enrolled")
            end
        end
    end
```

## 3. State Diagram - สถานะของการลงทะเบียน

```mermaid
stateDiagram-v2
    [*] --> NotEnrolled
    
    NotEnrolled --> CheckingEligibility : requestEnrollment()
    CheckingEligibility --> CheckingPrerequisites : eligible
    CheckingEligibility --> NotEnrolled : notEligible/courseFullError
    
    CheckingPrerequisites --> CheckingSchedule : prerequisitesMet
    CheckingPrerequisites --> NotEnrolled : prerequisitesNotMet/prerequisiteError
    
    CheckingSchedule --> ProcessingEnrollment : noConflicts
    CheckingSchedule --> NotEnrolled : hasConflicts/scheduleConflictError
    
    ProcessingEnrollment --> Enrolled : enrollmentSuccess
    ProcessingEnrollment --> NotEnrolled : enrollmentFailed/systemError
    
    Enrolled --> ProcessingWithdrawal : requestWithdrawal()
    ProcessingWithdrawal --> Withdrawn : withdrawalSuccess
    ProcessingWithdrawal --> Enrolled : withdrawalFailed/deadlinePassed
    
    Withdrawn --> NotEnrolled : resetForNewSemester()
    
    Enrolled --> Completed : semesterEnd/gradeAssigned
    Completed --> [*]
    Withdrawn --> [*]
```

## 4. Activity Diagram - กระบวนการลงทะเบียนเรียน

```mermaid
flowchart TD
    Start([เริ่มต้น]) --> Login[นักเรียนเข้าสู่ระบบ]
    Login --> ViewCourses[ดูรายวิชาที่เปิดสอน]
    ViewCourses --> SelectCourse[เลือกรายวิชาที่ต้องการลงทะเบียน]
    
    SelectCourse --> CheckCapacity{ตรวจสอบจำนวนที่นั่ง}
    CheckCapacity -->|เต็ม| CourseFull[แจ้งว่ารายวิชาเต็ม]
    CourseFull --> ViewCourses
    
    CheckCapacity -->|ว่าง| CheckPrereq{ตรวจสอบวิชาบังคับก่อน}
    CheckPrereq -->|ไม่ผ่าน| PrereqError[แจ้งวิชาบังคับก่อนไม่ครบ]
    PrereqError --> ViewCourses
    
    CheckPrereq -->|ผ่าน| CheckSchedule{ตรวจสอบตารางเรียนซ้ำซ้อน}
    CheckSchedule -->|ซ้ำซ้อน| ScheduleConflict[แจ้งตารางเรียนชนกัน]
    ScheduleConflict --> ViewCourses
    
    CheckSchedule -->|ไม่ซ้ำ| CheckCredits{ตรวจสอบหน่วยกิตสูงสุด}
    CheckCredits -->|เกิน| CreditLimit[แจ้งหน่วยกิตเกินกำหนด]
    CreditLimit --> ViewCourses
    
    CheckCredits -->|ไม่เกิน| ProcessEnrollment[ดำเนินการลงทะเบียน]
    ProcessEnrollment --> UpdateDatabase[อัพเดทฐานข้อมูล]
    UpdateDatabase --> SendNotification[ส่งแจ้งเตือนให้อาจารย์]
    SendNotification --> Success[แจ้งผลสำเร็จ]
    
    Success --> ContinueEnroll{ต้องการลงทะเบียนเพิ่ม?}
    ContinueEnroll -->|ใช่| ViewCourses
    ContinueEnroll -->|ไม่| GenerateSchedule[สร้างตารางเรียน]
    GenerateSchedule --> End([จบ])
```

## 5. Data Flow Diagram (DFD) - Level 0 & Level 1

### Level 0 (Context Diagram)
```mermaid
flowchart LR
    Student[นักเรียน] 
    Instructor[อาจารย์]
    Admin[ผู้ดูแลระบบ]
    
    System[ระบบลงทะเบียนเรียน]
    
    Student -->|คำขอลงทะเบียน| System
    Student -->|คำขอถอนรายวิชา| System
    System -->|ผลการลงทะเบียน| Student
    System -->|ตารางเรียน| Student
    
    Instructor -->|ข้อมูลรายวิชา| System
    System -->|รายชื่อนักเรียน| Instructor
    System -->|รายงานการลงทะเบียน| Instructor
    
    Admin -->|จัดการผู้ใช้| System
    Admin -->|กำหนดค่าระบบ| System
    System -->|รายงานระบบ| Admin
```

### Level 1 (Detailed DFD)
```mermaid
flowchart LR
    Student[นักเรียน]
    Instructor[อาจารย์] 
    Admin[ผู้ดูแลระบบ]
    
    P1[1.0 จัดการการลงทะเบียน]
    P2[2.0 ตรวจสอบคุณสมบัติ]
    P3[3.0 จัดการตารางเรียน]
    P4[4.0 สร้างรายงาน]
    
    D1[(D1: Students)]
    D2[(D2: Courses)]
    D3[(D3: Enrollments)]
    D4[(D4: Schedules)]
    
    Student -->|คำขอลงทะเบียน| P1
    P1 -->|ข้อมูลนักเรียน| P2
    P2 <-->|ข้อมูลนักเรียน| D1
    P2 <-->|ข้อมูลรายวิชา| D2
    P2 -->|ผลการตรวจสอบ| P1
    P1 <-->|ข้อมูลการลงทะเบียน| D3
    P1 -->|ผลการลงทะเบียน| Student
    
    P1 -->|ข้อมูลตารางเรียน| P3
    P3 <-->|ตารางเรียน| D4
    P3 -->|ตารางเรียนส่วนบุคคล| Student
    
    P4 <-->|ข้อมูลการลงทะเบียน| D3
    P4 <-->|ข้อมูลรายวิชา| D2
    P4 -->|รายงานการลงทะเบียน| Instructor
    P4 -->|รายงานระบบ| Admin
    
    Instructor -->|อัพเดทข้อมูลรายวิชา| D2
    Admin -->|จัดการผู้ใช้| D1
```

## 6. Control Flow Diagram - การควบคุมการลงทะเบียน

```mermaid
flowchart LR
    Start([เริ่มต้น]) --> Auth{ตรวจสอบสิทธิ์}
    Auth -->|ไม่ผ่าน| LoginError[แสดงข้อผิดพลาด]
    LoginError --> Start
    
    Auth -->|ผ่าน| CheckPeriod{ตรวจสอบช่วงเวลาลงทะเบียน}
    CheckPeriod -->|นอกช่วงเวลา| PeriodError[แจ้งนอกช่วงเวลา]
    PeriodError --> End([จบ])
    
    CheckPeriod -->|ในช่วงเวลา| ValidateInput{ตรวจสอบข้อมูลนำเข้า}
    ValidateInput -->|ไม่ถูกต้อง| InputError[แจ้งข้อมูลไม่ถูกต้อง]
    InputError --> RetryInput[กรอกข้อมูลใหม่]
    RetryInput --> ValidateInput
    
    ValidateInput -->|ถูกต้อง| BusinessRules{ตรวจสอบกฎธุรกิจ}
    BusinessRules -->|ไม่ผ่าน| RuleError[แจ้งไม่ผ่านกฎธุรกิจ]
    RuleError --> SelectAlternative[เลือกรายวิชาอื่น]
    SelectAlternative --> ValidateInput
    
    BusinessRules -->|ผ่าน| ProcessTransaction{ประมวลผลธุรกรรม}
    ProcessTransaction -->|สำเร็จ| Success[แจ้งผลสำเร็จ]
    ProcessTransaction -->|ล้มเหลว| TransactionError[แจ้งข้อผิดพลาดระบบ]
    
    TransactionError --> Rollback[ยกเลิกการเปลี่ยนแปลง]
    Rollback --> RetryTransaction{ลองใหม่?}
    RetryTransaction -->|ใช่| ProcessTransaction
    RetryTransaction -->|ไม่| End
    
    Success --> LogActivity[บันทึกกิจกรรม]
    LogActivity --> NotifyStakeholders[แจ้งผู้เกี่ยวข้อง]
    NotifyStakeholders --> End
```

## 7. Collaboration Diagram - การทำงานร่วมกันของ Objects

```mermaid
graph TD
    subgraph "Enrollment Process Collaboration"
        S[Student Object]
        ES[EnrollmentSystem Object]
        C[Course Object]
        I[Instructor Object]
        DB[Database Object]
        SC[Schedule Object]
        G[Grade Object]
    end
    
    S -.->|"1: requestEnrollment()" | ES
    ES -.->|"2: validateStudent()"| DB
    ES -.->|"3: getCourseInfo()"| C
    C -.->|"4: checkCapacity()"| C
    C -.->|"5: checkPrerequisites()"| C
    ES -.->|"6: checkScheduleConflict()"| SC
    SC -.->|"7: validateTimeSlot()"| SC
    ES -.->|"8: processEnrollment()"| C
    C -.->|"9: addStudent()"| C
    C -.->|"10: updateDatabase()"| DB
    ES -.->|"11: notifyInstructor()"| I
    I -.->|"12: updateStudentList()"| I
    ES -.->|"13: createGradeRecord()"| G
    G -.->|"14: initializeGrade()"| DB
    ES -.->|"15: confirmEnrollment()"| S

   %%  classDef object fill:#e1f5fe
   %%  classDef message fill:#f3e5f5
    
    class S,ES,C,I,DB,SC,G object
```

## การอธิบายเพิ่มเติม

### ความเชื่อมโยงระหว่าง Diagrams
1. **Class Diagram** แสดงโครงสร้างของระบบ
2. **Sequence Diagram** แสดงลำดับการทำงานตามเวลา
3. **State Diagram** แสดงสถานะต่างๆ ของการลงทะเบียน
4. **Activity Diagram** แสดงขั้นตอนการทำงานแบบ parallel
5. **Data Flow Diagram** แสดงการไหลของข้อมูลในระบบ
6. **Control Flow Diagram** แสดงการควบคุมและการตัดสินใจ
7. **Collaboration Diagram** แสดงการทำงานร่วมกันของ objects

### การปรับปรุงจาก Class Diagram เดิม
- เพิ่ม **Schedule** class สำหรับจัดการตารางเรียน
- เพิ่ม **Grade** class สำหรับจัดการเกรด
- เพิ่ม **EnrollmentSystem** class เป็น controller หลัก
- เพิ่ม attributes และ methods ที่จำเป็นมากขึ้น
- เพิ่ม prerequisites และ capacity management

---

### สรุป Diagrams ที่เพิ่มเติม:
1. **Improved Class Diagram** - ปรับปรุงจากเดิมให้สมบูรณ์ขึ้น
2. **Sequence Diagram** - ลำดับการทำงานของระบบลงทะเบียน
3. **State Diagram** - สถานะต่างๆ ของการลงทะเบียน
4. **Activity Diagram** - ขั้นตอนการลงทะเบียนแบบละเอียด
5. **Data Flow Diagram** - การไหลของข้อมูลในระบบ
6. **Control Flow Diagram** - การควบคุมและตัดสินใจในระบบ
7. **Collaboration Diagram** - การทำงานร่วมกันของ Objects  

