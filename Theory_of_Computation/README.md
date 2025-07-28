## Theory of Computation

- [ ] What is Theory of Computation?
- [ ] What is FA (Finite Automata)?
  - [ ] What is DFA (Deterministic Finite Automata)?
  - [ ] What is NFA (Nondeterministic Finite Automata)?
  - [ ] What is ε-NFA (Epsilon Nondeterministic Finite Automata)?
- [ ] What is PA (Pushdown Automata)?
  - [ ] What is PDA (Pushdown Automata with Stack)?
  - [ ] What is NPDA (Nondeterministic Pushdown Automata)?
  - [ ] What is DPDA (Deterministic Pushdown Automata)?
  - [ ] What is LBA (Linear Bounded Automata)?
- [ ] What is TM (Turing Machine)?
  - [ ] What is DTM (Deterministic Turing Machine)?
  - [ ] What is NTM (Nondeterministic Turing Machine)?
  - [ ] What is ATM (Alternating Turing Machine)?
- [ ] What is Computability?
- [ ] What is Complexity?
- [ ] What is P (Polynomial Time)?
- [ ] What is NP (Nondeterministic Polynomial Time)?
- [ ] What is NP-Complete?
- [ ] What is NP-Hard?
- [ ] What is PSPACE?
- [ ] What is EXPTIME?
- [ ] What is L (Logarithmic Space)?
- [ ] What is CFG (Context-Free Grammar)?
- [ ] What is Regular Expression?
- [ ] Convert FA to Regular Expression
- [ ] Convert Regular Expression to FA
- [ ] What is Chomsky Hierarchy?
- [ ] What is Pumping Lemma?
- [ ] What is Closure Properties of Languages?
- [ ] What is Decidability?
- [ ] What is Undecidability?

- [ ] ลองเขียน DFA, NFA, ε-NFA, PDA, NPDA, DPDA, TM, DTM, NTM, ATM ด้วยตัวเอง
- [ ] ลองเขียน Regular Expression ด้วยตัวเอง
- [ ] ลองเขียน CFG ด้วยตัวเอง

- [ ] ลองเขียนโปรแกรมที่สามารถจำลองการทำงานของ FA, PA, TM ได้
- [ ] ลองเขียนโปรแกรมที่สามารถตรวจสอบว่า FA, PA, TM
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง FA เป็น Regular Expression และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง Regular Expression เป็น FA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง CFG เป็น PDA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง PDA เป็น CFG และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง TM เป็น DTM และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง DTM เป็น NTM และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง NTM เป็น TM และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง ATM เป็น DTM และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง DTM เป็น ATM และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง ATM เป็น NTM และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง NTM เป็น ATM และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง ATM เป็น PA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง PA เป็น ATM และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง PA เป็น NFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง NFA เป็น PA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง NFA เป็น DFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง DFA เป็น NFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง DFA เป็น ε-NFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง ε-NFA เป็น DFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง ε-NFA เป็น NFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง NFA เป็น ε-NFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง ε-NFA เป็น Regular Expression และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง Regular Expression เป็น ε-NFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง Regular Expression เป็น DFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง DFA เป็น Regular Expression และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง Regular Expression เป็น NFA และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง NFA เป็น Regular Expression และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง Regular Expression เป็น CFG และกลับกัน
- [ ] ลองเขียนโปรแกรมที่สามารถแปลง CFG เป็น Regular Expression และกลับกัน

