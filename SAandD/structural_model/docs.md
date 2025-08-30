**ความหมายของ Structural Model**
- Structural Model เป็นการเเสดง structure ของ data, object, and Relationships ระหว่าง system component โดยมักใช้ graphical model เพื่อ system analyze เข้าใจ structure ของ system ได้ง่ายขึ้น
  - e.q. structural models
    - ERD (Entity-Relationship Diagram)
      - ใช้ใน database เพื่อเเสดง entity และ relationship
    - class Diagram (UML)
      - เเสดง class และ relationship ระหว่าง class
    - Object Diagram (UML)
      - เเสดง instance ของ class และ relationship ในช่วงเวลาหนึ่ง
    - Component Diagram (UML)
      - เเสดง structure ของ component ใน systemm software
  - Types of Structural Model
    - Conceptual Model
      - เป็นเเบบจำลองเชิงเเนวคิดที่ใช้เพื่อกำหนดโครงสร้าง data และ component ของ ระบบในระดับสูง
      - use ERD || Class Diagram เพื่อระบุ component หลักของ system
    - Logical Model
      - เป็นเเบบจำลองเชิง logic ที่ให้รายละเอียด เชิงโครงสร้าง ของ system โดยไม่ขึ้นกับ Technology
      - use Class Diagram || DFD (Data Flow Diagram) level 1+
    - Physical Model
      - เป็นเเบบจำลองเชิง physical ที่เเสดงว่า structure data เเละ component ต่างๆ จะถูก install จริงใน Hardware || Software อย่างไร
      - use database schema || Component Diagram
  - e.q of Structural Model in UML
    - Class Diagram
      - ใช้สำหรับ design software oriented object OOP โดยเเสดง class เเละ relationship ระหว่าง class เช่น
        - Association
        - Inheritance
        - Aggregation
      ```psql
      
      ```