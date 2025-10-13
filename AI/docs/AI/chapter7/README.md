# 📧 Naive Bayes Spam Classification Project

## 🎯 Overview
โปรเจ็กต์นี้เป็นการศึกษาและประยุกต์ใช้ **Naive Bayes Algorithm** สำหรับการจำแนกข้อความ Spam โดยมีการทดลองและวิเคราะห์ในหลายมุมมอง ครอบคลุมตั้งแต่การใช้งานกับข้อมูลจริง การทดลองเปลี่ยนพารามิเตอร์ และการคำนวณแบบ step-by-step

---

## 📁 Project Structure

```
chapter7/
├── Naive_Bayes_classification (1).ipynb    # หลัก: การใช้ SMS Dataset จริง
├── naive_bayes_assignment.ipynb           # การศึกษา: ตัวอย่างพื้นฐาน
├── message_probability_assignment.ipynb   # การฝึกฝน: คำนวณ specific message
├── smsspamcollection/                     # ข้อมูล SMS dataset
└── README.md                              # เอกสารนี้
```

---

## 📚 Files Description

### 1. 📊 `Naive_Bayes_classification (1).ipynb`
**การจำแนก Spam จากข้อมูล SMS จริง + การทดลองเปลี่ยนสัดส่วน Train/Test**

#### 🎯 **จุดประสงค์:**
- ใช้ข้อมูล SMS จริง (5,572 ข้อความ) จาก UCI ML Repository
- ทดลองเปลี่ยนสัดส่วนการแบ่งข้อมูล Train/Test (60%, 80%, 95%)
- วิเคราะห์ผลกระทบต่อประสิทธิภาพของโมเดล

#### 🔍 **สิ่งที่ครอบคลุม:**
- **Data Preprocessing**: ทำความสะอาดข้อมูล, tokenization, lowercase conversion
- **Vocabulary Building**: สร้างพจนานุกรมคำจากข้อมูลฝึก
- **Model Training**: คำนวณ Prior และ Conditional Probabilities
- **Experimental Design**: ทดลอง 3 สัดส่วนการแบ่งข้อมูล
- **Performance Analysis**: เปรียบเทียบ Accuracy, Precision, Recall, F1-Score
- **Visualization**: กราฟแสดงผลการเปรียบเทียบ

#### 📈 **ผลการทดลอง:**
| Train % | Test Size | Vocabulary | Accuracy | Precision | Recall | F1-Score |
|---------|-----------|------------|----------|-----------|--------|----------|
| 60%     | 2,229     | 9,996      | 99.01%   | 0.9828    | 0.9468 | 0.9645   |
| 80%     | 1,114     | 11,860     | 98.92%   | 0.9653    | 0.9586 | 0.9619   |
| 95%     | 279       | 13,147     | 99.64%   | 1.0000    | 0.9688 | 0.9841   |

#### 🎯 **ข้อค้นพบ:**
- ข้อมูลฝึกมากขึ้น → Vocabulary ใหญ่ขึ้น → Coverage ดีขึ้น
- ชุดทดสอบเล็กเกินไป (95% train) ให้ผลดีแต่อาจไม่น่าเชื่อถือ
- 80% train ให้ความสมดุลที่ดีระหว่างความแม่นยำและความน่าเชื่อถือ

---

### 2. 🎓 `naive_bayes_assignment.ipynb`
**การเรียนรู้พื้นฐาน Naive Bayes ด้วยข้อมูลตัวอย่างง่าย ๆ**

#### 🎯 **จุดประสงค์:**
- สอนหลักการ Naive Bayes อย่างเป็นระบบ
- ใช้ข้อมูลตัวอย่างขนาดเล็กที่เข้าใจง่าย
- แสดงขั้นตอนการคำนวณอย่างละเอียด

#### 📊 **ข้อมูลที่ใช้:**
```
| คำ   | Spam | No Spam |
|------|------|---------|
| Buy  | 20   | 5       |
| Cheap| 15   | 10      |
| Work | 5    | 30      |
| Free | 20   | 7       |
| Will | 4    | 40      |
Total  | 25   | 75      |
```

#### 🔍 **สิ่งที่ครอบคลุม:**
- **Prior Probability**: P(Spam) = 1/4, P(No Spam) = 3/4
- **Conditional Probability**: P(word|class) สำหรับแต่ละคำ
- **Interactive Classifier**: ฟังก์ชันทำนายพร้อมอธิบายขั้นตอน
- **Word Analysis**: วิเคราะห์คำไหนมีแนวโน้ม spam/no spam
- **Multiple Word Testing**: ทดสอบ message หลายคำ
- **Laplace Smoothing**: จัดการคำที่ไม่เคยเห็น
- **Visualization**: กราฟแสดง probability distributions

#### 🧮 **ผลการวิเคราะห์:**
- **Spam Words**: Buy (85.2%), Free (80.4%), Cheap (68.3%)
- **No Spam Words**: Will (12.6%), Work (19.3%)

#### 📈 **Features:**
- Step-by-step calculation explanation
- Interactive probability calculator
- Comprehensive visualization
- Laplace smoothing demonstration

---

### 3. 🧮 `message_probability_assignment.ipynb`
**การคำนวณ Probability สำหรับ Message เฉพาะ: "Buy, Cheap, Work & Free"**

#### 🎯 **จุดประสงค์:**
- แสดงการคำนวณแบบ manual step-by-step
- ตอบโจทย์เฉพาะสำหรับ message ที่กำหนด
- เน้นการเข้าใจสูตรและกระบวนการคิด

#### 📊 **โจทย์:**
คำนวณ P(Spam|"Buy, Cheap, Work, Free") และ P(No Spam|"Buy, Cheap, Work, Free")