# DFA Diagram Example
- [x] ลองเขียน DFA Diagram กรณีที่เรามีข้อมูลครบทั้ง (5-tuple)
  - Q: set of states -> {q0, q1, q2, q3}
  - Σ: input alphabet -> {0, 1}
  - δ: transition function
    - δ: Q x Σ -> Q
        - δ(q0, 0) = q0
        - δ(q0, 1) = q1
        - δ(q1, 0) = q0
        - δ(q1, 1) = q2
        - δ(q2, 0) = q3
        - δ(q2, 1) = q2
        - δ(q3, 0) = q3
        - δ(q3, 1) = q2
  - q0: initial state 
  - F: set of accept states {q2,q3}
  - ```mermaid
    graph LR
      q0((q0)) -->|0| q0
      q0 -->|1| q1
      q1((q1)) -->|0| q0
      q1 -->|1| q2
      q2(((q2))) -->|0| q3
      q2 -->|1| q2
      q3(((q3))) -->|0| q3
      q3 -->|1| q2
    ```
- [x] ลองเขียน DFA Diagram กรณีที่เรามีข้อมูลไม่ครบทั้ง (5-tuple)
  - Q: set of states -> {q0, q1, q2}
  - Σ: input alphabet -> {0, 1}
  - δ: transition function
    - δ: Q x Σ -> Q
        - δ(q0, 0) = q0
        - δ(q0, 1) = q1
        - δ(q1, 0) = q2
        - δ(q1, 1) = q1
        - δ(q2, 0) = q2
        - δ(q2, 1) = q2
  - q0: initial state
  - F: set of accept states {q1}
  - ```mermaid
    graph LR
      q0((q0)) -->|0| q0
      q0 -->|1| q1
      q1(((q1))) -->|0| q2
      q1 -->|1| q1
      q2((q2)) -->|0| q2
      q2 -->|1| q2
    ```
#
- [x] คำถามคือ หลังจากที่เรารู้ส่วนประกอบของ DFA แล้วสร้าง Diagram ตามข้อมูลที่เรามีจะเอาไปทำอะไรต่อ
  - คำตอบคือ เราสามารถใช้ Diagram นี้ในการวิเคราะห์การทำงานของ DFA ได้ เช่น การตรวจสอบว่า DFA นี้สามารถยอมรับสตริงใดบ้าง หรือการวิเคราะห์ความซับซ้อนของ DFA ในการประมวลผลสตริงต่างๆ
  - นอกจากนี้ยังสามารถใช้ Diagram นี้ในการแปลง DFA เป็นรูปแบบอื่นๆ เช่น NFA หรือ ε-NFA ได้อีกด้วย
  - [x] formula δ*:Q x Σ* -> Q
  - ตัวอย่างการตรวจสอบว่า DFA นี้สามารถยอมรับสตริง "0101" ได้หรือไม่
    - เริ่มจากสถานะ q0
    - อ่าน 0: ยังคงอยู่ที่ q0
    - อ่าน 1: ย้ายไปที่ q1
    - อ่าน 0: ย้ายไปที่ q2
    - อ่าน 1: ยังคงอยู่ที่ q2
    - สตริง "0101" ถูกยอมรับเพราะสิ้นสุดที่สถานะ accept state (q2)
    - ดังนั้น DFA นี้สามารถยอมรับสตริง "0101" ได้
    - δ*(q0, "0101")
    - δ(δ*(q0, "010"), 1) = δ(q2, 1) = q2
    - δ(δ*(q0, "01"), 0) = δ(q1, 0) = q2
    - δ(δ*(q0, "0"), 1) = δ(q0, 1) = q1
    - δ(δ*(q0, ""), 0) = δ(q0, 0) = q0
#
  - [x] formula δ*:Q x Σ* -> Q
  - ตัวอย่างการตรวจสอบว่า DFA นี้สามารถยอมรับสตริง "0110" ได้หรือไม่
    - เริ่มจากสถานะ q0
    - อ่าน 0: ยังคงอยู่ที่ q0
    - อ่าน 1: ย้ายไปที่ q1
    - อ่าน 1: ยังคงอยู่ที่ q1
    - อ่าน 0: ย้ายไปที่ q2
    - สตริง "0110" ถูกยอมรับเพราะสิ้นสุดที่สถานะ accept state (q2)
    - ดังนั้น DFA นี้สามารถยอมรับสตริง "0110" ได้
    - δ*(q0, "0110")
    - δ(δ*(q0, "011"), 0) = δ(q2, 0) = q2
    - δ(δ*(q0, "01"), 1) = δ(q1, 1) = q2
    - δ(δ*(q0, "0"), 1) = δ(q0, 1) = q1
    - δ(δ*(q0, ""), 0) = δ(q0, 0) = q0 
