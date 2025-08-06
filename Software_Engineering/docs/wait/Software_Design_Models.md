## Software Design Models (เเบบจำลองการออกเเบบซอฟต์แวร์)


- **Software design  Models** คือแบบจำลองที่ใชในการวางแผนและกำหนดโครงสร้างของ software เพื่อให้สามารถพัฒนาระบบที่ตรงตามความต้องการและมีประสิทธิภาพ โดยเป็นส่วนสำคัญในกระบวนการพัฒนาซอฟต์แวร์ (Software Development Life Cycle - SDLC)

-  จุดมุ่งหมายหลัก
   1. เพิ่มความชัดเจน: ช่วยใหทุกฝ่ายที่เกี่ยวของ (นักพัฒนา, นักออกแบบ, ผู้ใช้งาน) เข้าใจภาพรวมของระบบ
   2. ลดความซับซ้อน: แบ่งส่วนระบบออกเป็นโครงสร้างหรอแผนผังที่ง่ายต่อการจัดการ
   3. ช่วยสื่อสาร: สร้างความเข้าใจที่ตรงกันระหว่างทีมงาน

- **Structural Models**
  - **Example**: structural diagrams
    - Class Diagrams
    - Component Diagrams
    - Deployment Diagrams
    - Package Diagrams
    - Object Diagrams
    - Composite Structure Diagrams
    - Profile Diagrams
    - Interaction Diagrams
      - Sequence Diagrams
      - Communication Diagrams
      - Timing Diagrams
      - Interaction Overview Diagrams
      - Timing Diagrams
      - State Machine Diagrams
      - Activity Diagrams
      - Use Case Diagrams
- **Behavioral Models**
  - **Example**: behavioral diagrams
    - State Diagrams
      - purpose: แสดงสถานะของระบบและการเปลี่ยนแปลงสถานะที่เกิดขึ้น
      - components:
        - States: สถานะต่าง ๆ ของระบบ
        - Transitions: การเปลี่ยนแปลงจากสถานะหนึ่งไปยังอีกสถานะหนึ่ง
        - Events: เหตุการณ์ที่ทำให้เกิดการเปลี่ยนแปลงสถานะ
    - Activity Diagrams
      - purpose: แสดงลำดับของกิจกรรมหรือกระบวนการที่เกิดขึ้นในระบบ
      - components:
        - Activities: กิจกรรมต่าง ๆ ที่เกิดขึ้น
        - Transitions: การเชื่อมโยงระหว่างกิจกรรม
        - Decision Nodes: จุดตัดสินใจที่มีหลายเส้นทาง
    - Sequence Diagrams
      - purpose: แสดงลำดับการทำงานระหว่างวัตถุในระบบ
      - components:
        - Actors: ผู้ใช้งานหรือวัตถุที่มีส่วนร่วมในกระบวนการ 
        - Lifelines: แทนวัตถุที่มีส่วนร่วมในกระบวนการ
        - Messages: การสื่อสารระหว่างวัตถุ
        - Objects: วัตถุที่มีส่วนร่วมในกระบวนการ
    - Collaboration Diagrams
    - Use Case Diagrams
    - Interaction Overview Diagrams
    - Timing Diagrams
  - Purpose:

**Analysis Models -> Design Models**

- **analysis models**
    - scenario-based elemetent
    - class-based element
    - behavioral element
    - flow-oriented element

- **design models**
  - component-level design
  - interface design
  - architecture design
  - data/class design

- เราจะพาข้อมูลจาก analysis models มาสร้างเป็น design models โดยการแปลงข้อมูลที่ได้จาก analysis models ให้เป็นรูปแบบที่สามารถนำไปใช้ในการพัฒนาซอฟต์แวร์ได้

## Software Design Levele
- interface design
- architectural design
- detail design

- structural models
  - class diagrams -> architectural design
  - component diagrams -> architectural design
  - deployment diagrams -> architectural design
- behavioral models
  - state diagrams -> interface design
  - activity diagrams -> detail design
  - sequence diagrams -> detail design

<!-- ## Software Design Process
- **Software Design Process** คือกระบวนการที่ใช้ในการวางแผนและออกแบบซอฟต์แวร์ โดยมีขั้นตอนหลัก ๆ ดังนี้:
  1. **Requirement Analysis**: วิเคราะห์ความต้องการของผู้ใช้งานและ
  2. **System Design**: ออกแบบโครงสร้างของระบบซอฟต์แวร์
  3. **Component Design**: ออกแบบส่วนประกอบต่าง ๆ ของระบบ
  4. **Interface Design**: ออกแบบส่วนติดต่อผู้ใช้งานและการสื่อสารระหว่างส่วนต่าง ๆ ของระบบ
  5. **Data Design**: ออกแบบโครงสร้างข้อมูลที่ใช้ในระบบ
  6. **Implementation Planning**: วางแผนการพัฒนาและการทดสอบซอฟต์แวร์
  7. **Review and Refinement**: ตรวจสอบและปรับปรุงการออกแบบซอฟต์แวร์ตามความต้องการและข้อเสนอแนะจากผู้ใช้งาน
  8. **Documentation**: จัดทำเอกสารการออกแบบซอฟต์แวร์เพื่อใช้ในการพัฒนาและบำรุงรักษาในอนาคต
  9. **Validation and Verification**: ตรวจสอบความถูกต้องและความสอดคล้องของการออกแบบกับความต้องการของผู้ใช้งาน
  10. **Maintenance Planning**: วางแผนการบำรุงรักษาและปรับปรุงซอฟต์แวร์ในอนาคต
  11. **Deployment Planning**: วางแผนการนำซอฟต์แวร์ไปใช้งานจริง
  12. **Feedback and Iteration**: รับข้อเสนอแนะจากผู้ใช้งานและทำการปรับปรุงซอฟต์แวร์ตามความต้องการ
  13. **Final Review**: ตรวจสอบการออกแบบซอฟต์แวร์ครั้งสุดท้ายก่อนการพัฒนา
  14. **Release Planning**: วางแผนการปล่อยซอฟต์แวร์ให้กับผู้ใช้งาน
  15. **Post-Deployment Review**: ตรวจสอบผลการใช้งานซอฟต์แวร์หลังจากการปล่อยใช้งาน
  16. **Continuous Improvement**: ปรับปรุงและพัฒนาซอฟต์แวร์อย่างต่อเนื่องตามความต้องการและเทคโนโลยีที่เปลี่ยนแปลง
  17. **Maintenance and Support**: ให้การสนับสนุนและบำรุงรักษาซอฟต์แวร์หลังจากการใช้งาน -->