# Project Simple Calculator
## Software Requirements Engineering Process

- inception (การเริ่มต้นวิเคราะห์)
  - คุณทำอะไร: อาจจะคิดเองหรือคุยกับ team (ในฐานะ User) ว่าอยากให้ calculator ทำอะไรได้บ้าง
  - คำถามที่ถาม:
    - "calculator ควรทำอะไรได้บ้าง?" (add subtract multiply divide)
    - "ใครจะใช้มัน?" (ใครก็ตามที่ต้องการคำนวณ)
    - "มันจะทำงานบน platform ไหน?" (web, mobile, desktop)
  - result: ต้องการ calculator ที่สามารถ add, subtract, multiply, divide เลข 2 จำนวนได้

- elicitation (การเจาะลึกความต้องการ)
  - คุณทำอะไร: นึกถึงความต้องการใช้งาน calculator จริงๆ
  - กิจกรรม:
    - "เมื่อเรากดตัวเลข ต้องแสดงผลที่หน้าจอ"
    - "เมื่อกดเครื่องหมาย ต้องจำเครื่องหมายไว้"
    - "เมื่อกดตัวเลขที่สอง เเล้วกดเท่ากับ ต้องแสดงผลลัพธ์"
  - result: ได้รายการความต้องการ เช่น "เเสดงผลลัพธ์","รับตัวเลขได้","รับเครื่องหมายการคำนวณได้"

- elaboration (การขยายความรายละเอียด)
  - คุณทำอะไร: เริ่มจัดระเบียบเเละระบุรายละเอียดของความต้องการที่รวบรวมมา
  - กิจกรรม:
    - function: "add", "subtract", "multiply", "divide"
    - data:"ตัวเลขเเรก","ตัวเลขที่สอง","ผลลัพธ์","เครื่องหมาย"
    - ขั้นตอน: กดตัวเลขเเรก 1 -> กดเครื่องหมาย -> กดตัวเลขที่ 2 -> กดเท่ากับ -> แสดงผลลัพธ์
  - result: เห็นภาพรวมของ functionality เเละ data ที่เกี่ยวข้อง

- negotiation (การเจรจาต่อรอง)
  - คุณทำอะไร: ใน project เล็กๆ อย่างนี้ การเจรจาอาจจะไม่ซับซ้อนมาก เป็นการสินใจกับตัวเองหรือ team ว่า "จะเพิ่ม functionality พิเศษไหม? เช่น รากที่สอง? หรือเเค่ 4 อย่างหลักก็พอเเล้วสำหรับ version แรก?"
  - result: ตัดสินใจว่าจะทำเเค่ add, subtract, multiply, divide เพื่อให้ง่ายเเละรวดเร็ว

- specification (การทำข้อกำหนด)
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
  

- validation (การตรวจรับ)
  - คุณทำอะไร: ลองคิดภาพว่าถ้ามีเครื่อง calculator นี้คุณจะลองใช้งานยังไง? กด 1 + 1 = 2 ถูกไหม?
  - result: ยืนยันว่าสิ่งที่่กำหนดไว้ในนั้นถูกต้อง เเละสามารถใช้งานได้จริง

- requirement management (การจัดการความต้องการ)
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
    
    ## **State Diagram**:
    ```mermaid
    stateDiagram-v2
        [*] --> WaitingForFirstNumber : Start
        
        WaitingForFirstNumber --> FirstNumberEntered : กดตัวเลข / แสดงตัวเลข
        FirstNumberEntered --> FirstNumberEntered : กดตัวเลขต่อ / เพิ่มตัวเลข
        FirstNumberEntered --> OperatorSelected : กดโอเปอเรเตอร์ / เก็บเลขที่1
        
        OperatorSelected --> SecondNumberEntered : กดตัวเลข / แสดงตัวเลข
        SecondNumberEntered --> SecondNumberEntered : กดตัวเลขต่อ / เพิ่มตัวเลข
        SecondNumberEntered --> ResultDisplayed : กด = / คำนวณและแสดงผล
        
        ResultDisplayed --> WaitingForFirstNumber : กด Clear / ล้างข้อมูล
        ResultDisplayed --> OperatorSelected : กดโอเปอเรเตอร์ / ใช้ผลลัพธ์เป็นเลขที่1
        
        FirstNumberEntered --> WaitingForFirstNumber : กด Clear / ล้างข้อมูล
        OperatorSelected --> WaitingForFirstNumber : กด Clear / ล้างข้อมูล
        SecondNumberEntered --> WaitingForFirstNumber : กด Clear / ล้างข้อมูล
        
        note right of ResultDisplayed
            ผลลัพธ์สามารถนำไปใช้
            ในการคำนวณครั้งต่อไปได้
        end note
    ```