#### 🔢 **ขั้นตอนการคำนวณ:**

1. **Prior Probabilities:**
   ```
   P(Spam) = 25/100 = 0.25
   P(No Spam) = 75/100 = 0.75
   ```

2. **Conditional Probabilities:**
   ```
   P(Buy|Spam) = 20/60 = 0.3333    P(Buy|No Spam) = 5/52 = 0.0962
   P(Cheap|Spam) = 15/60 = 0.2500  P(Cheap|No Spam) = 10/52 = 0.1923
   P(Work|Spam) = 5/60 = 0.0833    P(Work|No Spam) = 30/52 = 0.5769
   P(Free|Spam) = 20/60 = 0.3333   P(Free|No Spam) = 7/52 = 0.1346
   ```

3. **Likelihood Calculation:**
   ```
   P(Spam|Message) ∝ 0.25 × 0.3333 × 0.2500 × 0.0833 × 0.3333 = 0.000578703704
   P(No Spam|Message) ∝ 0.75 × 0.0962 × 0.1923 × 0.5769 × 0.1346 = 0.001077053281
   ```

4. **Final Results:**
   ```
   P(Spam|Message) = 34.95%
   P(No Spam|Message) = 65.05%
   → Prediction: No Spam
   ```

#### 🎯 **คำตอบ:**
Message **"Buy, Cheap, Work & Free"** มีความน่าจะเป็น **65.05%** ที่จะเป็น **No Spam**

---

## 🚀 How to Use

### Prerequisites
```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### Running the Notebooks

1. **เริ่มต้นเรียนรู้:** `naive_bayes_assignment.ipynb`
   - เหมาะสำหรับผู้เริ่มต้น
   - เข้าใจหลักการพื้นฐาน

2. **ฝึกฝนการคำนวณ:** `message_probability_assignment.ipynb`
   - ทดลองคำนวณ manual
   - เข้าใจขั้นตอนละเอียด

3. **ประยุกต์ใช้จริง:** `Naive_Bayes_classification (1).ipynb`
   - ใช้กับข้อมูลจริง
   - ทดลองเปลี่ยนพารามิเตอร์

---

## 📚 Learning Objectives

### 🎯 **หลังจากเรียนจบ คุณจะสามารถ:**
1. **เข้าใจหลักการ Naive Bayes** - สมมติฐาน independence และการใช้งาน
2. **คำนวณ probability** - Prior, Conditional, Posterior แบบ step-by-step
3. **จัดการข้อมูลจริง** - Preprocessing, tokenization, feature extraction
4. **ทดลองและวิเคราะห์** - เปรียบเทียบผลกระทบของพารามิเตอร์
5. **ประยุกต์ใช้งาน** - สร้าง spam filter ในโลกจริง

---

## 🧮 Mathematical Foundation

### Naive Bayes Formula:
```
P(Class|Message) = P(Class) × ∏P(word|Class)
```

### Key Assumptions:
1. **Independence**: คำแต่ละคำใน message เป็นอิสระต่อกัน
2. **Bag of Words**: ลำดับของคำไม่สำคัญ
3. **Laplace Smoothing**: จัดการคำที่ไม่เคยเห็นใน training data

---

## 📊 Performance Comparison

| Metric | Simple Example | Real SMS Data |
|--------|----------------|---------------|
| Dataset Size | 100 emails | 5,572 SMS |
| Vocabulary | 5 words | 11,860+ words |
| Classes | Balanced | Imbalanced (86% Ham) |
| Complexity | Educational | Production-ready |
| Use Case | Learning | Real Application |

---

## 🎓 Educational Value

### 💡 **Progression Path:**
1. **Basic Theory** → `naive_bayes_assignment.ipynb`
2. **Manual Calculation** → `message_probability_assignment.ipynb`  
3. **Real Application** → `Naive_Bayes_classification (1).ipynb`

### 🔍 **Key Insights:**
- ข้อมูลฝึกมากขึ้น ≠ แม่นยำขึ้นเสมอไป
- Vocabulary size มีผลต่อ model complexity
- Balance ระหว่าง training/testing ข้อมูลสำคัญมาก
- Laplace smoothing ช่วยจัดการ zero probability

---

## 🛠️ Technical Implementation

### Data Processing Pipeline:
1. **Text Cleaning**: Remove punctuation, lowercase conversion
2. **Tokenization**: Split into individual words  
3. **Vocabulary Building**: Create word frequency tables
4. **Probability Calculation**: Prior and conditional probabilities
5. **Classification**: Apply Bayes rule with normalization

### Model Evaluation:
- **Accuracy**: Overall correctness
- **Precision**: True Positive / (True Positive + False Positive)
- **Recall**: True Positive / (True Positive + False Negative)
- **F1-Score**: Harmonic mean of Precision and Recall

---

## 🎯 Next Steps

### 🚀 **Possible Improvements:**
1. **N-grams**: ใช้ word pairs/triplets แทน single words
2. **TF-IDF**: Weight words by importance
3. **Feature Selection**: เลือกคำที่มี discriminative power สูง
4. **Ensemble Methods**: รวม multiple classifiers
5. **Deep Learning**: ใช้ Neural Networks สำหรับ text classification

### 📈 **Advanced Topics:**
- Multinomial vs Bernoulli Naive Bayes
- Handling imbalanced datasets
- Cross-validation strategies
- Production deployment considerations

---

## 📞 Contact & Support

หากมีคำถามหรือต้องการความช่วยเหลือเพิ่มเติม สามารถติดต่อได้ตามช่องทางต่าง ๆ

---

**Happy Learning! 🎉**

*"The best way to learn machine learning is by doing it step by step."*