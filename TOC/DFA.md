## สรุป DFA คือ 5-tuple ที่มีสมาชิก 5 ตัว คือ (Q,Σ,δ,q₀,F) 

- ซึ่ง Q คือ set ที่มีสมาชิกเป็น state หรือ สถานะ ซึ่งจำนวน state จะขึ้นอยู่กับโจทย์ ตัวอย่าง Q ={q0,q1,q2} มี state อยู่ 3 ตัว

- Σ เป็น set ของ symbol ที่ input ทดสอบว่ายอมรับได้ไหม Σ = {0,1}

- δ เป็น TF เป็นตัวกำหนดว่าถ้าเรารับ input string ตัวอะไรเข้ามา จะเปลี่ยนจาก state นึงไปยังอีก state นึงได้อย่างไร เช่น ถ้า q0 เป็น start state เสมอ ก็จะสามารถเขียนได้ว่า δ(q0,1) = q1 คือถ้าอยู่ที่ q0 รับ input เป็น 1 เข้ามาก็จะทำการย้าย state จาก q0 ไปยัง q1 เเต่ถ้ารับ 0 เข้ามาก็จะคงอยู่ที่ state q0 เหมือนเดิม

- q₀ เป็น start state ซึ่ง start state จะเป็นสมาชิกของ set Q เสมอไหมอันนี้ไหม่เเน่ใจ

- F เป็น set of state ที่สามารถยอมรับได้ จากตัวอย่าง state ที่ยอมได้ คือ q2 ดูเเล้วเป็น set เเสดงว่าอาจจะมี state ที่สามารถยอมได้มากกว่าหนึ่งหรือป่าวไม่เเน่ใจ ขึ้นอยู่กับโจทย์ เเละ state ที่ยอมรับได้ ก็ยังเป็น subset ของ Q อีกด้วย

## Q (set of state)
- Q = {q0, q1, q2} เป็น set of state ทั้งหมดที่มีใน DFA นี้ ซึ่งมีสมาชิก 3 ตัวคือ q0, q1, q2 ซึ่งจำนวน state จะขึ้นอยู่กับโจทย์ หรือจำนวน state ที่เราต้องการใช้ในการแก้ปัญหานั้นๆ

## Σ (Alphabet)
- Σ = {0, 1} เป็น set of input symbols ที่ DFA นี้รับได้ ซึ่งในที่นี้เป็น binary string ที่ประกอบด้วย 0 และ 1 เท่านั้น Σ มักจะกำหนดมาจากโจทย์หรือจากปัญหาที่ต้องการแก้ไข

## δ (Transition Function)
- δ: Q × Σ → Q เป็นฟังก์ชันที่แสดงถึงการเปลี่ยนแปลง state ของ DFA ตาม input symbol ที่รับเข้ามา ในที่นี้ δ จะเป็นฟังก์ชันที่รับค่า state และ input symbol เข้ามา แล้ว return state ใหม่ที่ DFA จะเปลี่ยนไป ซึ่งในที่นี้ δ จะถูกกำหนดไว้ดังนี้
  - δ(q0, 0) = q0
  - δ(q0, 1) = q1
  - δ(q1, 0) = q2
  - δ(q1, 1) = q0
  - δ(q2, 0) = q1
  - δ(q2, 1) = q2

## q₀ (start state) 
- ในที่นี้ q₀ จะเป็น state เริ่มต้นของ DFA ซึ่งในที่นี้ q₀ จะเป็น q0
- ดังนั้น เมื่อ DFA รับ input symbol เข้ามา จะเริ่มต้นที่ state q0 และเปลี่ยนแปลง state ตามฟังก์ชัน δ ที่กำหนดไว้

## F (Accepting States)
- ในที่นี้ ไม่ได้ระบุว่า state ใดเป็น accepting state ดังนั้นจากการดูจากฟังก์ชัน δ ที่กำหนดไว้ ไม่มี state ใดที่จะทำให้ DFA เข้าสู่สถานะที่ไม่สามารถเปลี่ยนแปลง state ได้อีก (dead state) และไม่มี state ใดที่เป็นสถานะที่ถูกต้องสำหรับ input string ที่ถูกต้อง (accepting state) ดังนั้นจากการดูจากฟังก์ชัน δ ที่กำหนดไว้ ไม่สามารถระบุว่า DFA นี้จะ accept หรือ reject input string ได้อย่างชัดเจน โดยเฉพาะอย่างยิ่งเมื่อไม่มี accepting state ที่ระบุไว้
- ข้อสังเกต
  - อาจมี state ยอมรับหลาย state ก็ได้ เช่น F = {q2, q3}
  - ถ้าไม่มี state ที่ยอมรับ ก็จะเป็น non-accepting state
  - ถ้าไม่มี transition function จาก state ที่อยู่ในปัจจุบัน ก็จะเป็น reject state
  - ถ้าไม่มี transition function จาก state ที่อยู่ในปัจจุบัน และ state นั้นเป็น state ที่ยอมรับ ก็จะเป็น reject state
  - ถ้าไม่มี transition function จาก state ที่อยู่ในปัจจุบัน และ state นั้นเป็น state ที่ไม่ยอมรับ ก็จะเป็น reject state
  - ถ้าไม่มี transition function จาก state ที่อยู่ในปัจจุบัน และ state นั้นเป็น state ที่ไม่ยอมรับ และ state นั้นเป็น state ที่เริ่มต้น ก็จะเป็น reject state
  - ถ้าไม่มี transition function จาก state ที่อยู่ในปัจจุบัน และ state นั้นเป็น state ที่ไม่ยอมรับ และ state นั้นเป็น state ที่เริ่มต้น และ state นั้นเป็น state ที่ยอมรับ ก็จะเป็น reject state
  - ถ้าไม่มี transition function จาก state ที่อยู่ในปัจจุบัน และ state นั้นเป็น state ที่ไม่ยอมรับ และ state นั้นเป็น state ที่เริ่มต้น และ state นั้นเป็น state ที่ยอมรับ และ state นั้นเป็น state ที่เริ่มต้น ก็จะเป็น reject state
  - ถ้าไม่มี transition function จาก state ที่อยู่ในปัจจุบัน และ state นั้นเป็น state ที่ไม่ยอมรับ และ state นั้นเป็น state ที่เริ่มต้น และ state นั้นเป็น state ที่ยอมรับ และ state นั้นเป็น state ที่เริ่มต้น และ state นั้นเป็น state ที่ไม่ยอมรับ ก็จะเป็น reject state
  - ถ้าไม่มี transition function จาก state ที่อยู่ในปัจจุบัน และ state นั้นเป็น state ที่ไม่ยอมรับ และ state นั้นเป็น state ที่เริ่มต้น และ state นั้นเป็น state ที่ยอมรับ และ state นั้นเป็น state ที่เริ่มต้น และ state นั้นเป็น state ที่ไม่ยอมรับ และ state นั้นเป็น state ที่ยอมรับ ก็จะเป็น reject state
  - ถ้า state ที่ DFA ไปจบไม่ใช่ F ถือว่า ไม่ยอมรับ และถ้า state ที่ DFA ไปจบใช่ F ถือว่า ยอมรับ


