# 🧠 Artificial Neural Network (ANN)
> แปลและขยายจากสไลด์ “Artificial Neural Network — Artificial Intelligence (COS3109)”

---

## 🎯 หัวข้อ (Agenda)
- Artificial Neural Network (ANN)  
- Top 3 Applications of ANN  
- แนวคิดพื้นฐาน (Concepts)  
- ตัวอย่างง่าย ๆ (Simple Example)  
- Workshop: ใช้งาน TensorFlow (Keras) บน Google Colab  

---

## 🚀 ตัวอย่างการประยุกต์ใช้ ANN (Top 3 Applications)

| หมวด | ตัวอย่าง | แหล่งอ้างอิง |
|:--|:--|:--|
| **Machine Translation** | Google Translate — ใช้ ANN เพื่อแปลภาษาระหว่างภาษาต่าง ๆ โดยเรียนรู้จากคู่คำจำนวนมหาศาล | [robots.net](https://robots.net/tech-reviews/deep-learning-applications/) |
| **Image Captioning** | ระบบบรรยายภาพอัตโนมัติ เช่น “A cat sitting on the chair.” | [Simplilearn](https://www.simplilearn.com/tutorials/deep-learning-tutorial/deep-learning-applications) |
| **Self-Driving Cars** | รถยนต์ไร้คนขับที่ใช้ Neural Network วิเคราะห์ภาพและตัดสินใจการเคลื่อนที่ | [robots.net](https://robots.net/tech-reviews/deep-learning-applications/) |

---

## 💡 ทำไมต้องใช้ Artificial Neural Network (Why ANN?)

> “แล้วคอมพิวเตอร์รู้ได้อย่างไรว่าอันไหนคือ ‘นก’ ?”

### 🐦 แนวคิดแบบดั้งเดิม (Traditional Programming)
เขียนโปรแกรมกำหนดคุณลักษณะ (Feature) เอง เช่น  
```text
if มีปีก:
    if มีจะงอยปาก:
        if มีสีสัน:
            -> เป็นนก
        else:
            -> ไม่เป็นนก
