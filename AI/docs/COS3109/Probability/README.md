| Cookies  | Semester | P(t,w) |
| -------- | -------- | ------ |
| in_stock | fall     | 0.10   |
| in_stock | spring   | 0.20   |
| in_stock | summer   | 0.30   |
| sold_out | fall     | 0.25   |
| sold_out | spring   | 0.10   |
| sold_out | summer   | 0.05   |

## วิธีการแก้ปัญหา

### 1. Marginalization table (ตารางความน่าจะเป็นชายขอบ)

ในการหาค่า Marginalization เราต้องรวมความน่าจะเป็นของตัวแปรหนึ่งโดยรวมทุกค่าที่เป็นไปได้ของอีกตัวแปรหนึ่ง

#### Marginalization สำหรับ P(t) - ความน่าจะเป็นของสถานะคุกกี้:
- P(in_stock) = P(in_stock, fall) + P(in_stock, spring) + P(in_stock, summer) = 0.10 + 0.20 + 0.30 = 0.60
- P(sold_out) = P(sold_out, fall) + P(sold_out, spring) + P(sold_out, summer) = 0.25 + 0.10 + 0.05 = 0.40

#### Marginalization สำหรับ P(w) - ความน่าจะเป็นของภาคเรียน:
- P(fall) = P(in_stock, fall) + P(sold_out, fall) = 0.10 + 0.25 = 0.35
- P(spring) = P(in_stock, spring) + P(sold_out, spring) = 0.20 + 0.10 = 0.30
- P(summer) = P(in_stock, summer) + P(sold_out, summer) = 0.30 + 0.05 = 0.35

#### ตาราง Marginalization:

| Cookies  | P(t) |
| -------- | ---- |
| in_stock | 0.60 |
| sold_out | 0.40 |

| Semester | P(w) |
| -------- | ---- |
| fall     | 0.35 |
| spring   | 0.30 |
| summer   | 0.35 |

### 2. P(sold_out|fall) - ความน่าจะเป็นที่คุกกี้หมดเมื่อเป็นภาคฤดูใบไม้ร่วง

ความน่าจะเป็นแบบมีเงื่อนไขคำนวณจากสูตร: P(A|B) = P(A,B) / P(B)

P(sold_out|fall) = P(sold_out, fall) / P(fall) = 0.25 / 0.35 = 0.714 หรือประมาณ 0.71

### 3. P(spring) - ความน่าจะเป็นที่เป็นภาคฤดูใบไม้ผลิ

จากการคำนวณ Marginalization ข้างต้น:
P(spring) = 0.30

### 4. Normalization table - ตารางที่ปรับให้เป็นบรรทัดฐาน

ตารางความน่าจะเป็นแบบมีเงื่อนไข P(t|w):

| Cookies  | Semester | P(t pipeline w) = P(t,w) / P(w) |
| -------- | -------- | ------------------------------- |
| in_stock | fall     | 0.10 / 0.35 = 0.286             |
| in_stock | spring   | 0.20 / 0.30 = 0.667             |
| in_stock | summer   | 0.30 / 0.35 = 0.857             |
| sold_out | fall     | 0.25 / 0.35 = 0.714             |
| sold_out | spring   | 0.10 / 0.30 = 0.333             |
| sold_out | summer   | 0.05 / 0.35 = 0.143             |

ตารางความน่าจะเป็นแบบมีเงื่อนไข P(w|t):

| Cookies  | Semester | P(w pipeline t) = P(t,w) / P(t) |
| -------- | -------- | ------------------------------- |
| in_stock | fall     | 0.10 / 0.60 = 0.167             |
| in_stock | spring   | 0.20 / 0.60 = 0.333             |
| in_stock | summer   | 0.30 / 0.60 = 0.500             |
| sold_out | fall     | 0.25 / 0.40 = 0.625             |
| sold_out | spring   | 0.10 / 0.40 = 0.250             |
| sold_out | summer   | 0.05 / 0.40 = 0.125             |

### สรุป

- ความน่าจะเป็นที่คุกกี้จะหมดในภาคฤดูใบไม้ร่วง P(sold_out|fall) = 0.714 หรือ 71.4%
- ความน่าจะเป็นที่จะเป็นภาคฤดูใบไม้ผลิ P(spring) = 0.30 หรือ 30%