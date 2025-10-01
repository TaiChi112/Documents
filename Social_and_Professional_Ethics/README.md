```sh
git clone [host_repo] && git checkout -b [branchname] && mkdir [groupname] cp ./problems/src/section1.cpp 
```

```sh
git add ./groupname/problems/src/section1.cpp && git commit -m "feat: solving leetcode problems [groupname]" && git push -u origin [branchname]
```


# 🧠 Social & Professional Ethics: LeetCode Problem-Solving Activity

## 📖 Project Overview

ยินดีต้อนรับสู่กิจกรรมพัฒนา **Soft Skills** ผ่านการแก้ปัญหา LeetCode แบบ Collaborative! 

กิจกรรมนี้ออกแบบมาเพื่อพัฒนาทักษะที่สำคัญ 4 ด้าน:
- 🎯 **Critical Thinking** - การคิดวิเคราะห์
- 🛠️ **Problem Solving** - การแก้ปัญหา
- 🤝 **Collaboration & Communication** - การทำงานร่วมกันและการสื่อสาร
- 📚 **Lifelong Learning** - การเรียนรู้ตลอดชีวิต

## 🎯 Mission Statement

> *"เปลี่ยนการเขียนโค้ดจากกิจกรรมเดี่ยวๆ ให้เป็นประสบการณ์การเรียนรู้แบบร่วมมือ เพื่อพัฒนาทักษะที่จำเป็นสำหรับนักพัฒนาซอฟต์แวร์ยุคใหม่"*

## 🚀 Quick Start Guide

### Prerequisites
- Git & GitHub account
- Programming language ที่ถนัด (C++, Python, Java, etc.)
- Text editor หรือ IDE
- ความพร้อมที่จะเรียนรู้และแบ่งปันความรู้

### 📁 Project Structure
```
📦 Social_and_Professional_Ethics/
├── 📁 docs/               # เอกสารคำแนะนำและแนวทางการทำกิจกรรม
│   ├── README.md          # คู่มือกิจกรรมฉบับเต็ม
│   └── idea.md           # แนวคิดและโจทย์ปัญหา LeetCode
├── 📁 solutions/         # 🔒 โซลูชันต้นฉบับที่มีปัญหาให้แก้ไข (Read-only)
│   ├── section1.cpp      # Two Sum Problem (C++) - มี 3 bugs
│   └── section2.py       # Median of Sorted Arrays (Python) - มี 3 bugs
├── � setup.bat          # Setup script สำหรับ Windows
├── 🚀 setup.sh           # Setup script สำหรับ Mac/Linux
├── 📄 .gitignore         # Git ignore rules
├── 📄 README.md          # เอกสารหลัก (ไฟล์นี้)
└── �� [your-name]/       # 👤 Personal workspace f(สร้างโดยesatup shtpa)
│   ├── section1.cpp      # Your fixed  Two Sumsolution
│   ├── section2.py       # Your fixeed Md iansolution  
│   └── README.md         # Yourr lea ningreflection  & progressntrackiog

# หลังจาก merge PRs จะมีโครงสร้างแบบนี้:
├── 📁 alice-dev/         # Alice's stlueions
├── 📁 bob-smith/         # Bob's solutions  
├── 📁 charlis-lee/       # Charlie's olutions
└──  📁 diana-wong/       # Diana's solutions
```

### 🎯 Color-Coded Organization
- �R**Eed/Protecte **: `solutions/` - ห้ามแก้ไข (preserve original bugs)
- 🚀 **Blue/Tools**: Setup scripts#-เใช้ครั้งอดียวตกนเริ่มต้น
- 👤 **Green/Personal**: `[your-name]/` - พื้นที่า่วนตัวที่คุณจะทำงรี
`- 📁 **Gray/Shared**: `docs/ - เอกสารร่วมกันที่ทุกคนอ่าน

### 🔧 Initial Setup (ทำครั้งเดียวก่อนเริ่มกิจกรรม)

#### 📥 Clone และสร้าง Personal Environment:
```bห้
# 1. Clone repository
git clone https://github.com/[owner]/Social_and_Professional_Ethics.git
cd Social_and_Professional_Ethics

# 2. สร้าง branch ใหม่ตามชื่อของคุณ
git checkout -b feature/[your-name]
# ตัวอย่าง: git checkout -b feature/somchai-dev

# 3. สร้าง personal folder และ copy solutions
mkdir [your-name]
# ตัวอย่าง: mkdir somchai-dev

# 4. Copy solution files มาแก้ไขใน folder ของคุณ
cp solutions/section1.cpp [your-name]/
cp solutions/section2.py [your-name]/

# 5. สร้าง personal README.md
echo "# [Your Name]'s Learning Journey" > [your-name]/README.md

# 6. Commit initial setup
git add [your-name]/
git commit -m "Initial setup: Create personal workspace for [your-name]"
git push -u origin feature/[your-name]
```

