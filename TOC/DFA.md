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



