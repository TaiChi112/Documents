## Git Commands Docs Generate by Github Copilot 

[README.md](../README.md)

- ถ้าเราต้องการลบไฟล์จาก repository
```sh
git rm <file-name>
```
- คำสั่ง `git rm <file-name>` จะลบไฟล์ที่ชื่อว่า `<file-name>` ออกจาก repository และ staging area
- ถ้าเราต้องการลบไฟล์จาก repository แต่ไม่ต้องการลบไฟล์จากเครื่อง
```sh
git rm --cached <file-name>
```
- คำสั่ง `git rm --cached <file-name>` จะลบไฟล์ที่ชื่อว่า `<file-name>` ออกจาก repository และ staging area แต่จะไม่ลบไฟล์จากเครื่องของเรา
- ถ้าเราต้องการยกเลิกการเปลี่ยนแปลงที่ยังไม่ได้ commit
```sh
git checkout -- <file-name>
```
- คำสั่ง `git checkout -- <file-name>` จะยกเลิกการเปลี่ยนแปลงที่ยังไม่ได้ commit ในไฟล์ที่ชื่อว่า `<file-name>` และคืนค่าไฟล์นั้นกลับไปยังสถานะก่อนหน้า
- ถ้าเราต้องการยกเลิกการเปลี่ยนแปลงทั้งหมดที่ยังไม่ได้ commit
```sh
git checkout -- .
```
- คำสั่ง `git checkout -- .` จะยกเลิกการเปลี่ยนแปลงทั้งหมดที่ยังไม่ได้ commit ใน repository และคืนค่าไฟล์ทั้งหมดกลับไปยังสถานะก่อนหน้า
- ถ้าเราต้องการยกเลิกการ commit ล่าสุด
```sh
git reset --soft HEAD~1
```
- คำสั่ง `git reset --soft HEAD~1` จะยกเลิกการ commit ล่าสุด แต่จะเก็บการเปลี่ยนแปลงไว้ใน staging area
- ถ้าเราต้องการยกเลิกการ commit ล่าสุด และลบการเปลี่ยนแปลงทั้งหมด
```sh
git reset --hard HEAD~1
```
- คำสั่ง `git reset --hard HEAD~1` จะยกเลิกการ commit ล่าสุด และลบการเปลี่ยนแปลงทั้งหมดใน working directory
- ถ้าเราต้องการเปลี่ยนข้อความ commit ล่าสุด
```sh
git commit --amend -m "New commit message"
```
- คำสั่ง `git commit --amend -m "New commit message"` จะเปลี่ยนข้อความของ commit ล่าสุดเป็น `"New commit message"` โดยไม่ต้องสร้าง commit ใหม่
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์
```sh
git diff
```
- คำสั่ง `git diff` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ที่ยังไม่ได้ commit
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit สองตัว
```sh
git diff <commit-hash-1> <commit-hash-2>
```
- คำสั่ง `git diff <commit-hash-1> <commit-hash-2>` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit สองตัว โดย `<commit-hash-1>` และ `<commit-hash-2>` คือ hash ของ commit ที่เราต้องการเปรียบเทียบ
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory
```sh
git diff HEAD
```
- คำสั่ง `git diff HEAD` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ staging area
```sh
git diff --cached
```
- คำสั่ง `git diff --cached` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ staging area
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area
```sh
git diff HEAD --cached
```
- คำสั่ง `git diff HEAD --cached` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ
```sh
git diff HEAD --cached --ignore-all-space
```
- คำสั่ง `git diff HEAD --cached --ignore-all-space` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากการเว้นวรรค
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากการเว้นวรรค
```sh
git diff HEAD --cached --ignore-space-at-eol
```
- คำสั่ง `git diff HEAD --cached --ignore-space-at-eol` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด
```sh
git diff HEAD --cached --ignore-space-change
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ
```sh
git diff HEAD --cached --ignore-blank-lines
```
- คำสั่ง `git diff HEAD --cached --ignore-blank-lines` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากบรรทัดว่าง
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากบรรทัดว่าง
```sh
git diff HEAD --cached --ignore-cr-at-eol
```
- คำสั่ง `git diff HEAD --cached --ignore-cr-at-eol` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบและการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ และบรรทัดว่าง
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ และบรรทัดว่าง
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง และการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง และการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด และการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด และการเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด และการเปลี่ยนแปลงใน submodules
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด และการเปลี่ยนแปลงใน submodules
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules และการเปลี่ยนแปลงโหมดไฟล์
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules และการเปลี่ยนแปลงโหมดไฟล์
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ และการเปลี่ยนแปลง CRLF
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ และการเปลี่ยนแปลง CRLF
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF และการเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF และการเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ และการเปลี่ยนแปลงการกำหนดค่า submodule
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ และการเปลี่ยนแปลงการกำหนดค่า submodule
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule และการละเว้น submodule
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule และการละเว้น submodule
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule และการละเว้น submodule ที่ไม่ติดตาม
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule และการละเว้น submodule ที่ไม่ติดตาม
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม และการละเว้น submodule ที่ยังไม่ได้ commit
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม และการละเว้น submodule ที่ยังไม่ได้ commit
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit และการละเว้นไฟล์ที่ไม่ติดตามใน submodule
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit และการละเว้นไฟล์ที่ไม่ติดตามใน submodule
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files --ignore-submodule-uncommitted-files
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files --ignore-submodule-uncommitted-files` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit การละเว้นไฟล์ที่ไม่ติดตามใน submodule และการละเว้นไฟล์ที่ยังไม่ได้ commit ใน submodule
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit การละเว้นไฟล์ที่ไม่ติดตามใน submodule และการละเว้นไฟล์ที่ยังไม่ได้ commit ใน submodule
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files --ignore-submodule-uncommitted-files --ignore-submodule-untracked-files-in-index
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files --ignore-submodule-uncommitted-files --ignore-submodule-untracked-files-in-index` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit การละเว้นไฟล์ที่ไม่ติดตามใน submodule การละเว้นไฟล์ที่ยังไม่ได้ commit ใน submodule และการละเว้นไฟล์ที่ไม่ติดตามใน index ของ submodule
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit การละเว้นไฟล์ที่ไม่ติดตามใน submodule การละเว้นไฟล์ที่ยังไม่ได้ commit ใน submodule และการละเว้นไฟล์ที่ไม่ติดตามใน index ของ submodule
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files --ignore-submodule-uncommitted-files --ignore-submodule-untracked-files-in-index --ignore-submodule-uncommitted-files-in-index
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files --ignore-submodule-uncommitted-files --ignore-submodule-untracked-files-in-index --ignore-submodule-uncommitted-files-in-index` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit การละเว้นไฟล์ที่ไม่ติดตามใน submodule การละเว้นไฟล์ที่ยังไม่ได้ commit ใน submodule การละเว้นไฟล์ที่ไม่ติดตามใน index ของ submodule และการละเว้นไฟล์ที่ยังไม่ได้ commit ใน index ของ submodule
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit การละเว้นไฟล์ที่ไม่ติดตามใน submodule การละเว้นไฟล์ที่ยังไม่ได้ commit ใน submodule การละเว้นไฟล์ที่ไม่ติดตามใน index ของ submodule และการละเว้นไฟล์ที่ยังไม่ได้ commit ใน index ของ submodule
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files --ignore-submodule-uncommitted-files --ignore-submodule-untracked-files-in-index --ignore-submodule-uncommitted-files-in-index --ignore-submodule-untracked-files-in-worktree
```
- คำสั่ง `git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files --ignore-submodule-uncommitted-files --ignore-submodule-untracked-files-in-index --ignore-submodule-uncommitted-files-in-index --ignore-submodule-untracked-files-in-worktree` จะแสดงการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit การละเว้นไฟล์ที่ไม่ติดตามใน submodule การละเว้นไฟล์ที่ยังไม่ได้ commit ใน submodule การละเว้นไฟล์ที่ไม่ติดตามใน index ของ submodule การละเว้นไฟล์ที่ยังไม่ได้ commit ใน index ของ submodule และการละเว้นไฟล์ที่ไม่ติดตามใน worktree ของ submodule
- ถ้าเราต้องการดูการเปลี่ยนแปลงที่เกิดขึ้นในไฟล์ระหว่าง commit ล่าสุดกับ working directory และ staging area โดยไม่สนใจไฟล์ที่ถูกลบ การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ไม่สำคัญ บรรทัดว่าง การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคที่ท้ายบรรทัด การเปลี่ยนแปลงที่เกิดจากการเว้นวรรคทั้งหมด การเปลี่ยนแปลงใน submodules การเปลี่ยนแปลงโหมดไฟล์ การเปลี่ยนแปลง CRLF การเปลี่ยนแปลงตัวพิมพ์เล็ก/ใหญ่ การเปลี่ยนแปลงการกำหนดค่า submodule การละเว้น submodule การละเว้น submodule ที่ไม่ติดตาม การละเว้น submodule ที่ยังไม่ได้ commit การละเว้นไฟล์ที่ไม่ติดตามใน submodule การละเว้นไฟล์ที่ยังไม่ได้ commit ใน submodule การละเว้นไฟล์ที่ไม่ติดตามใน index ของ submodule การละเว้นไฟล์ที่ยังไม่ได้ commit ใน index ของ submodule และการละเว้นไฟล์ที่ไม่ติดตามใน worktree ของ submodule
```sh
git diff HEAD --cached --ignore-space-change --ignore-blank-lines --ignore-cr-at-eol --ignore-all-space --ignore-submodules --ignore-file-mode --ignore-crlf --ignore-case --ignore-submodule-configuration --ignore-submodule-ignore --ignore-submodule-untracked --ignore-submodule-uncommitted --ignore-submodule-untracked-files --ignore-submodule-uncommitted-files --ignore-submodule-untracked-files-in-index --ignore-submodule-uncommitted-files-in-index --ignore-submodule-untracked-files-in-worktree --ignore-submodule-uncommitted-files-in-worktree
```