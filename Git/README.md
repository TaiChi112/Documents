# Generalization of Git

- [ ] เริ่มต้นด้วยการใช้ Git ด้วยการ check ก่อนว่าเรามี git on local หรือบนเครื่องเรานั้นเอง
  
```sh
git --version
```

```sh
# git version 2.45.2.windows.1 
```
- กรณีอื่นๆ ถ้า `command not found` เเสดงว่าเรายังไม่ได้ติดตั้ง git ให้ทำการติดตั้ง git ก่อน
- [Download Git](https://git-scm.com/downloads)  
- ให้เลือก download ตาม OS ที่เราใช้
  - กรณี macOS ให้เลือก download เป็น `macOS` 
  - กรณี Linux ให้เลือก download เป็น `Linux` 
  - กรณี Windows ให้เลือก download เป็น `Windows`
- กรณี windows ให้เลือก download เป็น `64-bit Git for Windows Setup`
- กรณี macOS ให้เลือก download เป็น `64-bit Intel` หรือ `Apple Silicon` ตามเครื่องที่เราใช้
- กรณี Linux ให้เลือก download ตาม distro ที่เราใช้ เช่น `Ubuntu`, `Fedora`, `Arch` เป็นต้น

- หลังจากติดตั้งเสร็จแล้ว ให้ลองเช็คเวอร์ชั่นอีกครั้ง

```sh
git --version
```
- กรณี windows ควรจะได้ตาม comment ข้างล่าง ถ้าเราใช้ `Git Bash` ให้เปิด `Git Bash` ขึ้นมาแล้วลองเช็คเวอร์ชั่นอีกครั้ง
```sh
# git version 2.45.2.windows.1
```

สิ่งที่ต้องทำก่อนจะทำการ push ขึ้นไปบน remote repository
- ก่อนที่เราจะเริ่มใช้งาน git เราต้องตั้งค่า user name และ email ของเราก่อน เพื่อให้ git รู้ว่าใครเป็นคนทำการ commit
```sh
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
- คำสั่ง `git config --global user.name "Your Name"` จะตั้งค่า user name ของเรา
- คำสั่ง `git config --global user.email "your.email@example.com"` จะตั้งค่า email ของเรา
- หลังจากตั้งค่าเสร็จแล้ว ให้ลองเช็คการตั้งค่าอีกครั้ง
```sh
git config --global --list
```
- คำสั่ง `git config --global --list` จะแสดงการตั้งค่าทั้งหมดที่เราทำไว้ เช่น user name และ email

- Note: ปัญหามือใหม่ที่มักเจอ ตอนเริ่มใช้ Git เเล้วต้องการ push ขึ้นไปบน remote repository แต่ไม่สามารถ push ได้ คือ
- การ generate SSH key เพื่อใช้ในการเชื่อมต่อกับ remote repository เช่น GitHub, GitLab, Bitbucket เป็นต้น
- ให้ทำการเปิด terminal ขึ้นมาแล้วใช้คำสั่งต่อไปนี้เพื่อสร้าง SSH key ใหม่
```sh
ssh-keygen -t rsa -b 4096 -C "your.email@example.com"
```
- คำสั่ง `ssh-keygen -t rsa -b 4096 -C "your.email@example.com"` จะสร้าง SSH key ใหม่ที่ใช้ email ของเราเป็น comment
- หลังจากนั้นให้กด Enter เพื่อใช้ค่าเริ่มต้นในการสร้างไฟล์ SSH key
- เมื่อสร้าง SSH key เสร็จแล้ว ให้ทำการเพิ่ม SSH key ลงใน ssh-agent
```sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```
- คำสั่ง `eval "$(ssh-agent -s)"` จะเริ่มต้น ssh-agent และคำสั่ง `ssh-add ~/.ssh/id_rsa` จะเพิ่ม SSH key ที่เราสร้างขึ้นไปยัง ssh-agent
- หลังจากนั้นให้คัดลอก SSH key ที่เราสร้างขึ้นไปยัง clipboard
```sh
cat ~/.ssh/id_rsa.pub | clip
```
- คำสั่ง `cat ~/.ssh/id_rsa.pub | clip` จะคัดลอก SSH key ที่เราสร้างขึ้นไปยัง clipboard
- จากนั้นให้ไปที่ remote repository ที่เราต้องการเชื่อมต่อ เช่น GitHub, GitLab, Bitbucket เป็นต้น
- ให้ไปที่การตั้งค่า SSH keys ของ remote repository นั้นๆ แล้ววาง SSH key ที่เราคัดลอกมาในขั้นตอนก่อนหน้า
- หลังจากนั้นให้บันทึกการตั้งค่า SSH key 

- เมื่อเราทำการตั้งค่า SSH key เสร็จแล้ว เราสามารถเชื่อมต่อกับ remote repository ได้โดยใช้ SSH แทน HTTPS
- ให้ทำการ clone remote repository มายังเครื่องของเรา
```sh
git clone git@github.com:username/repo.git
```
- คำสั่ง `git clone git@github.com:username/repo.git` จะทำการ clone remote repository มายังเครื่องของเรา
- โดยที่ `username` คือชื่อผู้ใช้ของเราใน remote repository และ `repo` คือชื่อ repository ที่เราต้องการ clone
- หลังจาก clone เสร็จแล้ว ให้เข้าไปในโฟลเดอร์ของ repository ที่เรา clone มา
```sh
cd repo
```
- คำสั่ง `cd repo` จะเข้าไปในโฟลเดอร์ของ repository ที่เรา clone มา โดยที่ `repo` คือชื่อของ repository ที่เรา clone มา
- หลังจากนั้นเราสามารถเริ่มใช้งาน git ได้เลย

- หลังจากที่เรา generate SSH key และเชื่อมต่อกับ remote repository เรียบร้อยแล้ว เราสามารถเริ่มต้นใช้งาน git ได้
- ตอนนี้เราควรจะ push code ขึ้นไปบน remote repository ได้แล้ว 

- สมมติว่ามันถึงจุดที่มี git เราจะเริ่มต้นด้วยการสร้าง repository ใหม่
- ให้สร้างโฟลเดอร์ใหม่ขึ้นมาในเครื่องเรา เช่น `my-project`
```sh
mkdir my-project
cd my-project
git init
```
- คำสั่ง `git init` จะสร้าง repository ใหม่ในโฟลเดอร์นั้น
- หลังจากนั้นให้สร้างไฟล์ใหม่ขึ้นมา เช่น `README.md`
```sh
touch README.md
```
- เปิดไฟล์ `README.md` ด้วย editor ที่เราชอบ เช่น `VS Code`, `Sublime Text`, `Atom` หรืออื่นๆ
- ใส่ข้อความลงไปในไฟล์ `README.md` เช่น
```markdown
# My Project

This is my project.
```
- บันทึกไฟล์ `README.md` แล้วกลับมาที่ terminal
- ใช้คำสั่ง `git add` เพื่อเพิ่มไฟล์ `README.md` เข้าไปใน staging area
```sh
git add README.md
```
- หลังจากนั้นให้ใช้คำสั่ง `git commit` เพื่อบันทึกการเปลี่ยนแปลง
```sh
git commit -m "Add README.md"
```
- คำสั่ง `git commit -m "Add README.md"` จะบันทึกการเปลี่ยนแปลงที่เราได้ทำไปในไฟล์ `README.md` พร้อมกับข้อความอธิบายการเปลี่ยนแปลง
- หลังจากนั้นให้ใช้คำสั่ง `git status` เพื่อตรวจสอบสถานะของ repository
```sh
git status
```
- คำสั่ง `git status` จะแสดงสถานะของไฟล์ใน repository ว่ามีการเปลี่ยนแปลงอะไรบ้าง
- ถ้าเราต้องการดูประวัติการ commit ที่เราได้ทำไปแล้ว
```sh
git log
```
- คำสั่ง `git log` จะแสดงประวัติการ commit ที่เราได้ทำไปแล้ว พร้อมกับรายละเอียดของแต่ละ commit
- ถ้าเราต้องการดูรายละเอียดของ commit ล่าสุด
```sh
git show
```
- คำสั่ง `git show` จะแสดงรายละเอียดของ commit ล่าสุดที่เราได้ทำไป รวมถึงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ต่างๆ
- ถ้าเราต้องการย้อนกลับไปยัง commit ก่อนหน้า
```sh
git checkout HEAD^
```
- คำสั่ง `git checkout HEAD^` จะย้อนกลับไปยัง commit ก่อนหน้า
- ถ้าเราต้องการย้อนกลับไปยัง commit ที่เราต้องการ
```sh
git checkout <commit-hash>
```
- คำสั่ง `git checkout <commit-hash>` จะย้อนกลับไปยัง commit ที่เราต้องการ โดย `<commit-hash>` คือ hash ของ commit ที่เราต้องการย้อนกลับไป
- ถ้าเราต้องการสร้าง branch ใหม่
```sh
git branch <branch-name>
``` 
- คำสั่ง `git branch <branch-name>` จะสร้าง branch ใหม่ที่ชื่อว่า `<branch-name>`
- ถ้าเราต้องการสลับไปยัง branch ที่เราสร้างขึ้น
```sh
git checkout <branch-name>
```
- คำสั่ง `git checkout <branch-name>` จะสลับไปยัง branch ที่เราสร้างขึ้น โดย `<branch-name>` คือชื่อของ branch ที่เราต้องการสลับไป
- ถ้าเราต้องการรวม branch ที่เราสร้างขึ้นกับ branch หลัก
```sh
git checkout main
git merge <branch-name>
```
- คำสั่ง `git checkout main` จะสลับไปยัง branch หลักที่ชื่อว่า `main` และคำสั่ง `git merge <branch-name>` จะรวม branch ที่เราสร้างขึ้นกับ branch หลัก โดย `<branch-name>` คือชื่อของ branch ที่เราต้องการรวม
- ถ้าเราต้องการลบ branch ที่เราสร้างขึ้น
```sh
git branch -d <branch-name>
```
- คำสั่ง `git branch -d <branch-name>` จะลบ branch ที่เราสร้างขึ้น โดย `<branch-name>` คือชื่อของ branch ที่เราต้องการลบ
- ถ้าเราต้องการลบ branch ที่เราสร้างขึ้นแบบ force
```sh
git branch -D <branch-name>
```
- คำสั่ง `git branch -D <branch-name>` จะลบ branch ที่เราสร้างขึ้นแบบ force โดยไม่สนใจว่ามีการเปลี่ยนแปลงที่ยังไม่ได้ commit หรือไม่ โดย `<branch-name>` คือชื่อของ branch ที่เราต้องการลบ
- ถ้าเราต้องการดูรายการ branch ทั้งหมดที่มีใน repository
```sh
git branch
```
- คำสั่ง `git branch` จะแสดงรายการ branch ทั้งหมดที่มีใน repository โดย branch ที่เราอยู่ในขณะนั้นจะแสดงด้วยเครื่องหมาย `*` ข้างหน้า
- ถ้าเราต้องการดูรายการ remote branch ที่มีใน repository
```sh
git branch -r
```
- คำสั่ง `git branch -r` จะแสดงรายการ remote branch ที่มีใน repository
- ถ้าเราต้องการดูรายการ branch ทั้งหมดที่มีใน repository รวมถึง remote branch
```sh
git branch -a
```
- คำสั่ง `git branch -a` จะแสดงรายการ branch ทั้งหมดที่มีใน repository รวมถึง remote branch
- ถ้าเราต้องการดึงข้อมูลจาก remote repository
```sh
git fetch
```
- คำสั่ง `git fetch` จะดึงข้อมูลจาก remote repository มายัง local repository ของเรา แต่จะไม่ทำการ merge หรือเปลี่ยนแปลงอะไรใน branch ปัจจุบัน
- ถ้าเราต้องการดึงข้อมูลจาก remote repository และทำการ merge กับ branch ปัจจุบัน
```sh
git pull
```
- คำสั่ง `git pull` จะดึงข้อมูลจาก remote repository มายัง local repository ของเรา และทำการ merge กับ branch ปัจจุบัน
- ถ้าเราต้องการส่งข้อมูลจาก local repository ไปยัง remote repository
```sh
git push
```
- คำสั่ง `git push` จะส่งข้อมูลจาก local repository ไปยัง remote repository
- ถ้าเราต้องการส่งข้อมูลจาก local repository ไปยัง remote repository ใน branch ที่เราสร้างขึ้น
```sh
git push origin <branch-name>
```
- คำสั่ง `git push origin <branch-name>` จะส่งข้อมูลจาก local repository ไปยัง remote repository ใน branch ที่เราสร้างขึ้น โดย `<branch-name>` คือชื่อของ branch ที่เราต้องการส่งข้อมูลไป