## หัวอื่นๆ ที่สนใจศึกษาเพิ่มเติมเร็วๆ นี้
- DFA กับ Regular Expression เกี่ยวข้องกันอย่างไร?
    - DFA ใช้ตรวจสอบว่า string เป็นไปตาม pattern หรือไม่
    - Regular Expression เป็นตัวกำหนด pattern ที่ DFA สามารถสร้างขึ้นได้
    ### คำถามที่เกี่ยวข้อง:
    - เราสามารถเปลี่ยนจาก Regular Expression เป็น DFA ได้อย่างไร?
    - DFA และ Regular Expression มีข้อจำกัดเหมือนหรือแตกต่างกันอย่างไร?
  
## DFA กับ NFA ต่างกันอย่างไร?
- NFA (Nondeterministic Finite Automaton) ดูเหมือนคล้ายกับ DFA แต่มีความยืดหยุ่นมากกว่า เช่น:
    - สามารถมีหลาย transition ได้ใน input เดียว
    - อาจไม่มี transition ใดเลยในบาง input
    ### คำถามที่เกี่ยวข้อง:
    - ทำไมเราต้องใช้ DFA แทน NFA ทั้ง ๆ ที่ NFA ดูจะง่ายกว่า?
    - เราแปลง NFA เป็น DFA ได้อย่างไร?

## DFA มีข้อจำกัดอะไรบ้าง?
- DFA ไม่สามารถจำข้อมูลแบบไม่จำกัด เช่น ภาษาแบบ a^n b^n (จำนวน a และ b ต้องเท่ากัน)
    ### คำถามที่เกี่ยวข้อง:
    - ภาษาใดที่ DFA ไม่สามารถรับรู้ได้?
    - เมื่อไรที่เราควรใช้เครื่องมืออื่นแทน DFA เช่น Pushdown Automata?

## DFA ในการนำไปใช้งานจริง
- DFA เป็นแนวคิดที่สำคัญในวิทยาการคอมพิวเตอร์และถูกนำไปใช้ในหลายด้าน เช่น:
    - การตรวจจับ pattern ใน text
    - การวิเคราะห์ lexical ใน compiler
    - การออกแบบระบบ logic สำหรับ hardware
    ### คำถามที่เกี่ยวข้อง:
    - มีตัวอย่างการใช้งาน DFA ในโปรแกรมจริง ๆ ไหม?
    - การทำงานของ DFA ใน Compiler หรือ Search Engine เป็นอย่างไร?
  
## การออกแบบ DFA ที่ซับซ้อน
- การออกแบบ DFA สำหรับ pattern ที่ซับซ้อน เช่น การรับ string ที่:
    - ยาวเกิน 10 ตัวอักษร
    - มีจำนวน 1 มากกว่าจำนวน 0
    ### คำถามที่เกี่ยวข้อง:
    - มีวิธีการออกแบบ DFA ให้มีประสิทธิภาพสูงสุดไหม?
    - เราควรใช้ state จำนวนเท่าไรถึงจะเหมาะสม?
  
## การวิเคราะห์ DFA
- วิเคราะห์ DFA ด้วยหลักการทางคณิตศาสตร์ เช่น:
    - ตรวจสอบว่าภาษาเป็น Regular Language
    - ลดจำนวน state โดยการ Minimize DFA
    ### คำถามที่เกี่ยวข้อง:
    - เราลดจำนวน state ใน DFA ได้อย่างไร?
    - วิธีพิสูจน์ว่า DFA ของเราถูกต้องทำอย่างไร?
  
## หนังสือเรียนรู้ DFA:
1. Introduction to the Theory of Computation โดย Michael Sipser
    - อธิบายพื้นฐานของ Automata, DFA, NFA, และ Regular Languages
2. Automata, Computability and Complexity: Theory and Applications โดย Elaine Rich
    - รวมตัวอย่างการออกแบบ DFA และการพิสูจน์เกี่ยวกับ Automata