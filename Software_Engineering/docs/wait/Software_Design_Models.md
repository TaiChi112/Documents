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

- analysis models
    - scenario-based elemetent
    - class-based element
    - behavioral element
    - flow-oriented element

**Design Models**
- design models
  - component-level design
  - interface design
  - architecture design
  - data/class design

- เราจะพาข้อมูลจาก analysis models มาสร้างเป็น design models โดยการแปลงข้อมูลที่ได้จาก analysis models ให้เป็นรูปแบบที่สามารถนำไปใช้ในการพัฒนาซอฟต์แวร์ได้