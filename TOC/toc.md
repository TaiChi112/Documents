นี่คือแผนการเรียน Theory of Computing (TOC) ใน 30 วัน ที่ครอบคลุม พื้นฐาน → ระดับกลาง → ระดับสูง พร้อมแบบฝึกหัดและแหล่งข้อมูลเสริม

## 🔥 แผน 30 วัน: Theory of Computing (TOC)
- 📌 วัตถุประสงค์

- เข้าใจ พื้นฐาน TOC เช่น DFA, NFA, Regular Expressions
- ศึกษา ภาษาและไวยากรณ์ เช่น Context-Free Grammar (CFG), Pushdown Automata (PDA)
- เรียนรู้ Turing Machines, Decidability, Complexity Theory
ฝึกทำ โจทย์และพิสูจน์สมมติฐาน

📅 Week 1: พื้นฐาน TOC และออโตมาต้า

- ✅ Day 1: แนะนำ TOC และ Regular Languages
- 📖 เนื้อหา
  - ทำความเข้าใจว่า TOC คืออะไร และทำไมต้องเรียน
  - คำศัพท์สำคัญ: Alphabet, String, Language, Formal Grammar
  - Regular Language คืออะไร

- 📌 แบบฝึกหัด
  - พิสูจน์ว่าภาษาใดเป็น Regular Language หรือไม่

- 📚 แหล่งเรียนรู้
  - 📖 Introduction to the Theory of Computation – Michael Sipser
  - 📺 YouTube: Regular Languages
  - ✅ Day 2-3: Finite Automata (DFA & NFA)

- 📖 เนื้อหา
  - DFA: การทำงาน, วิธีออกแบบ
  - NFA: ความแตกต่างจาก DFA, การแปลง NFA → DFA

- 📌 แบบฝึกหัด
  - สร้าง DFA และ NFA สำหรับภาษา เช่น "มี 'a' และลงท้ายด้วย 'b'"

- 📚 แหล่งเรียนรู้
  - 📺 YouTube: DFA and NFA
  - ✅ Day 4: Regular Expressions (RE)

- 📖 เนื้อหา
  - Regular Expressions กับ Regular Language
  - วิธีแปลงระหว่าง DFA ↔ RE

- 📌 แบบฝึกหัด
  - แปลง RE เป็น DFA และ DFA เป็น RE

- 📚 แหล่งเรียนรู้
  - 📖 Introduction to Automata Theory – Hopcroft & Ullman
  - ✅ Day 5-6: Pumping Lemma & Non-Regular Language

- 📖 เนื้อหา
  - Pumping Lemma คืออะไร และใช้พิสูจน์ว่าอะไรไม่ใช่ Regular Language

- 📌 แบบฝึกหัด
  - ใช้ Pumping Lemma พิสูจน์ว่า 
𝐿
=
{
𝑎
𝑛
𝑏
𝑛
∣
𝑛
≥
0
}
L={a 
n
 b 
n
 ∣n≥0} ไม่เป็น Regular Language

- 📚 แหล่งเรียนรู้
  - 📺 YouTube: Pumping Lemma Explanation
  - ✅ Day 7: สรุปสัปดาห์แรก + ทำโจทย์

- 📌 แบบฝึกหัด
  - ฝึกออกแบบ DFA/NFA
  - พิสูจน์ Regular/Non-Regular Language

📅 Week 2: Context-Free Grammar (CFG) & Pushdown Automata (PDA)
- ✅ Day 8-9: Context-Free Grammar (CFG)
- 📖 เนื้อหา
  - ไวยากรณ์แบบ Context-Free
  - กฎการเขียนและการพิสูจน์ภาษา

- 📌 แบบฝึกหัด
  - เขียน CFG สำหรับภาษา เช่น "Palindrome", "a^n b^n"

- 📚 แหล่งเรียนรู้
  - 📖 Introduction to the Theory of Computation
  - ✅ Day 10-11: Pushdown Automata (PDA)

- 📖 เนื้อหา
  - Pushdown Automata (PDA) คืออะไร และใช้ยังไง
  - แปลงระหว่าง PDA ↔ CFG

