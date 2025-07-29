# แผนการเรียนรู้ AI ใน 30 วัน
- เป้าหมาย: พัฒนาทักษะด้าน AI ตั้งแต่ระดับเริ่มต้น → ระดับกลาง → ระดับสูง ภายใน 30 วัน
- รูปแบบ: เรียนรู้ทฤษฎี → ฝึกเขียนโค้ด → ทดลองสร้างโปรเจ็กต์

# 📌 สัปดาห์ที่ 1: พื้นฐาน AI และ Machine Learning
(เน้นทำความเข้าใจแนวคิดหลัก และลงมือเขียนโค้ดเบื้องต้น)

- 📅 วันที่ 1-2: พื้นฐาน AI และ Machine Learning
✅ หัวข้อเรียนรู้
  - AI, Machine Learning, Deep Learning ต่างกันอย่างไร?
  - Supervised vs Unsupervised Learning
  - Machine Learning Workflow
- 🛠 แบบฝึกหัด
  - ติดตั้ง Python + Jupyter Notebook + NumPy, Pandas, Matplotlib
  - ทดลองโหลด dataset (sklearn.datasets) และสำรวจข้อมูล
- 📚 แหล่งเรียนรู้
  - [Book] Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron)
  - [Online] fast.ai’s Intro to Machine Learning

- 📅 วันที่ 3-4: การจัดการข้อมูลและการทำ Feature Engineering
✅ หัวข้อเรียนรู้
  - การจัดการข้อมูล: Data Cleaning, Missing Data, Normalization
  - Feature Engineering: Scaling, One-Hot Encoding, Feature Selection

- 🛠 แบบฝึกหัด
  - ใช้ Pandas ทำ Data Preprocessing กับ Titanic Dataset
  - เปรียบเทียบผลลัพธ์เมื่อใช้ StandardScaler กับ MinMaxScaler

- 📚 แหล่งเรียนรู้

  - [Kaggle] Titanic Dataset
  - [บทความ] Feature Engineering in ML

- 📅 วันที่ 5-6: Supervised Learning - Regression & Classification

✅ หัวข้อเรียนรู้
  - Linear Regression, Logistic Regression
  - Decision Tree, Random Forest, SVM, k-NN

- 🛠 แบบฝึกหัด

  - ใช้ Scikit-Learn สร้างโมเดล Linear Regression ทำนายราคาบ้าน
  - ใช้ Random Forest จัดกลุ่มข้อมูล Iris Dataset

- 📚 แหล่งเรียนรู้

  - [Book] Pattern Recognition and Machine Learning (Christopher Bishop)
  - [Online] Andrew Ng’s Machine Learning Course (Coursera)

- 📅 วันที่ 7: Unsupervised Learning - Clustering & Dimensionality Reduction

✅ หัวข้อเรียนรู้
  - k-Means Clustering, Hierarchical Clustering
  - PCA (Principal Component Analysis)

- 🛠 แบบฝึกหัด
  - ใช้ k-Means จัดกลุ่มข้อมูลจาก Mall Customer Dataset
  - ใช้ PCA เพื่อลดมิติข้อมูล MNIST Dataset

- 📚 แหล่งเรียนรู้
  - [Book] Data Science from Scratch (Joel Grus)
  - [Online] Stanford CS229

# 📌 สัปดาห์ที่ 2: Deep Learning (Neural Networks & TensorFlow)
(เริ่มลงลึกด้าน Deep Learning และทดลองสร้าง Neural Networks)

- 📅 วันที่ 8-9: พื้นฐาน Neural Networks และ TensorFlow/Keras
✅ หัวข้อเรียนรู้

  - การทำงานของ Neurons, Activation Functions
  - Forward Propagation & Backpropagation
- 🛠 แบบฝึกหัด

  - ใช้ TensorFlow และ Keras สร้าง Neural Network แบบง่าย
  - ทดลองเปรียบเทียบ ReLU, Sigmoid, Tanh กับชุดข้อมูล MNIST
- 📚 แหล่งเรียนรู้

  - [Book] Deep Learning (Ian Goodfellow)
  - [Online] TensorFlow Official Tutorials