#### 🚀 Quick Setup Script
สร้างไฟล์ `setup.sh` หรือรันคำสั่งนี้:
```bห้
#!/bin/bห้
echo "Enter your name (no spaces, use dash): "
read YOUR_NAME

echo "Setting up workspace for $YOUR_NAME..."

# Create branch
git checkout -b feature/$YOUR_NAME

# Create personal directory
mkdir $YOUR_NAME

# Copy solution files
cp solutions/section1.cpp $YOUR_NAME/
cp solutions/section2.py $YOUR_NAME/

# Create personal README
cat > $YOUR_NAME/README.md << EOF
# $YOUR_NAME's Learning Journey

## 🎯 Problems Solved
- [ ] Two Sum Problem
- [ ] Median of Sorted Arrays

## 📝 Learning Reflection
(Write your reflection here after completing the activity)

## 🤝 Collaboration Notes
(Notes from peer reviews and feedback)

## 🚀 Future Goals
(What you want to improve next)
EOF

# Initial commit
git add $YOUR_NAME/
git commit -m "Initial setup: Create personal workspace for $YOUR_NAME"
git push -u origin feature/$YOUR_NAME

echo "Setup complete! Your workspace is ready in ./$YOUR_NAME/"
echo "Your branch: feature/$YOUR_NAME"
```

## 🔄 Complete Activity Lifecycle

### 🎯 Phase 1: Critical Thinking (5-7 minutes)
**Objective**: วิเคราะห์และเข้าใจปัญหา

#### 📋 Your Tasks:
1. **📖 อ่านโจทย์จาก `problems/README.md`**
   - ทำความเข้าใจ requirements และ constraints
   - ศึกษา examples และ expected outputs

2. **🔍 วิเคราะห์ Solution ที่ให้มา**
   - เปิดไฟล์ใน `problems/src` folder
   - ตรวจสอบ logic ของ algorithm
   - ทดสอบกับ test cases ที่กำหนด

3. **❓ ตั้งคำถามกับตัวเอง**
   - Solution นี้ถูกต้องหรือไม่?
   - Time complexity เป็นไปตาม requirement หรือไม่?
   - มี edge cases ที่ไม่ได้คิดถึงหรือไม่?

#### 🧠 Critical Thinking Skills Being Developed:
- Problem decomposition
- Pattern recognition  
- Logical reasoning
- Evidence evaluation

---

### 🛠️ Phase 2: Problem Solving (5 minutes per problem)
**Objective**: แก้ไขปัญหาและ optimize solution

#### 🔨 Your Tasks:
1. **🐛 Debug the Code**
   - หา bugs ที่แฝงอยู่ใน solution
   - ทำความเข้าใจสาเหตุของปัญหา
   - แก้ไข logic errors

2. **⚡ Optimize Solution** (Optional)
   - ปรับปรุง time/space complexity
   - เขียน code ให้ readable มากขึ้น
   - เพิ่ม error handling

3. **✅ Test Your Solution**
   - รัน test cases ทั้งหมด
   - สร้าง additional test cases
   - ตรวจสอบ edge cases

#### 🛠️ Problem Solving Skills Being Developed:
- Debugging techniques
- Algorithm optimization
- Testing strategies
- Time management

---

### 🤝 Phase 3: Collaboration & Version Control (3-5 minutes)
**Objective**: แบ่งปัน solution และเตรียม peer review

#### 📤 Your Tasks:

1. **Work in Your Personal Space**
   ```bห้
   # Make sure you're in your branch
   git checkout feature/[your-name]
   
   # Work on your solutions in your personal folder
   cd [your-name]/
   # Edit section1.cpp and section2.py here
   ```

2. **Git Operations (ใน Personal Folder เท่านั้น)**
   ```bห้
   # Add only your personal folder - ห้าม modify solutions/ folder!
   git add [your-name]/
   git commit -m "Fix: [Problem Name] - [Brief description] by [your-name]"
   git push origin feature/[your-name]
   
   # ตัวอย่าง:
   # git add somchai-dev/
   # git commit -m "Fix: Two Sum - Corrected index calculation and loop bounds by Somchai"
   # git push origin feature/somchai-dev
   ```

