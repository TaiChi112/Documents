# การแก้ไขปัญหา: คำสั่ง `code .` เปิดโปรแกรมผิด (VS Code vs Cursor IDE)

<!-- Language Selection -->
**🌐 Languages:** [English](README.md) | [ไทย](#ไทย)

---

## ไทย

เมื่อติดตั้ง Cursor IDE แล้วพบว่าคำสั่ง `code .` ที่เคยใช้เปิด Visual Studio Code (VS Code) กลับไปเปิด Cursor IDE แทน บทความนี้จะสรุปสาเหตุและวิธีการแก้ไขปัญหานี้ เพื่อให้ `code .` กลับไปเปิด VS Code และกำหนดให้ Cursor IDE ใช้คำสั่ง `cursor .` แทน

## ปัญหาที่พบ

โดยปกติแล้ว ทั้ง VS Code และ Cursor IDE ต่างก็พยายามติดตั้ง Command Line Tool ที่ใช้คำสั่ง `code .` เพื่อความสะดวกในการเปิดโปรเจกต์จาก Terminal หรือ Command Prompt เมื่อติดตั้งทั้งสองโปรแกรมบนเครื่องเดียวกัน อาจเกิดความขัดแย้งที่ทำให้คำสั่ง `code .` ไปเรียกโปรแกรมที่ติดตั้งทีหลัง หรือโปรแกรมที่มีการตั้งค่าลำดับความสำคัญสูงกว่า

**Path ตัวอย่างที่พบ:**

* **VS Code:** `C:\Program Files\Microsoft VS Code\bin`
* **Cursor IDE:** `c:\Users\[ชื่อผู้ใช้]\AppData\Local\Programs\cursor\resources\app\bin`

ในกรณีนี้ Cursor IDE มีไฟล์ `code` และ `code.cmd` อยู่ใน Path ของตัวเอง ทำให้มันถูกเรียกใช้เมื่อพิมพ์ `code .`

## วิธีแก้ไข

การแก้ไขปัญหานี้มี 2 ส่วนหลักๆ คือ การจัดลำดับ Path และการลบไฟล์ Command Line Tool ที่ไม่ต้องการของ Cursor IDE

### ขั้นตอนที่ 1: จัดลำดับ Environment Variables (PATH)

เพื่อให้ระบบปฏิบัติการค้นหา Command Line Tool ของ VS Code ก่อน Cursor IDE

1.  **เปิด System Properties:**
    * กด `Windows + R` พิมพ์ `sysdm.cpl` แล้วกด `Enter`
2.  **เข้าสู่ Environment Variables:**
    * ไปที่แท็บ "Advanced" คลิก "Environment Variables..."
3.  **แก้ไข Path สำหรับ User:**
    * ในส่วน "User variables for [ชื่อผู้ใช้ของคุณ]" เลือกตัวแปร `Path` แล้วคลิก "Edit..."
    * **ย้าย Path ของ VS Code (`C:\Program Files\Microsoft VS Code\bin`) ให้ "Move Up" ไปอยู่เหนือ Path ของ Cursor IDE (`c:\Users\[ชื่อผู้ใช้]\AppData\Local\Programs\cursor\resources\app\bin`)**
    * คลิก "OK" ทุกหน้าต่างเพื่อบันทึกการเปลี่ยนแปลง

### ขั้นตอนที่ 2: ลบไฟล์ Command Line Tool ของ Cursor IDE ที่ก่อให้เกิดปัญหา

Cursor IDE มีไฟล์ `code` และ `code.cmd` ที่ทำให้มันถูกเรียกใช้เมื่อพิมพ์ `code .` เราจะลบไฟล์เหล่านี้ออก

1.  **เปิด File Explorer:**
    * ไปที่ Path ของ Cursor IDE: `c:\Users\[ชื่อผู้ใช้]\AppData\Local\Programs\cursor\resources\app\bin`
2.  **ลบไฟล์ที่เกี่ยวข้องกับคำสั่ง `code`:**
    * ในโฟลเดอร์นี้ **ให้ลบไฟล์ชื่อ `code` (ไม่มีนามสกุล) และ `code.cmd` ออก**
    * **ข้อควรระวัง:** ตรวจสอบให้แน่ใจว่าคุณลบไฟล์ในโฟลเดอร์ของ **Cursor IDE** เท่านั้น ห้ามลบไฟล์ในโฟลเดอร์ของ VS Code เด็ดขาด!

### ขั้นตอนที่ 3: สร้างคำสั่ง `cursor .` สำหรับ Cursor IDE (ถ้ายังไม่มี)

ถ้าคุณยังไม่มีคำสั่ง `cursor .` ที่ใช้งานได้ คุณสามารถสร้าง Batch File เพื่อเรียกใช้ Cursor IDE ได้

1.  **สร้างโฟลเดอร์สำหรับ Batch Files (ถ้ายังไม่มี):**
    * สร้างโฟลเดอร์ใหม่ เช่น `C:\Users\[ชื่อผู้ใช้]\bin`
    * **สำคัญ:** เพิ่ม Path ของโฟลเดอร์นี้ (`C:\Users\[ชื่อผู้ใช้]\bin`) เข้าไปใน System Environment Variables (ตามขั้นตอนที่ 1) ด้วย
2.  **สร้างไฟล์ `cursor.bat`:**
    * เปิด Notepad หรือ Text Editor
    * คัดลอกโค้ดนี้ไปวาง:
        ```batch
        @echo off
        "c:\Users\[ชื่อผู้ใช้]\AppData\Local\Programs\cursor\resources\app\bin\cursor.cmd" %*
        ```
    * บันทึกไฟล์นี้เป็นชื่อ `cursor.bat` ในโฟลเดอร์ที่คุณสร้างในขั้นตอนที่ 1 (เช่น `C:\Users\[ชื่อผู้ใช้]\bin`)
    * ตรวจสอบให้แน่ใจว่าได้เลือก "Save as type: All Files (*.*)" ตอนบันทึก

### ขั้นตอนที่ 4: ทดสอบคำสั่ง

หลังจากทำตามขั้นตอนทั้งหมดแล้ว ให้ปิด Command Prompt/PowerShell ที่เปิดอยู่ทั้งหมด แล้วเปิดขึ้นมาใหม่ เพื่อให้ระบบโหลดการตั้งค่าล่าสุด

* **ทดสอบ VS Code:**
    ```bash
    code .
    ```
    VS Code ควรจะเปิดขึ้นมา
* **ทดสอบ Cursor IDE:**
    ```bash
    cursor .
    ```
    Cursor IDE ควรจะเปิดขึ้นมา

## สรุปผลลัพธ์

เมื่อทำตามขั้นตอนเหล่านี้ คุณจะสามารถใช้งานคำสั่ง `code .` เพื่อเปิด Visual Studio Code ได้ตามปกติ และใช้คำสั่ง `cursor .` เพื่อเปิด Cursor IDE ได้อย่างถูกต้อง ทำให้การทำงานของคุณมีประสิทธิภาพและไม่สับสนอีกต่อไป

---

**หมายเหตุ:** เปลี่ยน `[ชื่อผู้ใช้]` เป็นชื่อผู้ใช้ Windows จริงของคุณในทุก path ที่กล่าวถึงข้างต้น
