# 🧠 Naïve Bayes Classifier
> แปลและขยายความจากสไลด์ "AI - Naïve Bayes Classifier"

---

## 📅 Week 7 — Artificial Intelligence (AI)
**รายวิชา:** COS3109  
**หัวข้อประจำสัปดาห์:**  
- ทบทวนทฤษฎีของ Bayes (Bayes’ Theorem)  
- ตัวจำแนก Naïve Bayes Classifier  
- Workshop: Email Spam Classifier  
- แนวคิดพื้นฐานของความน่าจะเป็น (Probability)

---

## 🎯 ความน่าจะเป็น (Probability)

เราได้เห็นสองวิธีในการคำนวณการแจกแจงความน่าจะเป็น (probability distribution):

1. **Count and Divide** — นับจำนวนเหตุการณ์ แล้วหารด้วยจำนวนเหตุการณ์ทั้งหมด  
2. **Conditional Distribution** — ความน่าจะเป็นแบบมีเงื่อนไข (conditional probability)

> ทั้งสองวิธีนี้ใช้หลัก “หารด้วยผลรวมของตัวเศษที่เป็นไปได้” เพื่อให้ผลรวมทั้งหมดเท่ากับ 1  
> เช่นเดียวกับหลักของการแจกแจงความน่าจะเป็นในเชิงสถิติ

---

## 📘 Bayes’ Rule (ทฤษฎีของเบย์)

### 🔹 กฎของเบย์ (Bayes’ Theorem)

\[
P(A|B) = \frac{P(B|A) \times P(A)}{P(B)}
\]

**อธิบายความหมายของแต่ละพจน์:**
- \( P(A|B) \): ความน่าจะเป็นของเหตุการณ์ A เมื่อเกิด B แล้ว  
- \( P(B|A) \): ความน่าจะเป็นของเหตุการณ์ B เมื่อเกิด A แล้ว  
- \( P(A) \): ความน่าจะเป็นล่วงหน้าของ A (prior probability)  
- \( P(B) \): ความน่าจะเป็นรวมของ B (marginal probability)

> 📌 Bayes’ Rule คือสูตรหลักที่ใช้ “อัปเดตความเชื่อ” (belief update) เมื่อมีหลักฐานใหม่  
> เป็นหนึ่งในสูตรสำคัญที่สุดใน AI และ Machine Learning

---

## 🧮 การประมาณการแจกแจงของความน่าจะเป็น (Estimating Distributions)

### มีสองแนวทางหลัก:

| แนวทาง | ลักษณะการคิด | วิธีการ |
|:--|:--|:--|
| **Frequentist Approach** | มองว่าความน่าจะเป็นคือ “ความถี่ของการเกิด” | สังเกตข้อมูลจำนวนมาก แล้วคำนวณว่าเกิดบ่อยแค่ไหน (count and divide) |
| **Bayesian Approach** | มองว่าความน่าจะเป็นคือ “ระดับของความเชื่อ” | เริ่มจากความคาดหวังล่วงหน้า (prior) แล้วอัปเดตตามผลลัพธ์ใหม่ (posterior) |

---

## 🤖 Naïve Bayes Classifier

### 🔹 นิยาม
ตัวจำแนก (classifier) ที่ใช้ **ทฤษฎีของ Bayes** ร่วมกับ “สมมติฐานว่า features เป็นอิสระต่อกัน”  
(เรียกว่า **Naïve assumption**)

### 🔹 สูตรทั่วไป

\[
P(C|X_1, X_2, ..., X_n) = \frac{P(C) \times \prod_{i=1}^{n} P(X_i|C)}{P(X_1, X_2, ..., X_n)}
\]

โดยที่:
- \(C\) = คลาส (class) เช่น “Spam” หรือ “Ham”  
- \(X_i\) = feature ที่ i ของข้อมูล เช่น คำในอีเมล, จำนวนลิงก์, ชื่อผู้ส่ง  
- \(P(C)\) = ความน่าจะเป็นล่วงหน้าของคลาส  
- \(P(X_i|C)\) = ความน่าจะเป็นของ feature ภายใต้คลาสนั้น  

> ✅ เนื่องจากสมมติให้ features เป็นอิสระต่อกัน จึงสามารถคูณ \( P(X_i|C) \) แต่ละตัวได้โดยตรง  
> ทำให้คำนวณได้ง่ายและรวดเร็วมาก

---

## ✉️ ตัวอย่างการใช้งาน — Spam Classifier

**ปัญหา:**  
เราต้องการจำแนกว่าอีเมลฉบับหนึ่งเป็น “Spam” หรือ “Ham” (ไม่ Spam)

**ข้อมูลตัวอย่าง (Features):**
| Feature | ตัวอย่างค่า | ความหมาย |
|:--|:--|:--|
| คำในเนื้อหา | “Win”, “Free”, “Discount” | คำที่มักอยู่ใน Spam |
| จำนวนลิงก์ | มากกว่า 5 ลิงก์ | ลิงก์จำนวนมากมักบ่งชี้ Spam |
| ผู้ส่ง (Sender) | ไม่อยู่ในรายชื่อผู้ติดต่อ | ความน่าจะเป็นของ Spam สูงขึ้น |
| Subject | มีเครื่องหมาย “!” | พบได้บ่อยใน Spam |

### สูตรการตัดสินใจ:
\[
\text{เลือกคลาสที่มีค่า } P(C|X_1, X_2, ..., X_n) \text{ สูงสุด}
\]

เช่น:
\[
P(\text{Spam}|X) > P(\text{Ham}|X) \Rightarrow \text{Spam}
\]

---

## 🧩 Laplace Smoothing

เพื่อป้องกันไม่ให้ความน่าจะเป็นเป็นศูนย์เมื่อบาง feature ไม่เคยปรากฏ  
ใช้เทคนิค **Laplace Smoothing**:

\[
P(x_i|C) = \frac{\text{count}(x_i, C) + \alpha}{\text{count}(C) + \alpha n}
\]

โดยที่:
- \( \alpha \) = ค่าคงที่ขนาดเล็ก (เช่น 1)  
- \( n \) = จำนวน feature ทั้งหมด  

---

## 🧭 Workshop — Email Classifier

1. เตรียมชุดข้อมูลอีเมลพร้อม label (Spam/Ham)  
2. แยกข้อมูลเป็น train/test  
3. คำนวณค่า \( P(word|Spam) \) และ \( P(word|Ham) \)  
4. ทำนายอีเมลใหม่ด้วยสูตร Naïve Bayes  
5. ประเมินผลด้วย accuracy, precision, recall

---

## 🧠 Mermaid Mindmap

```mermaid
mindmap
  root((Naïve Bayes Classifier))
    Bayes' Rule
      Prior Probability
      Likelihood
      Posterior
    Independence Assumption
    Applications
      Spam Detection
      Sentiment Analysis
      Document Categorization
    Implementation Steps
      Data Preparation
      Probability Calculation
      Prediction
      Evaluation
