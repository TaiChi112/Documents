**1.1 พื้นฐานการทดสอบซอฟต์แวร์ (Software Testing Fundamentals)**

- แนวคิดหลัก: defect vs failure, test level (Unit/Integration/System/Acceptance), test type (Functional/Non-functional), test oracle, testability, shift-left
- หลักการ: ทดสอบแสดง “การมีบั๊ก” ไม่ใช่พิสูจน์ว่า “ไม่มีบั๊ก”, จัดลำดับความเสี่ยง (risk-based)
- ข้อดี: จัดระเบียบคุณภาพ, วัดความคืบหน้าด้วย test coverage/defect trend
- ข้อจำกัด: ทดสอบทั้งหมดไม่ได้, คุณภาพ test ขึ้นกับ oracle/ข้อมูลทดสอบ
- Applied: ตั้ง Definition of Done: มี unit test ≥ 80%, critical path integration test ครบ, acceptance criteria ผ่าน
- Testing (ตัวอย่างสั้น): ฟังก์ชัน sum(a,b) → กำหนด equivalence classes: (int,int), (float,float), (overflow) + oracle = คาดผลรวมถูกต้อง

**1.2 การทดสอบกล่องขาว (White-box Testing)**

- เทคนิค: Statement/Line Coverage, Branch/Decision Coverage, Condition & MC/DC, Path Coverage
- ข้อดี: ตรวจตรา logic ภายใน, จับ dead code/เส้นทางขาด
- ข้อจำกัด: เส้นทางเป็นไปได้จำนวนมาก, ผูกกับโค้ด (เปลี่ยนโค้ด ต้องอัปเดต test)
- Basic: ตรวจทุก if/else ถูกเข้าถึง
- Applied: ฟังก์ชันคำนวณค่าส่ง (shippingCost(weight, zone)) → ออกชุดทดสอบให้ทุกสาขา (zone A/B/C และเงื่อนไขน้ำหนัก)
- Testing: แสดงรายงาน coverage จากเครื่องมือ (เช่น pytest-cov / JUnit + JaCoCo) พร้อมไฟล์ที่ต่ำกว่าค่าเป้าหมาย

**1.3 การทดสอบเส้นทางมูลฐาน (Basis Path Testing)**

- แนวคิด: ใช้ Cyclomatic Complexity V(G) = E − N + 2P เพื่อกำหนด ชุดเส้นทางอิสระขั้นต่ำ ที่ต้องทดสอบ
- ขั้นตอน: (1) สร้าง CFG (Control Flow Graph) (2) คำนวณ V(G) (3) สร้าง test paths ตามจำนวน V(G)
- ข้อดี: ได้ชุดทดสอบขั้นต่ำที่ครอบคลุมโครงสร้างการควบคุมหลัก
- ข้อจำกัด: สเกลใหญ่สร้าง CFG ยาก, ไม่ครอบคลุม data combos ทั้งหมด
- Applied (เทคนิค): ถ้ามี if 2 ชั้น + while 1 ตัว อาจได้ V(G)=3 → เตรียม test ไม่น้อยกว่า 3 เคสตามเส้นทางอิสระ
- Testing: แนบ CFG อย่างย่อ + ตาราง path → test case mapping

**1.4 การทดสอบโครงสร้างควบคุม (Control Structure Testing)**

- ประเภทหลัก:
    - Condition Testing: ค่าบูลีนย่อย (เช่น A && (B || C)) ต้องถูกกระตุ้นให้ true/false ครบ
    - Data Flow Testing: ครอบคลุมเส้นทาง definition-use (du) ของตัวแปร ป้องกันใช้ก่อนกำหนด/ใช้หลังพ้นสcope
    - Loop Testing: ทดสอบ 0, 1, หลายรอบ, ขอบเขตบน/ล่าง, nested loops
- ข้อดี: เน้นจุดที่ผิดพลาดบ่อย (เงื่อนไข/ลูป/การใช้ตัวแปร)
- ข้อจำกัด: ต้องอ่านโค้ดลึก, ต้องมีความชำนาญออกแบบเคส
- Basic → Testing: วงวน for i in [0..n) → เคส {n=0, n=1, n=2, n=max}

**1.5 การทดสอบกล่องดำ (Black-box Testing)**

- เทคนิคหลัก: Equivalence Partitioning (EP), Boundary Value Analysis (BVA), Decision Table, State Transition, Use-Case Testing
- ข้อดี: ไม่ต้องรู้โค้ด, โฟกัสที่พฤติกรรมตาม requirement
- ข้อจำกัด: อาจพลาด defect เชิงโครงสร้างภายใน
- Basic Example (BVA): ฟิลด์อายุรับค่า 18–60 → ทดสอบ {17, 18, 60, 61}
- Applied: ระบบจองตั๋ว → Decision table ตามกฎราคา (วันธรรมดา/สุดสัปดาห์, สมาชิก/ทั่วไป, โปร/ไม่โปร)

**1.6 วิธีทดสอบเชิงวัตถุ (Object-Oriented Testing Methods)**

- โฟกัส: Class, Method, Attribute, Invariants, Polymorphism, Inheritance, Collaboration
- กลยุทธ์ OO Integration: Thread-based, Use-based, Cluster (class cluster)
- ข้อดี: ตรวจสัญญา (contracts), การ override/overload, ความถูกต้องของความร่วมมือระหว่างออบเจ็กต์
- ข้อจำกัด: การทดสอบพฤติกรรมพลวัต/late binding ซับซ้อน ต้องใช้ mocks/stubs
- Applied: ใช้ contracts (pre/postconditions, class invariants) + unit tests ต่อเมธอด พร้อม mocks สำหรับ dependency

**1.7 การทดสอบ ณ ระดับคลาส (Testing at the Class Level)**

- เป้าหมาย: ความถูกต้องของเมธอด, อินวาเรียนต์ของคลาส, สถานะเริ่มต้น/หลังการเรียก, เอ็กเซปชัน
- เทคนิค: Constructor tests, Getter/Setter with constraints, Method behavior with mocks, Serialization/Equality/HashCode, Property-based tests
- Basic: คลาส BankAccount(balance) → deposit(amount), withdraw(amount)
- Applied → Testing (ตัวอย่างเทคนิค)
- EP/BVA: amount > 0, balance ≥ amount
- Invariant: balance ≥ 0 ตลอดเวลา Test cases: deposit(100), withdraw(50), withdraw(−1) (expect exception), withdraw(very large) (reject)

**1.8 การออกแบบกรณีทดสอบระหว่างคลาส (Inter-Class Test Case Design)**

- โฟกัส: การทำงานร่วมกัน (collaboration) ผ่าน messages/เมธอดข้ามคลาส, ลำดับการเรียก (sequence), โปรโตคอลของออบเจ็กต์
- เทคนิค: ใช้ Sequence Diagram / Communication Diagram สกัด test scenarios, ใช้ mocks/stubs/spies เพื่อตรวจ interaction (เช่น “ต้องเรียก Wallet.debit() ก่อน Order.confirm() เสมอ”)
- ข้อดี: จับบั๊ก integration ในโดเมน OO ที่ซับซ้อน
- ข้อจำกัด: test เปราะถ้าลำดับข้อความเปลี่ยน, ต้องดูแล test doubles
- Applied → Testing (อย่างย่อ)
    - เคส “สั่งซื้อสำเร็จ”: Cart -> Payment -> Inventory -> Order
    - Assertions: payment approved → reserve stock → create order → send confirmation (ตรวจจำนวนครั้ง/ลำดับการเรียก)