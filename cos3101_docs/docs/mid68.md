- ตัวอย่างการเขียนให้อยู่ใยรูปจุดลอย
  - 186.74 -> 0.18674*10^3
  - 0.00005647 -> 0.5647*10^-4

- ตัวอย่างการ rounding & chopping
  - PI = 3.141592653589793*10^1
    - Rounding to 4 decimal places: 3.1416*10^1
    - Chopping to 4 decimal places: 3.1415*10^1
  
- กำหนดเลขนัยสำคัญ 4 ตำเเหน่ง เเล้วทำการ chopping
  - 72.32451 -> 0.7232*10^2
  
- กำหนดเเลขนัยสำคัญ 4 ตำเเหน่ง เเล้วทำการ rounding
  - 72.91867 -> 0.7292*10^2
  - 18.63421 -> 0.1863*10^2
  
- การวัดความคลาดเคลื่อน Absolute Error
  - Absolute Error = |True Value - Approximate Value|
    - ตัวอย่าง (5/7) + (1/3) กำหนดเลขนัยสำคัญ 5 ตำเเหน่ง ด้วยการ chopping
    - 5/7 = 0.71428*10^0
    - 1/3 = 0.33333*10^0