- flow-oriented element
  - **tools**: data flow diagram(DFD)
  - ในสถานการณ์ calculator:
  
    ## **DFD Level 0 (Context Diagram)**
    ```mermaid
    graph LR
      A["User"] -->|Input numbers and operator| B["Simple Calculator System"]
      B -->|Output results or error message| A
    ```

    ## **DFD Level 1 (Simple Calculator System)**
    ```mermaid
    graph LR
        A[ผู้ใช้] -->|อินพุต| P1(1.0<br/>รับอินพุต)
        P1 -->|ข้อมูลที่ถูกต้อง| P2(2.0<br/>คำนวณ)
        P1 -->|ข้อผิดพลาด| P3(3.0<br/>แสดงผล)
        
        P2 -->|ข้อมูลคำนวณ| DS1[(D1: Memory)]
        DS1 -->|ข้อมูลเก่า| P2
        P2 -->|ผลลัพธ์| P3
        P3 -->|ผลลัพธ์/Error| A
    ```

    ## **Data Dictionary**
    ### **Data Flows**:
    - **อินพุต**: ตัวเลข (0-9), โอเปอเรเตอร์ (+,-,*,/), เท่ากับ (=), Clear (C)
    - **ข้อมูลที่ถูกต้อง**: อินพุตที่ผ่านการตรวจสอบแล้ว
    - **ข้อผิดพลาด**: อินพุตที่ไม่ถูกต้องหรือการคำนวณที่ผิดพลาด
    - **ข้อมูลคำนวณ**: ตัวเลข, โอเปอเรเตอร์ สำหรับการคำนวณ
    - **ผลลัพธ์**: ผลการคำนวณ หรือ ข้อความผิดพลาด

    ### **Data Stores**:
    - **D1: Memory**: เก็บตัวเลขปัจจุบัน, โอเปอเรเตอร์, ผลลัพธ์ก่อนหน้า

    ### **Processes**:
    - **1.0**: รับอินพุต - ตรวจสอบและรับข้อมูลจากผู้ใช้
    - **2.0**: คำนวณ - ดำเนินการคำนวณ (+, -, *, /)
    - **3.0**: แสดงผล - แสดงผลลัพธ์หรือข้อความผิดพลาด

## Design Model
- **Architecture Pattern**: MVC (Model-View-Controller)
  - **Model**: CalculatorModel (จัดการข้อมูลและการคำนวณ)
  - **View**: CalculatorView (UI components และการแสดงผล)
  - **Controller**: CalculatorController (จัดการ user interactions)

- **Component Design**:
  - InputValidator: ตรวจสอบความถูกต้องของ input
  - Calculator: Core calculation logic
  - Display: จัดการการแสดงผล
  - ErrorHandler: จัดการ error cases

- **Interface Design**:
  - Button layout: 4x4 grid
  - Display: single line result display
  - Responsive design for different screen sizes

## Enhanced Specifications

### **Detailed Use Case: คำนวณผลรวม (Add)**
- **Preconditions**: System is in ready state
- **Main Flow**:
  1. User enters first number
  2. User selects addition operator (+)
  3. User enters second number
  4. User presses equals (=)
  5. System displays sum result
- **Alternative Flows**:
  - A1: User presses operator without entering first number (default to 0)
  - A2: User presses equals without second number (repeat first number)
- **Postconditions**: Result is displayed and stored for potential continued operations
- **Exception Handling**:
  - Invalid number format: Display "Error"
  - Number overflow: Display "Overflow"

### **Enhanced Non-functional Requirements**:
- **Performance**: 
  - Response time < 100ms for any calculation
  - Support numbers up to 15 digits
- **Usability**:
  - One-handed operation possible
  - Clear visual feedback for button presses
  - Intuitive button layout following standard calculator conventions
- **Reliability**:
  - 99.9% uptime for web version
  - Graceful error handling for all edge cases
- **Error Handling**:
  - Division by zero: Display "Cannot divide by zero"
  - Invalid operations: Display appropriate error message
  - Memory overflow: Display "Number too large"

### **Additional Features to Consider**:
- Clear (C) and All Clear (AC) buttons
- Backspace functionality
- Memory functions (M+, M-, MR, MC)
- History of calculations
- Keyboard input support

## Test Strategy

### **Unit Tests**:
- Test each arithmetic operation with positive numbers
- Test each arithmetic operation with negative numbers
- Test division by zero
- Test invalid input handling
- Test number overflow scenarios

### **Integration Tests**:
- Test complete calculation workflows
- Test UI interaction with calculation engine
- Test error display functionality

### **User Acceptance Tests**:
- Basic arithmetic operations work correctly
- Error messages are clear and helpful
- UI is intuitive and responsive
- Calculator behaves like standard calculators

## Implementation Plan

### **Phase 1**: Core Functionality
- Basic arithmetic operations
- Simple UI layout
- Basic error handling

### **Phase 2**: Enhanced Features
- Advanced error handling
- Improved UI/UX
- Input validation

### **Phase 3**: Testing & Polish
- Comprehensive testing
- Performance optimization
- Documentation completion

## Risk Assessment
- **Technical Risks**:
  - Floating point precision issues
  - Browser compatibility issues
- **Mitigation**:
  - Use decimal libraries for precise calculations
  - Test across multiple browsers