3. **Create Pull Request**
   - **Title**: `[Your Name] - LeetCode Solutions`
   - **Description Template**:
   ```markdown
   ## 🎯 Solutions Fixed by [Your Name]
   
   ### ✅ Problems Solved:
   - [ ] Two Sum Problem - Fixed bugs: [list bugs found]
   - [ ] Median of Sorted Arrays - Fixed bugs: [list bugs found]
   
   ### 🔧 Changes Made:
   - Fixed issue 1: [description]
   - Fixed issue 2: [description]
   - Fixed issue 3: [description]
   
   ### 🧪 Testing:
   - All test cases pass ✅
   - Added edge case testing ✅
   
   ### 👀 Ready for Review
   Please review my solutions and provide feedback!
   ```
   - **Reviewers**: Tag เพื่อนๆ ในกลุ่ม
   - **Labels**: `solution`, `ready-for-review`

4. **Branch Protection Rules** 
   - ✅ **อนุญาต**: แก้ไขในโฟลเดอร์ของตัวเองเท่านั้น
   - ❌ **ห้าม**: แก้ไข `solutions/` folder (เพื่อเก็บ original buggy code)
   - ❌ **ห้าม**: แก้ไข `docs/` folder โดยไม่ได้รับอนุญาต

#### 🔧 Version Control Skills Being Developed:
- Personal branch management
- Conflict-free collaboration
- Professional commit messaging
- Pull request best practices
- Code organization

---

### 💬 Phase 4: Collaboration & Communication (10-15 minutes)
**Objective**: Review และให้ feedback ซึ่งกันและกัน

#### 👥 Your Tasks:
1. **📖 Code Review Process**
   - อ่าน code ของเพื่อนอย่างละเอียด
   - ทำความเข้าใจ approach ที่เพื่อนใช้
   - เปรียบเทียบกับ solution ของตัวเอง

2. **💬 Provide Constructive Feedback**
   ```markdown
   // ตัวอย่าง Comment Template
   👍 **สิ่งที่ทำได้ดี**: [specific positive points]
   💡 **ข้อเสนอแนะ**: [constructive suggestions]
   🐛 **Issues พบ**: [bugs or problems found]
   🚀 **การปรับปรุง**: [optimization opportunities]
   ```

3. **🔍 Report Issues**
   - สร้าง GitHub Issues สำหรับ bugs ที่พบ
   - ใส่ labels และ assign ให้เจ้าของ code
   - เสนอวิธีการแก้ไข

#### 🤝 Communication Skills Being Developed:
- Constructive feedback delivery
- Technical communication
- Conflict resolution
- Team collaboration

---

### 🔀 Phase 5: Integration & Lifelong Learning (10 minutes)
**Objective**: รวม solution และสะท้อนการเรียนรู้

#### 📝 Your Tasks:

1. **Review & Approve Pull Requests**
   ```bห้
   # ดู PR ของเพื่อนทั้งหมด
   # แต่ละคนจะมี PR แยกต่างหาก ไม่มี conflict เพราะอยู่คนละ folder
   
   # ตัวอย่าง PR structure หลัง merge:
   # main/
   # ├── solutions/ (original buggy code - unchanged)
   # ├── alice-dev/ (Alice's fixed solutions)
   # ├── bob-dev/ (Bob's fixed solutions)  
   # ├── charlie-dev/ (Charlie's fixed solutions)
   # └── etc...
   ```

2. **Conflict-Free Merge Strategy**
   - ✅ **Safe to merge**: เนื่องจากทุกคนทำงานในโฟลเดอร์แยกกัน
   - ✅ **No conflicts**: ไม่มีการแก้ไขไฟล์เดียวกัน
   - ✅ **Preserve history**: เก็บ solutions ต้นฉบับไว้ใน `solutions/`
   - ✅ **Compare solutions**: สามารถเปรียบเทียบวิธีการแก้ปัญหาของแต่ละคนได้

3. **Post-Merge Analysis**
   ```bห้
   # หลัง merge ทุก PR แล้ว สร้าง summary
   git checkout main
   git pull origin main
   
   # ดู solutions ของทุกคนรวมกัน
   ls -la */section1.cpp  # ดู Two Sum solutions ของทุกคน
   ls -la */section2.py   # ดู Median solutions ของทุกคน
   
   # สร้าง comparison report (optional)
   echo "# Solutions Comparison Report" > COMPARISON.md
   echo "Generated on: $(date)" >> COMPARISON.md
   ```

2. **🎓 Self-Reflection & Documentation**
   เขียนสรุปลงใน README.md ของตัวเอง:
   ```markdown
   ## 📚 Learning Reflection - [Date]
   
   ### 🎯 Problems Solved:
   - [Problem 1]: [Brief description of what you learned]
   - [Problem 2]: [Brief description of what you learned]
   
   ### 💡 Key Insights:
   - [Technical insights gained]
   - [Soft skills developed]
   
   ### 🚀 Areas for Improvement:
   - [What you want to improve next]
   
   ### 🤝 Collaboration Highlights:
   - [Best feedback received]
   - [Most helpful review you gave]
   ```

