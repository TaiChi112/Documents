# PlantUML Styling Options: การเปรียบเทียบ syntax รูปแบบเก่าและใหม่

## การเปลี่ยนแปลง Syntax ใน PlantUML

PlantUML มีการอัปเดตวิธีการกำหนดรูปแบบและตัวเลือกต่างๆ จากรูปแบบเดิมที่ใช้ `skinparam` ไปสู่รูปแบบใหม่ที่ใช้ `!option` สำหรับหลายการตั้งค่า นี่เป็นส่วนหนึ่งของการพัฒนา PlantUML ให้มีความสอดคล้องและง่ายต่อการใช้งานมากขึ้น

## ตัวอย่างการเปลี่ยนแปลง Syntax

| รูปแบบเก่า | รูปแบบใหม่ | คำอธิบาย |
|------------|------------|----------|
| `skinparam handwritten true` | `!option handwritten true` | กำหนดรูปแบบการวาดให้ดูเหมือนเขียนด้วยมือ |
| `skinparam monochrome true` | `!option monochrome true` | กำหนดให้แผนภาพเป็นขาวดำ |
| `skinparam shadowing true` | `!option shadowing true` | เพิ่มเงาให้องค์ประกอบในแผนภาพ |
| `skinparam linetype ortho` | `!option linetype ortho` | กำหนดรูปแบบเส้นให้เป็นเส้นตรงแบบตั้งฉากกัน |

## ทำไมต้องเปลี่ยน Syntax?

การเปลี่ยนแปลงนี้มีวัตถุประสงค์เพื่อ:

1. **ความสอดคล้อง**: ทำให้ syntax มีรูปแบบที่สอดคล้องกันในการกำหนดตัวเลือกระดับโกลบอลของแผนภาพ
2. **ความชัดเจน**: แยกความแตกต่างระหว่างการตั้งค่าทั้งแผนภาพ (`!option`) กับการตั้งค่าเฉพาะประเภทขององค์ประกอบ (`skinparam`)
3. **การพัฒนาในอนาคต**: รองรับฟีเจอร์และตัวเลือกใหม่ๆ ที่จะเพิ่มเข้ามาในอนาคต

## ความแตกต่างระหว่าง `!option` และ `skinparam`

แม้ว่าบางตัวเลือกจะเปลี่ยนจาก `skinparam` ไปเป็น `!option` แต่ `skinparam` ยังคงมีบทบาทสำคัญใน PlantUML:

- **`!option`**: ใช้สำหรับการตั้งค่าระดับโกลบอลที่มีผลกับทั้งแผนภาพ เช่น รูปแบบการวาด (handwritten), โทนสี (monochrome)
- **`skinparam`**: ยังคงใช้สำหรับการตั้งค่าเฉพาะประเภทขององค์ประกอบ เช่น skinparam usecase, skinparam actor, skinparam class

## ตัวอย่างการใช้งานทั้งสองรูปแบบร่วมกัน

```plantuml
@startuml
' การตั้งค่าโกลบอลด้วย !option
!option handwritten true
!option shadowing false

' การตั้งค่าเฉพาะประเภทด้วย skinparam
skinparam usecase {
  BackgroundColor lightblue
  BorderColor navy
  FontSize 12
}

skinparam actorStyle awesome

actor User
usecase "Login" as UC1
User --> UC1
@enduml
```

## คำแนะนำการใช้งาน

1. **อัปเดต Syntax เดิม**: ค่อยๆ ปรับปรุงโค้ด PlantUML ที่มีอยู่ให้ใช้ syntax ใหม่
2. **ใช้ Syntax ใหม่สำหรับโค้ดใหม่**: สำหรับแผนภาพที่เขียนใหม่ ควรใช้ `!option` แทน `skinparam` สำหรับการตั้งค่าที่มี syntax ใหม่
3. **ความเข้ากันได้**: PlantUML ยังคงสนับสนุน syntax แบบเก่าเพื่อความเข้ากันได้ย้อนหลัง แต่อาจมีคำเตือนเพื่อแนะนำให้เปลี่ยนไปใช้แบบใหม่

## เครื่องมือการสไตล์อื่นๆ ใน PlantUML

นอกจาก `!option` และ `skinparam` แล้ว PlantUML ยังมีเครื่องมือการปรับแต่งสไตล์อื่นๆ ที่น่าสนใจ:

- **`!theme`**: ใช้ธีมที่กำหนดไว้ล่วงหน้า เช่น `!theme cerulean`
- **`!include`**: รวมไฟล์สไตล์จากภายนอก เช่น `!include theme.puml`
- **`<style>`**: กำหนดสไตล์แบบ CSS เช่น:

```plantuml
<style>
  usecase {
    BackgroundColor lightblue
    BorderColor navy
  }
  
  actor {
    BackgroundColor lightyellow
  }
</style>
```

## สรุป

การเปลี่ยนแปลงจาก `skinparam handwritten true` เป็น `!option handwritten true` เป็นส่วนหนึ่งของการพัฒนา PlantUML ให้ดีขึ้น ผู้ใช้ควรปรับปรุงโค้ดให้ใช้ syntax ใหม่เมื่อเป็นไปได้ เพื่อความเข้ากันได้กับเวอร์ชันในอนาคตและเพื่อหลีกเลี่ยงคำเตือน แต่ยังสามารถใช้ syntax แบบเก่าได้เพื่อความเข้ากันได้ย้อนหลัง