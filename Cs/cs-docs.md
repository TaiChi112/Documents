# 🧱 Core CS Curriculum (สำหรับ SWE)
### 🧠 พื้นฐานคอมพิวเตอร์
- Introduction to Computer Science
- Discrete Mathematics
- Data Structures and Algorithms
- Computer Organization & Architecture
- Operating Systems
- Computer Networks
- Databases (SQL & NoSQL)
- Software Engineering Principles
- Theory of Computation (ToC)
- Programming Languages / Compilers

### 💻 การเขียนโปรแกรมและเทคนิค
- Object-Oriented Programming (OOP)
- Functional Programming
- Systems Programming (C, Assembly)
- Web Development (Frontend/Backend)
- Mobile App Development
- Human–Computer Interaction (HCI)
- Software Testing & Debugging
- DevOps & CI/CD

### 📊 คณิตศาสตร์และตรรกะ
- Linear Algebra
- Calculus I–II
- Probability & Statistics
- Graph Theory
- Logic & Proof Techniques

### 🧠 ปัญญาประดิษฐ์และข้อมูล
- Artificial Intelligence (AI)
- Machine Learning
- Data Science / Data Mining
- Information Retrieval
- Computer Vision / NLP (elective)

### 🔐 ระบบและความปลอดภัย
- Cybersecurity Fundamentals
- Cryptography
- Cloud Computing
- Parallel & Distributed Systems

### 🛠 ทักษะอื่นที่เกี่ยวข้อง
- Capstone Project / Final Year Project
- Software Project Management
- Ethics in Computing
- Agile / Scrum / SDLC

### 🎯 Electives ที่เจอบ่อย
- Game Development
- Embedded Systems
- Blockchain / Smart Contracts
- AR/VR Programming
- Bioinformatics / Quantum Computing


# (A) หัวข้อไหนควรเน้นพิเศษสำหรับสาย SWE?
### เน้นที่สุดในสาย Software Engineer:
- ✅ Data Structures & Algorithms (แก้ปัญหาได้เร็วและแม่น)
- ✅ Operating Systems (เข้าใจ memory, threads, scheduling)
- ✅ Databases (สำคัญมากในเว็บ/แอป)
- ✅ Software Architecture / Design Patterns (วางระบบใหญ่ได้)
- ✅ DevOps / Testing / CI-CD (ใช้จริงในงานอุตสาหกรรม)
- ✅ Version Control (Git)

# (B) Elective เสริมสำหรับ AI และ Full-Stack
| เป้าหมาย        | แนะนำเสริม                                                                                                             |
| -------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **AI/ML**      | - Linear Algebra<br>- Probability & Statistics<br>- Machine Learning<br>- Deep Learning<br>- Natural Language Processing |
| **Full-Stack** | - Frontend (HTML/CSS, JS/React)<br>- Backend (Node.js/Django)<br>- API Design<br>- DevOps<br>- Security (OAuth, JWT)     |

# (C) เรียนแบบ Self-Taught ควรเรียงลำดับยังไง?
### ลำดับแบบเน้นลงมือจริง + ทฤษฎี:
- Python / JavaScript Basics
- Data Structures & Algorithms
- OOP + Git + CLI
- Web Dev (HTML, CSS, JS)
- Backend (Django / Node.js)
- Database (SQL + NoSQL)
- Operating System + Networking
- System Design + Testing
- DevOps + Docker + CI/CD
- AI/ML (ถ้าสนใจ)

# (D) ถ้าต้องสอบจบใน 2 ปี จะเลือกเรียนอะไร?
### เน้นเอาตัวรอดงานจริง + สอบได้:

#### 📚 เลือกเรียนแน่ๆ:
- Programming (Python/JS)
- Data Structures & Algorithms
- DB + SQL
- Operating Systems
- Web Dev (Full-stack)
- Software Engineering + Design Patterns
- ToC (Automata + Basic Complexity)

#### 🗑️ กล้าตัดออก (หากเวลาจำกัดมาก):

- Calculus II / Physics
- Low-level Circuit Design
- Advanced Compilers (ถ้าไม่ทำ compiler)
- Theoretical AI Math (ถ้ายังไม่เน้นสาย AI research)

```py

from matplotlib import pyplot as plt
from matplotlib.patches import Rectangle

# Define roadmap layers
year_labels = ["Year 1\n(Beginner)", "Year 2\n(Intermediate)", "Year 3\n(Advanced)", "Year 4\n(Expert)"]
topics_by_year = [
    ["Intro to CS", "Programming (Python/C)", "Discrete Math", "Calculus I", "Data Structures (Basic)"],
    ["OOP", "Algorithms", "Database Systems", "Computer Organization", "Operating Systems (Basic)", "Theory of Computation (Automata)"],
    ["Computer Networks", "Advanced Algorithms", "Operating Systems (Advanced)", "HCI", "Software Architecture", "ToC (Complexity)"],
    ["Capstone Project", "DevOps / CI-CD", "AI/ML (Advanced)", "Cloud Computing", "Cybersecurity", "Distributed Systems"]
]

# Plotting
fig, ax = plt.subplots(figsize=(12, 6))
colors = ['#d1e7dd', '#bee5eb', '#f8d7da', '#fff3cd']

for i, (label, topics) in enumerate(zip(year_labels, topics_by_year)):
    ax.add_patch(Rectangle((i * 2.5, 0), 2.2, len(topics) + 0.2, color=colors[i], ec='black', lw=1.5))
    ax.text(i * 2.5 + 1.1, len(topics) + 0.1, label, ha='center', va='bottom', fontsize=11, weight='bold')
    for j, topic in enumerate(topics):
        ax.text(i * 2.5 + 0.2, len(topics) - j - 0.3, f"- {topic}", fontsize=10, ha='left', va='center')

ax.set_xlim(0, 11)
ax.set_ylim(0, 7)
ax.axis('off')
plt.tight_layout()
plt.savefig("/mnt/data/CS_Roadmap_4_Years.png")
plt.show()
```