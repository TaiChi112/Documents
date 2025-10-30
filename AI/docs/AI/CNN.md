# 🧠 Convolutional Neural Network (CNN)
> แปลและขยายจากสไลด์ “AI-CNN Machine Vision — COS3109”

---

## 🎯 หัวข้อ (Agenda)
- Convolutional Neural Network (CNN)  
- Top Applications of Machine Vision  
- แนวคิดพื้นฐานของ CNN  
- ตัวอย่างง่าย (Simple Example)  
- Workshop: TensorFlow (Keras) บน Google Colab  

---

## 🚀 การประยุกต์ใช้ Machine Vision (Top 7 Applications)

| หมวด | รายละเอียด | แหล่งอ้างอิง |
|:--|:--|:--|
| **Guidance** | ใช้ระบุตำแหน่งและการวางชิ้นส่วนอย่างถูกต้อง (Positioning, Locating, Ensuring placement) | [robots.net](https://robots.net/tech-reviews/deep-learning-applications/) |
| **Identification** | การอ่านบาร์โค้ด, การตรวจสอบบรรจุภัณฑ์ (Barcode, Matrix code, Packaging QC) | [robots.net](https://robots.net/tech-reviews/deep-learning-applications/) |
| **Gauging** | ตรวจจับข้อผิดพลาดในการผลิต (Production errors) | [robots.net](https://robots.net/tech-reviews/deep-learning-applications/) |
| **Inspection** | ตรวจจับตำหนิหรือข้อบกพร่องของสินค้า (Flaw Detection) — มีความแม่นยำสูงกว่ามนุษย์ | [robots.net](https://robots.net/tech-reviews/deep-learning-applications/) |
| **Object Detection** | ตรวจสอบว่าวัตถุปรากฏหรือไม่ปรากฏในภาพ | [robots.net](https://robots.net/tech-reviews/deep-learning-applications/) |
| **Print Defect Detection** | ตรวจสอบคุณภาพการพิมพ์ ฉลาก และบรรจุภัณฑ์ | [robots.net](https://robots.net/tech-reviews/deep-learning-applications/) |
| **Classification** | ทำนายว่าวัตถุอยู่ในประเภทใด (เช่น แมว/หมา/รถยนต์) | [robots.net](https://robots.net/tech-reviews/deep-learning-applications/) |

---

## 🔍 การทำงานของ Filters ใน Image Processing

**Filter (หรือ Kernel):**  
คือเมทริกซ์ขนาด \( n \times n \) ที่ใช้คำนวณค่าพิกเซลใหม่ โดยพิจารณาพิกเซลรอบข้าง

### ประเภทของ Filters
| ประเภท | ตัวอย่าง | การทำงาน |
|:--|:--|:--|
| **Linear Filters** | Box, Gaussian, Laplace | ใช้การ Convolution เพื่อลด noise หรือปรับความชัด |
| **Non-linear Filters** | Min, Max, Median | ใช้ฟังก์ชันไม่เชิงเส้น เช่น ค่ากลาง (median) เพื่อกำจัด noise |

**สมการ Convolution (พื้นฐาน):**
\[
S(i,j) = (K * I)(i,j) = \sum_m \sum_n I(i+m, j+n) \, K(m,n)
\]

> โดย \(I\) = ภาพต้นฉบับ, \(K\) = kernel, \(S\) = ภาพผลลัพธ์

---

## ⚠️ ข้อจำกัดของ ANN เมื่อใช้กับภาพ

1. ต้องใช้การคำนวณมากเกินไป  
2. มองทุกพิกเซลเหมือนกัน (ไม่รู้ตำแหน่งของวัตถุ)  
3. ไม่สามารถรับรู้ลักษณะเฉพาะในพื้นที่เล็ก ๆ ได้ดี  

👉 จึงต้องใช้ **Convolutional Neural Network (CNN)** แทน ANN

---

## 👁️ ทำไม CNN ถึงเข้าใจภาพได้ดีกว่า?

มนุษย์รู้จำภาพได้ง่ายเพราะ “สมองมีการเชื่อมโยงแบบลำดับชั้น”  
CNN จำลองแนวคิดนี้ โดยเรียนรู้จาก “ส่วนเล็ก ๆ ของภาพ” (local features)  
→ แล้วค่อย ๆ รวมเป็นภาพรวม (global features)

**ตัวอย่าง:**  
- ชั้นแรกเรียนรู้ “เส้นขอบ”  
- ชั้นต่อมาเรียนรู้ “รูปทรง”  
- ชั้นลึก ๆ เรียนรู้ “วัตถุทั้งหมด”  

---

## 🧬 โครงสร้างของ CNN

CNN เป็น **โมเดล Deep Learning** ที่ออกแบบมาเพื่อ “เข้าใจภาพ”  
ผู้บุกเบิกแนวคิดคือ **Yann LeCun** (Facebook, MNIST project)

---

### 🧩 ส่วนประกอบของ CNN

1. **Input Layer**  
   - รับข้อมูลภาพขนาด \( n \times m \times 3 \) (RGB)  
   - เช่น 32×32×3 สำหรับภาพสี  

2. **Convolution Layer**  
   - ใช้ kernel เพื่อสกัด feature  
   - จำนวน filter มาก → ตรวจจับ edge/shape ได้มาก  
   - ผลลัพธ์เรียกว่า **Feature Map**

3. **Non-linearity Layer (Activation)**  
   - ใช้ฟังก์ชันเช่น **ReLU, Sigmoid, Tanh**  
   - ช่วยเพิ่มความไม่เชิงเส้นให้กับโมเดล  

4. **Pooling Layer**  
   - ลดขนาดภาพ (เช่น Max/Average Pooling)  
   - รักษาคุณลักษณะสำคัญและลดการคำนวณ  

5. **Fully Connected Layer**  
   - แปลง Feature Map ให้เป็นเวกเตอร์  
   - ใช้สำหรับการทำนาย (classification)  

6. **Normalization / Output Layer**  
   - ใช้ **Softmax function** เพื่อแปลงค่าให้อยู่ในช่วง [0,1]  
   - แสดงความน่าจะเป็นของแต่ละคลาส  

---

### ⚙️ การเรียนรู้ของ CNN (Backpropagation)

1. **Forward Pass:**  
   คำนวณค่าจาก input → convolution → pooling → fully connected → output  

2. **Loss Calculation:**  
   คำนวณข้อผิดพลาดระหว่างผลลัพธ์กับค่าจริง  

3. **Backward Pass (Backpropagation):**  
   คำนวณ gradient ของพารามิเตอร์แต่ละ layer  
   โดยใช้ **Chain Rule**

4. **Parameter Update:**  
   ปรับน้ำหนัก (w, b) ด้วยอัลกอริทึม Optimization เช่น **SGD / Adam**

---

## 🧠 Mermaid Diagram — สถาปัตยกรรมของ CNN

```mermaid
graph TD
  A[Input Image] --> B[Convolution Layer]
  B --> C[ReLU Activation]
  C --> D[Pooling Layer]
  D --> E[Flatten]
  E --> F[Fully Connected Layer]
  F --> G[Softmax Output]