#
  - ตัวอย่างการตรวจสอบว่า DFA นี้สามารถยอมรับสตริง "001" ได้หรือไม่
    - เริ่มจากสถานะ q0
    - อ่าน 0: ยังคงอยู่ที่ q0
    - อ่าน 0: ยังคงอยู่ที่ q0
    - อ่าน 1: ย้ายไปที่ q1
    - สตริง "001" ไม่ถูกยอมรับเพราะสิ้นสุดที่สถานะ q1 ซึ่งไม่ใช่ accept state
    - ดังนั้น DFA นี้ไม่สามารถยอมรับสตริง "001" ได้
  - นอกจากนี้ยังสามารถใช้ Diagram นี้ในการวิเคราะห์ความซับซ้อนของ DFA ได้ เช่น การนับจำนวนสถานะและการเปลี่ยนแปลงของสถานะในแต่ละการอ่านสัญลักษณ์จาก input alphabet
  - การวิเคราะห์นี้สามารถช่วยในการปรับปรุงประสิทธิภาพของ DFA และการออกแบบ DFA ที่มีประสิทธิภาพมากขึ้นได้
#
  - ตัวอย่างการวิเคราะห์ความซับซ้อนของ DFA นี้
    - จำนวนสถานะ: 3 (q0, q1, q2)
    - จำนวนการเปลี่ยนแปลงสถานะ: 6 (จาก q0 ไป q0, q0 ไป q1, q1 ไป q2, q1 ไป q1, q2 ไป q2, q2 ไป q2)
    - ความซับซ้อนของ DFA นี้ค่อนข้างต่ำ เนื่องจากมีจำนวนสถานะและการเปลี่ยนแปลงสถานะน้อย
    - การวิเคราะห์นี้สามารถช่วยในการออกแบบ DFA ที่มีประสิทธิภาพมากขึ้นได้ เช่น การลดจำนวนสถานะและการเปลี่ยนแปลงสถานะให้ต่ำที่สุด
    - นอกจากนี้ยังสามารถใช้เทคนิคต่างๆ เช่น การรวมสถานะที่มีการเปลี่ยนแปลงเหมือนกัน หรือการลบสถานะที่ไม่จำเป็นออกจาก DFA เพื่อปรับปรุงประสิทธิภาพของ DFA ได้อีกด้วย
    - การวิเคราะห์นี้ยังสามารถช่วยในการออกแบบ DFA ที่สามารถยอมรับสตริงที่มีรูปแบบเฉพาะได้ เช่น การยอมรับสตริงที่มีจำนวน 0 และ 1 เท่ากัน หรือการยอมรับสตริงที่มีรูปแบบเฉพาะเช่น "ab", "ba" เป็นต้น
