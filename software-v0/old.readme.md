# Project Simple Calculator
## Software Requirements Engineering Process

- inception
  - คุณทำอะไร: อาจจะคิดเองหรือคุยกับ team (ในฐานะ User) ว่าอยากให้ calculator ทำอะไรได้บ้าง
  - คำถามที่ถาม:
    - "calculator ควรทำอะไรได้บ้าง?" (add subtract multiply divide)
    - "ใครจะใช้มัน?" (ใครก็ตามที่ต้องการคำนวณ)
    - "มันจะทำงานบน platform ไหน?" (web, mobile, desktop)
  - result: ต้องการ calculator ที่สามารถ add, subtract, multiply, divide เลข 2 จำนวนได้

- eliciation
  - คุณทำอะไร: นึกถึงความต้องการใช้งาน calculator จริงๆ
  - กิจกรรม:
    - "เมื่อเรากดตัวเลข ต้องแสดงผลที่หน้าจอ"
    - "เมื่อกดเครื่องหมาย ต้องจำเครื่องหมายไว้"
    - "เมื่อกดตัวเลขที่สอง เเล้วกดเท่ากับ ต้องแสดงผลลัพธ์"
  - result: ได้รายการความต้องการ เช่น "เเสดงผลลัพธ์","รับตัวเลขได้","รับเครื่องหมายการคำนวณได้"

- elaboration
  - คุณทำอะไร: เริ่มจัดระเบียบเเละระบุรายละเอียดของความต้องการที่รวบรวมมา
  - กิจกรรม:
    - function: "add", "subtract", "multiply", "divide"
    - data:"ตัวเลขเเรก","ตัวเลขที่สอง","ผลลัพธ์","เครื่องหมาย"
    - ขั้นตอน: กดตัวเลขเเรก 1 -> กดเครื่องหมาย -> กดตัวเลขที่ 2 -> กดเท่ากับ -> แสดงผลลัพธ์
  - result: เห็นภาพรวมของ functionality เเละ data ที่เกี่ยวข้อง

- negotiation
  - คุณทำอะไร: ใน project เล็กๆ อย่างนี้ การเจรจาอาจจะไม่ซับซ้อนมาก เป็นการสินใจกับตัวเองหรือ team ว่า "จะเพิ่ม functionality พิเศษไหม? เช่น รากที่สอง? หรือเเค่ 4 อย่างหลักก็พอเเล้วสำหรับ version แรก?"
  - result: ตัดสินใจว่าจะทำเเค่ add, subtract, multiply, divide เพื่อให้ง่ายเเละรวดเร็ว

- specification
  - คุณทำอะไร: เขียนสรุปความต้องการทั้งหมดในรูปแบบที่ชัดเจน เเละเป็นทางการ
  - SRS (Software Requirements Specification) เเบบย่อๆ:
    - **Functionality**:
      - ระบบต้องสามารถรับตัวเลข
      - รับเครื่องหมายการคำนวณ (+, -, *, /)
      - ประมวลผลการคำนวณตามเครื่องหมาย
      - แสดงผลลัพธ์ที่หน้าจอ
    - **Non-functional requirements**:
      - ใช้งานง่าย
      - คำนวณถูกต้อง
    - **User Interface**:
      - ปุ่มตัวเลข 0-9
      - ปุ่มเครื่องหมาย (+, -, *, /)
      - ปุ่มเท่ากับ (=)
      - ช่องหรือหน้าจอแสดงผลลัพธ์
  - result: document (อาจจะสั้นๆ) ที่ระบุสิ่งที่เครื่องคิดเลขต้องทำได้
  

- validation
  - คุณทำอะไร: ลองคิดภาพว่าถ้ามีเครื่อง calculator นี้คุณจะลองใช้งานยังไง? กด 1 + 1 = 2 ถูกไหม?
  - result: ยืนยันว่าสิ่งที่่กำหนดไว้ในนั้นถูกต้อง เเละสามารถใช้งานได้จริง
  
- requirement management
  - คุณทำอะไร: หากในอนาคตอยากเพิ่ม functionality (เช่น percentage, square root) ก็ต้องบันทึกไว้เป็นการเปลี่ยนเเปลง

## Analysis Model
- Scenario-based element
  - **tools**: Use Case Diagram, Use Case Description
  - ในสถานการณ์ calculator:
    - **Actors**: User
    - **Use Cases**:
      -  คำนวณผลรวม:(add)
      -  คำนวณผลต่าง:(subtract)
      -  คำนวณผลคูณ:(multiply)
      -  คำนวณผลหาร:(divide)
    - **Use Case Diagram**: (สำหรับ "คำนวณผลรวม"):
      - User input numbers (เช่น 5)
      - User input operator (เช่น +)
      - User input second number (เช่น 3)
      - User press equals (=)
      - System displays result (เช่น 8)

- class-based element
  - **tools**: class diagram
  - ในสถานการณ์ calculator:
    - **Classes**: Calculator
      - **Attributes**:
        - firstNumber: decimal
        - secondNumber: decimal
        - operator: string (เก็บค่า "+", "-", "*", "/")
        - result: decimal
      - **Operations** (Methods):
        - add(num1, num2): decimal
        - subtract(num1, num2): decimal
        - multiply(num1, num2): decimal
        - divide(num1, num2): decimal
        - processInput(input): void (จัดการ การรับค่าจาก buttons)
  