- 📅 วันที่ 10-11: Convolutional Neural Networks (CNNs)
✅ หัวข้อเรียนรู้

  - Image Processing Basics
  - Convolution, Pooling, CNN Architectures
- 🛠 แบบฝึกหัด

  - ใช้ CNN จำแนกรูปภาพใน CIFAR-10
  - ทดลองใช้ Transfer Learning กับ ResNet50
- 📚 แหล่งเรียนรู้

  - [Book] Deep Learning with Python (François Chollet)
  - [Online] CS231n (Stanford)
- 📅 วันที่ 12-13: Recurrent Neural Networks (RNNs) & NLP
✅ หัวข้อเรียนรู้

  - Sequence Modeling, LSTM, GRU
  - Word Embeddings (Word2Vec, GloVe)
- 🛠 แบบฝึกหัด

  - ใช้ LSTM ทำนายราคาหุ้นจาก Time Series Data
  - ใช้ Word2Vec สร้าง NLP Model
- 📚 แหล่งเรียนรู้

  - [Book] Speech and Language Processing (Jurafsky & Martin)
  - [Online] NLP with Hugging Face
- 📅 วันที่ 14: Generative Models (GANs, Autoencoders)
✅ หัวข้อเรียนรู้

  - Generative Adversarial Networks (GANs)
  - Autoencoders และการประยุกต์ใช้
- 🛠 แบบฝึกหัด

  - ใช้ GANs สร้างภาพจาก Noise
  - ใช้ Autoencoder ลดมิติข้อมูล
- 📚 แหล่งเรียนรู้

  - [Book] GANs for Beginners
  - [Online] Deep Learning Specialization (Coursera)
# 📌 สัปดาห์ที่ 3-4: AI ขั้นสูงและโปรเจ็กต์จริง
(เริ่มสร้าง AI Projects พร้อมปรับแต่ง Model)

- 📅 วันที่ 15-20: Reinforcement Learning (RL)
✅ หัวข้อเรียนรู้

  - Markov Decision Process (MDP), Q-Learning, Policy Gradient
  - OpenAI Gym
- 🛠 แบบฝึกหัด

  - ใช้ Q-Learning สร้าง AI เล่น CartPole
  - ทดลองสร้าง Deep Q-Network (DQN)
- 📚 แหล่งเรียนรู้

  - [Book] Reinforcement Learning: An Introduction (Sutton & Barto)
  - [Online] OpenAI Gym Tutorials
- 📅 วันที่ 21-25: Computer Vision & Natural Language Processing
✅ หัวข้อเรียนรู้

  - Object Detection (YOLO, SSD)
  - Transformer Models (BERT, GPT)
- 🛠 แบบฝึกหัด

  - ใช้ YOLOv5 สร้าง Object Detection Model
  - Fine-tune GPT-2 เพื่อสร้าง Text Generation
- 📚 แหล่งเรียนรู้

  - [Book] Transformers for NLP
  - [Online] Hugging Face Courses
- 📅 วันที่ 26-30: โปรเจ็กต์ AI จริง + การปรับแต่งโมเดล
✅ ตัวเลือกโปรเจ็กต์
  - 1️⃣ AI Chatbot: ใช้ NLP + Transformer Model
  - 2️⃣ AI Recommendation System: ใช้ Collaborative Filtering
  - 3️⃣ AI Finance Prediction: ใช้ Time-Series LSTM

- 🛠 แบบฝึกหัด

  - ปรับแต่ง Hyperparameter Tuning (Grid Search, Bayesian Optimization)
  - ใช้ TensorFlow Serving เพื่อ Deploy Model
- 📚 แหล่งเรียนรู้

  - [Book] Machine Learning Engineering (Andriy Burkov)
  - [Online] ML Ops by Google
## 🔥 สรุป
  - สัปดาห์ที่ 1: พื้นฐาน AI & Machine Learning
  - สัปดาห์ที่ 2: Deep Learning (CNN, RNN, GANs)
  - สัปดาห์ที่ 3-4: AI ขั้นสูง + โปรเจ็กต์จริง
📢 “Don’t just learn AI, build with AI!” 🚀