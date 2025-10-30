# ⚙️ Gradient Descent  
> แปลและขยายจากสไลด์ “Gradient Descent — Artificial Intelligence (AI), COS3109”

---

## 🎯 หัวข้อ (Agenda)
- Linear Regression  
- Least Square Estimation  
- Gradient Descent  
- Workshop  

---

## 📈 Linear Regression (การถดถอยเชิงเส้น)

**แนวคิดหลัก:**  
การหาความสัมพันธ์ระหว่างตัวแปรอิสระ (Independent variable) กับตัวแปรตาม (Dependent variable)  

**ตัวอย่างการใช้งาน:**  
- ธุรกิจ (Business analytics)  
- การตลาดที่ขับเคลื่อนด้วยข้อมูล (Data-driven marketing)  
- ชีววิทยา (Biology)  
- โครงงาน Machine Learning  

---

### 🧩 ตัวอย่างสถานการณ์

ศึกษาความสัมพันธ์ระหว่าง  
> ยอดขายอีคอมเมิร์ซรายเดือน (Y)  
> กับ ค่าใช้จ่ายด้านการโฆษณาออนไลน์ (X)

จากข้อมูลของร้านค้าออนไลน์ 7 แห่งตลอดปีที่ผ่านมา  
> **เป้าหมาย:** หา “สมการเส้นตรง” ที่เหมาะสมที่สุดกับข้อมูล (best fit line)

---

## 📘 สมการถดถอยเชิงเส้นอย่างง่าย (Simple Linear Regression)

มีตัวแปรเพียง 1 ตัว:
- \( X \): ตัวแปรอิสระ (Independent / Predictor variable)  
- \( Y \): ตัวแปรตาม (Dependent / Outcome variable)

สมการเชิงเส้นพื้นฐานคือ:
\[
Y = mX + b
\]

โดยที่  
- \( m \) = ความชันของเส้น (Slope)  
- \( b \) = จุดตัดแกน Y (Intercept)

---

## 🧮 Least Square Estimation (การประมาณด้วยผลรวมกำลังสองน้อยที่สุด)

**แนวคิด:**  
หาค่า \( m \) และ \( b \) ที่ทำให้ผลรวมของความคลาดเคลื่อนระหว่างค่าจริงกับค่าทำนาย “มีค่าน้อยที่สุด”

**Loss Function (ฟังก์ชันสูญเสีย):**
\[
L = \sum_{i=1}^{n} (y_i - (m x_i + b))^2
\]

> เป้าหมายของการเรียนรู้:  
> ทำให้ \( L \) มีค่าน้อยที่สุด (minimize loss)

---

## ⚙️ Gradient Descent (การไล่ระดับความชัน)

ในสถิติ, Machine Learning, และ Data Science —  
**Optimization (การหาค่าที่เหมาะสมที่สุด)** เป็นหัวใจสำคัญของหลายอัลกอริทึม

Gradient Descent คือกระบวนการ **ปรับค่าพารามิเตอร์อย่างต่อเนื่อง**  
เพื่อให้ Loss Function ลดลงจนถึงจุดต่ำสุด (minimum)

---

### 🔹 สูตรการอัปเดตพารามิเตอร์

\[
\theta := \theta - \alpha \frac{\partial L}{\partial \theta}
\]

โดยที่  
- \( \theta \): พารามิเตอร์ (เช่น m หรือ b)  
- \( \alpha \): ค่าการเรียนรู้ (Learning rate)  
- \( \frac{\partial L}{\partial \theta} \): อนุพันธ์ของ Loss Function ต่อ \(\theta\)

---

### 🔹 ในกรณี Linear Regression:
\[
m := m - \alpha \frac{\partial L}{\partial m}
\quad,\quad
b := b - \alpha \frac{\partial L}{\partial b}
\]

โดยที่
\[
\frac{\partial L}{\partial m} = -\frac{2}{n} \sum_{i=1}^{n} x_i (y_i - (m x_i + b))
\]
\[
\frac{\partial L}{\partial b} = -\frac{2}{n} \sum_{i=1}^{n} (y_i - (m x_i + b))
\]

> 🔁 ทำซ้ำหลายรอบ (iterations)  
> ทุกครั้งจะได้ค่า \(m, b\) ที่เข้าใกล้ค่าที่เหมาะสมที่สุดเรื่อย ๆ

---

### ⚖️ ประเภทของ Gradient Descent

| ประเภท | คำอธิบาย | ลักษณะเด่น |
|:--|:--|:--|
| **Batch Gradient Descent** | ใช้ข้อมูลทั้งหมดในการอัปเดตแต่ละครั้ง | เสถียรแต่ช้า |
| **Stochastic Gradient Descent (SGD)** | ใช้ข้อมูลเพียง 1 ตัวอย่างต่อรอบ | เร็วขึ้นแต่มี noise |
| **Mini-batch Gradient Descent** | ใช้กลุ่มข้อมูลย่อย | สมดุลระหว่างความเร็วและความแม่นยำ |

---

## 🧪 Workshop: Gradient Descent

**โจทย์:**
> ใช้ Least Square Estimation และ Gradient Descent  
> เพื่อหาค่า *slope (m)* และ *intercept (b)* จากข้อมูลที่ให้

**เงื่อนไข:**
1. ใช้ **Learning rate = 0.01**  
2. เริ่มต้นจากค่า slope ที่ได้จาก Least Square Estimation  
3. กำหนดค่าเริ่มต้น intercept = 15  
4. ทำซ้ำ (iteration) = 10 รอบ  
5. วาดกราฟเส้นตรงจาก slope และ intercept ที่ได้

---

### 🧭 การตีความผลลัพธ์

- เมื่อ Loss ลดลงเรื่อย ๆ → Gradient Descent ทำงานถูกต้อง  
- เมื่อ Loss แกว่งหรือไม่ลด → ต้องปรับค่า learning rate  
- เมื่อค่า Gradient = 0 → ถึงจุดต่ำสุดของ Loss (Local Minimum)

---

## 🧠 Mermaid Diagram — ภาพรวมการทำงานของ Gradient Descent

```mermaid
flowchart TD
  A[เริ่มต้น: ค่าเริ่มต้นของ m, b] --> B[คำนวณ Loss Function]
  B --> C[หาค่า Gradient ของ m และ b]
  C --> D[อัปเดตค่า m,b ด้วย Learning rate]
  D --> E{Loss ลดลงหรือไม่?}
  E -- ใช่ --> F[ตรวจสอบผลลัพธ์สุดท้าย (Converged)]
  E -- ไม่ --> B
```