#
  - นอกจากนี้ยังสามารถใช้ Diagram นี้ในการสร้างเครื่องมือที่สามารถจำลองการทำงานของ DFA ได้ เช่น การสร้างโปรแกรมที่สามารถรับ input string และตรวจสอบว่า DFA นี้สามารถยอมรับสตริงนั้นได้หรือไม่
  - การสร้างเครื่องมือดังกล่าวสามารถช่วยในการศึกษาและเข้าใจการทำงานของ DFA ได้ดีขึ้น และสามารถใช้ในการสอนหรือการเรียนรู้เกี่ยวกับทฤษฎีของการคำนวณได้
  - ตัวอย่างการสร้างโปรแกรมที่สามารถจำลองการทำงานของ DFA นี้
    ```python
    class DFA:
        def __init__(self, states, alphabet, transition_function, initial_state, accept_states):
            self.states = states
            self.alphabet = alphabet
            self.transition_function = transition_function
            self.initial_state = initial_state
            self.accept_states = accept_states

        def accepts(self, input_string):
            current_state = self.initial_state
            for symbol in input_string:
                if symbol not in self.alphabet:
                    return False  # Invalid symbol
                current_state = self.transition_function[current_state][symbol]
            return current_state in self.accept_states

    # Define the DFA components
    states = {'q0', 'q1', 'q2'}
    alphabet = {'0', '1'}
    transition_function = {
        'q0': {'0': 'q0', '1': 'q1'},
        'q1': {'0': 'q2', '1': 'q1'},
        'q2': {'0': 'q2', '1': 'q2'}
    }
    initial_state = 'q0'
    accept_states = {'q1'}

    # Create the DFA instance
    dfa = DFA(states, alphabet, transition_function, initial_state, accept_states)

    # Test the DFA with an input string
    test_string = "010"
    print(f"The string '{test_string}' is accepted by the DFA: {dfa.accepts(test_string)}")
    ```

- [ ] มาถึงจุดนี้เราควรจะเข้าใจเเละสามารถทำสิ่งเหล่านี้ได้ 
  - [ ] กรณีที่ 1 กรณีที่เรามีข้อมูลครบทั้ง (5-tuple)
    - [ ] สร้าง DFA Diagram
    - [ ] เขียนโปรแกรมที่สามารถจำลองการทำงานของ DFA ได้
    - [ ] ตรวจสอบว่า DFA นี้สามารถยอมรับสตริงใดบ้าง