- 📌 แบบฝึกหัด
  - ออกแบบ PDA สำหรับ 
𝐿
=
{
𝑎
𝑛
𝑏
𝑛
∣
𝑛
≥
0
}
L={a 
n
 b 
n
 ∣n≥0}

- 📚 แหล่งเรียนรู้
  - 📺 YouTube: PDA Explanation
  - ✅ Day 12-13: Pumping Lemma for CFG

- 📖 เนื้อหา
  - ใช้ Pumping Lemma พิสูจน์ว่าภาษาใดไม่เป็น Context-Free

- 📌 แบบฝึกหัด
  - พิสูจน์ว่า 
𝐿
=
{
𝑎
𝑛
𝑏
𝑛
𝑐
𝑛
∣
𝑛
≥
0
}
L={a 
n
 b 
n
 c 
n
 ∣n≥0} ไม่ใช่ Context-Free

- ✅ Day 14: สรุป + ฝึกทำโจทย์

📅 Week 3: Turing Machine & Computability
- ✅ Day 15-16: Turing Machines (TM)

- 📖 เนื้อหา
  - เข้าใจพื้นฐานของ TM
  - ออกแบบ TM สำหรับภาษา เช่น 
𝐿
=
{
𝑎
𝑛
𝑏
𝑛
𝑐
𝑛
}
L={a 
n
 b 
n
 c 
n
 }

- 📌 แบบฝึกหัด
  - สร้าง TM สำหรับภาษาเช่น "Palindrome"

- 📚 แหล่งเรียนรู้
  - 📺 YouTube: Turing Machines
  - ✅ Day 17-18: Decidability & Undecidability

- 📖 เนื้อหา
  - ปัญหาที่สามารถแก้ไขได้และแก้ไขไม่ได้ (Halting Problem)

- 📌 แบบฝึกหัด
  - วิเคราะห์ว่าปัญหานี้เป็น Decidable หรือ Undecidable

- 📚 แหล่งเรียนรู้
  - 📖 Computability and Complexity Theory

- ✅ Day 19-20: Reduction & Complexity Theory

- 📖 เนื้อหา
  - การลดปัญหา และการพิสูจน์ NP-Completeness

- 📌 แบบฝึกหัด
  - พิสูจน์ว่าปัญหาหนึ่งสามารถลดได้จากปัญหาอื่น

📅 Week 4: Complexity Classes & Advanced Topics
- ✅ Day 21-22: P, NP, NP-Complete

- 📖 เนื้อหา
  - ความซับซ้อนของปัญหา: P vs NP
  - NP-Complete Problems

- 📌 แบบฝึกหัด
  - วิเคราะห์ว่าปัญหาต่างๆ อยู่ในคลาสไหน

- ✅ Day 23-24: Space Complexity & PSPACE

- 📖 เนื้อหา
  - วิเคราะห์ว่าใช้ Memory เท่าไหร่

- ✅ Day 25-26: Randomized Algorithms & Quantum Computing
- 📖 เนื้อหา
  - อัลกอริธึมแบบสุ่ม เช่น BPP, ZPP
  - Quantum Computing เบื้องต้น

- ✅ Day 27-28: สรุป + โจทย์แข่งขัน

- 📌 แบบฝึกหัด
  - ทำข้อสอบจาก MIT OCW หรือ Codeforces (Div2 1800+)

- 📚 แหล่งเรียนรู้
  - 📖 Introduction to the Theory of Computation
  - 📺 MIT OCW: TOC Lectures

- ✅ Day 29-30: สร้างโปรเจกต์ + ทดสอบความรู้

- 📌 แบบฝึกหัด
  - สร้าง Compiler ขนาดเล็ก
  - ทบทวนทุกอย่างด้วย Flashcards

- 🔥แรงบันดาลใจ:
"ยิ่งเข้าใจคณิตศาสตร์และตรรกะดีเท่าไหร่ ยิ่งพัฒนาอัลกอริธึมได้ทรงพลังขึ้นเท่านั้น!" 🚀