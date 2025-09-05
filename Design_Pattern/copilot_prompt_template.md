---
# CPT: Copilot Prompt Template (v2 - Task Launcher)
> **โหมดการทำงาน**: เมื่อประมวลผลเอกสารนี้ ให้ทำตามขั้นตอนใน **Workflow** ด้านล่างเพื่อเริ่มงานอัตโนมัติ

---

## 1) Goal
เป้าหมายของเทมเพลตนี้คือการเป็น **"ตัวสั่งงาน" (Task Launcher)** กลางสำหรับ GitHub Copilot โดยการรวม **"ชุดคำสั่งหลัก" (Master Prompt)** ที่ระบุไว้ เข้ากับ **"ข้อมูลสำหรับงาน" (Task Inputs)** เพื่อสั่งให้ AI ทำงานที่ซับซ้อนโดยอัตโนมัติ เช่น การสร้าง Design Pattern, การทำ Refactor โค้ด, หรือการสร้างเอกสาร

---

## 2) Task Inputs (YAML Configuration)
> **คำแนะนำ:** แก้ไขค่าในบล็อก `yaml` ด้านล่างเพื่อกำหนดงานที่ต้องการให้ AI ทำ

```yaml
# ~~~ EDIT THIS BLOCK ~~~

# 1. ระบุ "ชุดคำสั่งหลัก" ที่จะใช้เป็นแม่แบบ
master_prompt_file: "docs/prompts/prp.v1.md"

# 2. กำหนด "ข้อมูล" ที่จะส่งให้ชุดคำสั่งหลักนำไปใช้งาน
#    (โครงสร้างของ inputs นี้ต้องสอดคล้องกับที่ master_prompt_file ต้องการ)
inputs:
  pattern_name: "Strategy"
  language: "TypeScript"
  domain_use_case: "ImageCompression with PNG/JPEG/WebP at runtime"
  variations:
    - "PNGStrategy"
    - "JPEGStrategy"
    - "WebPStrategy"
  rules:
    - "Context must allow hot-swapping strategies at runtime"
    - "Prefer async methods in TS"
    - "Follow SOLID and clean naming"
  add_sequence: true
  generate_code: true
  create_readme: true
  output_dir:
    docs: "docs/diagrams"
    code: "src/patterns"
    rationale: "docs/rationales"
    tests: "tests/smoke"
  file_prefix: "{{pattern_name}}"
  package_namespace: "com.example.patterns"

# ~~~ END EDIT ~~~
```

---

## 3) Workflow (ขั้นตอนการทำงานของ AI Agent)
**นี่คือคำสั่งสำหรับ Copilot Agent:** เมื่อผู้ใช้สั่งให้คุณทำงานจากเทมเพลตนี้ ให้ทำตามขั้นตอนต่อไปนี้อย่างเคร่งครัด:

1.  **Parse Inputs**: อ่านและแยกวิเคราะห์เนื้อหาในบล็อก `Task Inputs (YAML Configuration)` ด้านบน
    *   `master_prompt_file`: คือไฟล์ที่เก็บชุดคำสั่งหลัก
    *   `inputs`: คือข้อมูลที่จะใช้กับคำสั่งนั้น

2.  **Load Master Prompt**: อ่านเนื้อหาทั้งหมดของไฟล์ที่ระบุใน `master_prompt_file` (เช่น `docs/prompts/prp.v1.md`) เพื่อใช้เป็น **"Context"** หรือชุดคำสั่งในการทำงาน

3.  **Execute Task**: ปฏิบัติตามคำสั่งจาก **Master Prompt** ที่โหลดมาในขั้นตอนที่ 2 โดยใช้ข้อมูลจาก `inputs` เป็นพารามิเตอร์ในการทำงานทั้งหมด

4.  **Silent/Interactive Mode**: ทำตามโหมดการทำงาน (เช่น Silent Mode หรือ Interactive Mode) ที่กำหนดไว้ใน **Master Prompt**

**ตัวอย่าง:** หากผู้ใช้สั่ง "รัน task ตามเทมเพลตนี้" คุณจะต้อง:
- อ่านไฟล์นี้และรู้ว่าต้องใช้ `docs/prompts/prp.v1.md` เป็นชุดคำสั่ง
- นำค่า `pattern_name: "Strategy"`, `language: "TypeScript"` และอื่นๆ ไปใช้กับคำสั่งใน `prp.v1.md`
- เริ่มสร้างไฟล์ไดอะแกรม, โค้ด, และเอกสารต่างๆ ตามที่ `prp.v1.md` กำหนดไว้ โดยไม่ตอบกลับในแชต (เพราะเป็น Silent Mode)

---

## 4) How to Use (สำหรับผู้ใช้)
1.  **แก้ไข** บล็อก `Task Inputs` ด้านบน
    *   เปลี่ยน `master_prompt_file` หากต้องการใช้ชุดคำสั่งอื่น
    *   ปรับ `inputs` ให้ตรงกับงานที่ต้องการทำ (เช่น เปลี่ยน `pattern_name` เป็น "Observer" หรือ "Factory Method")
2.  **สั่ง Copilot** ด้วยประโยคง่ายๆ เช่น:
    *   "ช่วยรัน task ตามเทมเพลตนี้ให้หน่อย"
    *   "Execute the task from this template."
3.  **Copilot** จะเริ่มทำงานตาม Workflow ที่กำหนดไว้โดยอัตโนมัติ

---