- [ ] เพื่อพิสูจน์ว่าเราสามารถทำสิ่งเหล่านี้ได้จริงๆ งั้นมาลองทำโจทย์ดูกัน เช่น การสร้าง DFA Diagram เเละตรวจสอบ String ที่สามารถยอมรับได้ไหมกับ DFA Diagram
  - [ ] สร้าง DFA Diagram สำหรับสตริงที่มีรูปแบบ "ab" หรือ "ba"
    - [ ] Q: set of states -> {q0, q1, q2}
    - [ ] Σ: input alphabet -> {a, b}
    - [ ] δ: transition function
      - δ(q0, a) = q1
      - δ(q0, b) = q2
      - δ(q1, a) = q1
      - δ(q1, b) = q2
      - δ(q2, a) = q1
      - δ(q2, b) = q2
    - [ ] q0: initial state
    - [ ] F: set of accept states {q1, q2}
    - ```mermaid
      graph LR
        q0((q0)) -->|a| q1
        q0 -->|b| q2
        q1(((q1))) -->|a| q1
        q1 -->|b| q2
        q2((q2)) -->|a| q1
        q2 -->|b| q2
      ```
    - [ ] ตรวจสอบว่า DFA นี้สามารถยอมรับสตริง "ab" ได้หรือไม่
      - เริ่มจากสถานะ q0
      - อ่าน a: ย้ายไปที่ q1
      - อ่าน b: ย้ายไปที่ q2
      - สตริง "ab" ถูกยอมรับเพราะสิ้นสุดที่สถานะ accept state (q2)
      - ดังนั้น DFA นี้สามารถยอมรับสตริง "ab" ได้
      - δ*(q0, "ab")
      - δ(δ*(q0, "a"), b) = δ(q1, b) = q2
      - δ(δ*(q0, ""), a) = δ(q0, a) = q1
      - δ(δ*(q0, ""), b) = δ(q0, b) = q2
      - ดังนั้น DFA นี้สามารถยอมรับสตริง "ab" ได้
  - [ ] สร้าง DFA Diagram สำหรับสตริงที่มีรูปแบบ "aa" หรือ "bb"
    - [ ] Q: set of states -> {q0, q1, q2}
    - [ ] Σ: input alphabet -> {a, b}
    - [ ] δ: transition function
      - δ(q0, a) = q1
      - δ(q0, b) = q2
      - δ(q1, a) = q1
      - δ(q1, b) = q2
      - δ(q2, a) = q1
      - δ(q2, b) = q2
    - [ ] q0: initial state
    - [ ] F: set of accept states {q1, q2}
    - ```mermaid
      graph LR
        q0((q0)) -->|a| q1
        q0 -->|b| q2
        q1(((q1))) -->|a| q1
        q1 -->|b| q2
        q2((q2)) -->|a| q1
        q2 -->|b| q2
      ```
    - [ ] ตรวจสอบว่า DFA นี้สามารถยอมรับสตริง "aa" ได้หรือไม่
      - เริ่มจากสถานะ q0
      - อ่าน a: ย้ายไปที่ q1
      - อ่าน a: ยังคงอยู่ที่ q1
      - สตริง "aa" ถูกยอมรับเพราะสิ้นสุดที่สถานะ accept state (q1)
      - ดังนั้น DFA นี้สามารถยอมรับสตริง "aa" ได้
      - δ*(q0, "aa")
      - δ(δ*(q0, "a"), a) = δ(q1, a) = q1
      - δ(δ*(q0, ""), a) = δ(q0, a) = q1
      - ดังนั้น DFA นี้สามารถยอมรับสตริง "aa" ได้
  - [ ] สร้าง DFA Diagram สำหรับสตริงที่มีรูปแบบ "ab" หรือ "ba"
    - [ ] Q: set of states -> {q0, q1, q2}
    - [ ] Σ: input alphabet -> {a, b}
    - [ ] δ: transition function
      - δ(q0, a) = q1
      - δ(q0, b) = q2
      - δ(q1, a) = q1
      - δ(q1, b) = q2
      - δ(q2, a) = q1
      - δ(q2, b) = q2
    - [ ] q0: initial state
    - [ ] F: set of accept states {q1, q2}
    - ```mermaid
      graph LR
        q0((q0)) -->|a| q1
        q0 -->|b| q2
        q1(((q1))) -->|a| q1
        q1 -->|b| q2
        q2((q2)) -->|a| q1
        q2 -->|b| q2
      ```
    - [ ] ตรวจสอบว่า DFA นี้สามารถยอมรับสตริง "ab" ได้หรือไม่
      - เริ่มจากสถานะ q0
      - อ่าน a: ย้ายไปที่ q1
      - อ่าน b: ย้ายไปที่ q2
      - สตริง "ab" ถูกยอมรับเพราะสิ้นสุดที่สถานะ accept state (q2)
      - ดังนั้น DFA นี้สามารถยอมรับสตริง "ab" ได้
      - δ*(q0, "ab")
      - δ(δ*(q0, "a"), b) = δ(q1, b) = q2
      - δ(δ*(q0, ""), a) = δ(q0, a) = q1
      - ดังนั้น DFA นี้สามารถยอมรับสตริง "ab" ได้
  - [ ] สร้าง DFA Diagram สำหรับสตริงที่มีรูปแบบ "aa" หรือ "bb"
    - [ ] Q: set of states -> {q0, q1, q2}
    - [ ] Σ: input alphabet -> {a, b}
    - [ ] δ: transition function
      - δ(q0, a) = q1
      - δ(q0, b) = q2
      - δ(q1, a) = q1
      - δ(q1, b) = q2
      - δ(q2, a) = q1
      - δ(q2, b) = q2
    - [ ] q0: initial state
    - [ ] F: set of accept states {q1, q2}
    - ```mermaid
      graph LR
        q0((q0)) -->|a| q1
        q0 -->|b| q2
        q1(((q1))) -->|a| q1
        q1 -->|b| q2
        q2((q2)) -->|a| q1
        q2 -->|b| q2
      ```
    - [ ] ตรวจสอบว่า DFA นี้สามารถยอมรับสตริง "aa" ได้หรือไม่
      - เริ่มจากสถานะ q0
      - อ่าน a: ย้ายไปที่ q1
      - อ่าน a: ยังคงอยู่ที่ q1
      - สตริง "aa" ถูกยอมรับเพราะสิ้นสุดที่สถานะ accept state (q1)
      - ดังนั้น DFA นี้สามารถยอมรับสตริง "aa" ได้
      - δ*(q0, "aa")
      - δ(δ*(q0, "a"), a) = δ(q1, a) = q1
      - δ(δ*(q0, ""), a) = δ(q0, a) = q1
      - ดังนั้น DFA นี้สามารถยอมรับสตริง "aa" ได้
  