- behavioral element
  - **tools**: state diagram, activity diagram, sequence diagram
  - ในสถานการณ์ calculator:(e.q. state diagram สำหรับ calculator)
    - **States**:
      - WaitingForFirstNumber(initial state)
      - FirstNumberEntered  
      - OperatorSelected
      - SecondNumberEntered
      - ResultDisplayed
    - **Transitions**(การเปลี่ยนสถานะ):
      - WaitingForFirstNumber -> FirstNumberEntered (เมื่อ user กดตัวเลข)
      - FirstNumberEntered -> OperatorSelected (เมื่อ user กดเครื่องหมาย)
      - OperatorSelected -> SecondNumberEntered (เมื่อ user กดตัวเลขที่สอง)
      - SecondNumberEntered -> ResultDisplayed (เมื่อ user กดเท่ากับ)
      - ResultDisplayed -> WaitingForFirstNumber (เมื่อ user กด clear หรือเริ่มการคำนวณใหม่)

- flow-oriented element
  - **tools**: data flow diagram(DFD)
  - ในสถานการณ์ calculator:
    - **DFD Level 0 (context diagram)**:
    - ```mermaid
          graph LR
            A[ผู้ใช้] -->|อินพุตตัวเลข/โอเปอเรเตอร์| B(Software Calculator)
            B -->|ผลลัพธ์การคำนวณ| A
        ```
    - External Entity: User
    - Process: Simple Calculator System
    - Data Flows:
      - ตัวเลขเเละเครื่องหมาย: จาก User ไปยัง System
      - ผลลัพธ์: จาก System กลับไปยัง User
    - **DFD Level 1 (Simple Calculator System)**:
    - ```mermaid
      graph LR
          subgraph ประมวลผลการคำนวณ
              C1(ตรวจสอบอินพุต)
              C2(จัดเก็บ/เรียกคืนตัวเลข)
              C3(ดำเนินการทางคณิตศาสตร์)
              C4(จัดการข้อผิดพลาด)
          end

          B(รับอินพุต) -->|อินพุต| C1
          C1 -->|อินพุตที่ถูกต้อง| C2
          C1 -->|อินพุตผิดพลาด| C4
          C2 -->|ตัวเลข/โอเปอเรเตอร์| C3
          C3 -->|ผลลัพธ์คำนวณ| D(แสดงผลลัพธ์)
          C3 -->|ข้อมูลบันทึก| E[หน่วยความจำการคำนวณ]
          E -->|ข้อมูลเรียกคืน| C2
          C4 -->|ข้อความผิดพลาด| D
      ```
    - Process: 
      - input handler: รับ data จาก user (ตัวเลข, เครื่องหมาย)
      - calculation engine: ทำหน้าที่คำนวณตามตัวเลขเเละเครื่องหมายที่ได้รับ
      - display handler: แสดงผลลัพธ์ที่หน้าจอ
    - Data Stores:
      - internal storage: ที่เก็บข้อมูลชั่วคราวสำหรับตัวเลขเเรก, เครื่องหมาย, ตัวเลขที่สอง, ผลลัพธ์ ก่อนคำนวณ
    - Data Flows:
      - ตัวเลขและเครื่องหมายที่รับได้: จาก User (ผ่าน Input Handler) ไปยัง Internal Storage
      - ตัวเลขแรก: จาก Internal Storage ไปยัง Calculation Engine
      - เครื่องหมาย: จาก Internal Storage ไปยัง Calculation Engine
      - ตัวเลขที่สอง: จาก Internal Storage ไปยัง Calculation Engine
      - ผลลัพธ์ที่คำนวณ: จาก Calculation Engine ไปยัง Output Display
    - ```mermaid
      graph LR
        subgraph "ดำเนินการทางคณิตศาสตร์"
            C3.1(รับตัวเลขและโอเปอเรเตอร์)
            C3.2(เลือกการดำเนินการ)
            C3.3(ดำเนินการบวก)
            C3.4(ดำเนินการลบ)
            C3.5(ดำเนินการคูณ)
            C3.6(ดำเนินการหาร)
            C3.7(ส่งผลลัพธ์)
        end
    
        C2(จัดเก็บ/เรียกคืนตัวเลข) -->|ตัวเลข1, ตัวเลข2, โอเปอเรเตอร์| C3.1
        C3.1 -->|ข้อมูลการคำนวณ| C3.2
        C3.2 -->|ถ้าโอเปอเรเตอร์ = บวก| C3.3
        C3.2 -->|ถ้าโอเปอเรเตอร์ = ลบ| C3.4
        C3.2 -->|ถ้าโอเปอเรเตอร์ = คูณ| C3.5
        C3.2 -->|ถ้าโอเปอเรเตอร์ = หาร| C3.6
        C3.3 -->|ผลบวก| C3.7
        C3.4 -->|ผลลบ| C3.7
        C3.5 -->|ผลคูณ| C3.7
        C3.6 -->|ผลหาร| C3.7
        C3.7 -->|ผลลัพธ์ขั้นสุดท้าย| D(แสดงผลลัพธ์)

    ```