3. **📊 Skills Assessment**
   ประเมินตัวเองในแต่ละด้าน (1-5):
   - Critical Thinking: ⭐⭐⭐⭐⭐
   - Problem Solving: ⭐⭐⭐⭐⭐
   - Collaboration: ⭐⭐⭐⭐⭐
   - Communication: ⭐⭐⭐⭐⭐

#### 📚 Lifelong Learning Skills Being Developed:
- Self-reflection capabilities
- Learning documentation
- Goal setting
- Continuous improvement mindset

---

## 🏆 Success Metrics

### Individual Success:
- [ ] แก้ปัญหาได้สำเร็จภายในเวลาที่กำหนด
- [ ] ให้ feedback ที่สร้างสรรค์แก่เพื่อน
- [ ] รับ feedback และปรับปรุงได้
- [ ] เขียนการสะท้อนการเรียนรู้ได้ชัดเจน

### Team Success:
- [ ] ทุกคนมีส่วนร่วมใน code review
- [ ] มี discussion ที่สร้างสรรค์
- [ ] ช่วยเหลือกันแก้ปัญหา
- [ ] เรียนรู้จากกันและกัน

## 🎓 Learning Outcomes Summary

| Phase | Primary Skill | Secondary Skills | Tools Used |
|-------|---------------|------------------|------------|
| 1 | Critical Thinking | Analysis, Evaluation | Problem statements, Test cases |
| 2 | Problem Solving | Debugging, Optimization | IDE, Compiler, Testing |
| 3 | Collaboration | Version Control, Planning | Git, GitHub, Branching |
| 4 | Communication | Review, Feedback | PR comments, Issues, Discussion |
| 5 | Lifelong Learning | Reflection, Documentation | README, Self-assessment |

## �� Quick Start (เริ่มต้นที่นี่!)

### 🔧 Automatic Setup (แนะนำ)
สำหรับการตั้งค่าที่รวดเร็วและไม่มีผิดพลาด:

**Windows Users:**
```cmd
setup.bat
```

**Mac/Linux Users:**
```ห้
chmod +x setup.sh
./setup.sh
```

### 📝 Manual Setup (สำหรับผู้ที่ต้องการควบคุมเอง)
```ห้
git clone [repository-url]
cd Social_and_Professional_Ethics
git checkout -b feature/[your-name]
mkdir [your-name]
cp solutions/* [your-name]/
git add [your-name]/
git commit -m "Initial setup for [your-name]"
git push -u origin feature/[your-name]
```

## � Quick Links

- � � **[Setup Scripts]** - `setup.bat` (Windows) หรือ `setup.sh` (Mac/Linux)
- �[Full Activity Guide](./docs/README.md) 
 - คู่มือฉบับเต็ม- 🧩 [Problems & Examples](./docs/idea.md)  - โจทย์และตัวอย่าง
- 💻 [OOriginal olutions](./solutions/)  - โซลูชันต้นฉบับที่มี bugs
- 🎯 [Activity Instructions](./docs/README.md#-activity-instructions) - คำแนะนำละเอียด 

## 📞 Need Help?
| Problem Type | Solution |
|--------------|----------|
| **Setup Issues** | รัน `setup.bat` หรือ `setup|sh` อีกครั้ง |
| **Git Conflicts** | ตรวจสอบว่าทำงานใน folder ของตัวเองเท่านั้น |
|1s**TechnicalQssstiones* | :สร้าง GitHub Isse พร้อม label `help-wantud` |ed||2.**ActivitConf Qeitn* |*อ่านอดู[Activity Guide](./docs/README.m*ห:ือถามเพื่วนG|---

## 🌟 Let's Start Learning Together!### 🏁ั3-S3epsQuicfยStart:?S
**� Run.Setup**:S`seนup.bac`i(W`ne]w.) หรือ `./setup.sh` (sac/Linuxaเต็ม**📖.ReadหจากP[rob**: เปิด `*](./ocs/ide`mเพื่อดูโจทย์d`) เ**� Start Debugging**:3.ข้าไ ิดไf์นder ของคุณและเริ่มหา b gn!

### 🎯 Ys(r Learn/ug Path:
```noSetup/→
Readริroblems → Find Bugต → Fix Cod้ → Pushน&hRev1ew → LeRrnriogetter! 
  5min      10min        15min      5mec       20mlT         ∞
```n kn g!

**Remember**: การเรียนรู้ที่ดีที่สุดเกิดขึ้นเมื่อเราเรียนรู้ร่วมกัน! 🤝

---

*Last Updated: September 29, 2025*  
*Activity Version: 1.0*