- [ ] สรุป
  - [ ] เราสามารถสร้าง DFA Diagram ได้จากข้อมูลที่เรามี
  - [ ] เราสามารถตรวจสอบว่า DFA นี้สามารถยอมรับสตริงใดบ้างได้
  - [ ] เราสามารถเขียนโปรแกรมที่สามารถจำลองการทำงานของ DFA ได้
  - [ ] เราสามารถใช้ Diagram นี้ในการวิเคราะห์การทำงานของ DFA ได้
  - [ ] เราสามารถใช้ Diagram นี้ในการแปลง DFA เป็นรูปแบบอื่นๆ ได้
  
- [ ] คำถาม
  - [ ] เราสามารถสร้าง DFA Diagram ได้จากข้อมูลที่เรามีหรือไม่?
  - [ ] เราสามารถตรวจสอบว่า DFA นี้สามารถยอมรับสตริงใดบ้างได้หรือไม่?
  - [ ] เราสามารถเขียนโปรแกรมที่สามารถจำลองการทำงานของ DFA ได้หรือไม่?
  - [ ] เราสามารถใช้ Diagram นี้ในการวิเคราะห์การทำงานของ DFA ได้หรือไม่?
  - [ ] เราสามารถใช้ Diagram นี้ในการแปลง DFA เป็นรูปแบบอื่นๆ ได้หรือไม่?

- [ ] คำตอบ
  - [ ] เราสามารถสร้าง DFA Diagram ได้จากข้อมูลที่เรามี
  - [ ] เราสามารถตรวจสอบว่า DFA นี้สามารถยอมรับสตริงใดบ้างได้
  - [ ] เราสามารถเขียนโปรแกรมที่สามารถจำลองการทำงาน
  - [ ] เราสามารถใช้ Diagram นี้ในการวิเคราะห์การทำงานของ DFA ได้
  - [ ] เราสามารถใช้ Diagram นี้ในการแปลง DFA เป็นรูปแบบอื่นๆ ได้

- [ ] ต่อไปเราจะมาฝึก Design DFA กัน เพื่อนิยามภาษาปกติ
  - [ ] คุณลักษณะของ DFA ก่อนจะ Design DFA
    - [ ] DFA จะต้องมีสถานะเริ่มต้น (initial state) หนึ่งสถานะ
    - [ ] DFA จะต้องมีสถานะยอมรับ (accept state) หนึ่งหรือมากกว่าหนึ่งสถานะ
    - [ ] DFA จะต้องมีการเปลี่ยนแปลงสถานะ (transition) สำหรับทุกสัญลักษณ์ใน input alphabet
    - [ ] DFA จะต้องมีการเปลี่ยนแปลงสถานะที่ชัดเจนและไม่ซ้ำกันสำหรับทุกสัญลักษณ์ใน input alphabet
    - [ ] DFA จะต้องสามารถยอมรับหรือปฏิเสธสตริงได้อย่างชัดเจน
    - [ ] DFA จะต้องสามารถทำงานได้ในเวลา O(n) สำหรับสตริงที่มีความยาว n
    - [ ] DFA จะต้องสามารถทำงานได้ในพื้นที่ O(1) สำหรับสตริงที่มีความยาว n