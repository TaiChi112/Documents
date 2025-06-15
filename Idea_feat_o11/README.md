### Problem
- ปัจจุบันเวลา customer จะมาจ้าง developer สร้าง Website หรือ Web Application ลูกค้าก็ยังไม่รู้ว่า website ที่ตัวเองให้ requirement มานั้นจะได้ website ออกมาเป็นอย่างไร จนกว่าผู้ถูกจ้างจะ design เสร็จ

- เเต่ถ้าเรามี website ที่สามารถให้ลูกค้าเห็นภาพ virtual website ที่ใกล้เคียงกับ website ที่ตัวเองต้องการได้ตาม requirement ที่ให้มาจะเป็นอย่างไร

- ปัจจุบันมี website หลายประเภทที่ลูกค้าต้องการ เช่น E-commerce, Blog, Portfolio, Business, Personal Website เป็นต้น

- ฉันจะสร้าง website ที่ให้ customer สามารถเลือกประเภทของ website ที่ต้องการได้ และสามารถใส่ requirement ของตัวเองได้ เเละเลือก component, template, theme, color, font, layout, etc. ที่ต้องการได้ ซึ่งในส่วนของ design เหล่านี้ก็จะมาจาก User UX UI ที่มีอยู่แล้วในตลาด 

- โดยจะมี state ประมาณนี้
  - Customer เลือกประเภทของ website ที่ต้องการ
  - Customer ใส่ requirement ของตัวเอง
  - Customer เลือก component, template, theme, color, font, layout, etc. ที่ต้องการได้
  - Customer สามารถ preview website ที่ใกล้เคียงกับ requirement ที่ให้มาได้
  
- ซึ่ง design ต่างๆ ที่ customer เลือกนั้นจะมีทั้ง free และ paid โดยที่ free จะมีจำนวนจำกัด และ paid จะมีให้เลือกหลายราคา ขึ้นอยู่กับความซับซ้อนของ design ที่ customer ต้องการ เเละเจ้าของ design ซึ่งราคานั้นจะขึ้นอยู่กับการประมูลของเจ้าของ design เองด้วย
- โดยที่ customer จะสามารถเลือกได้ว่าจะใช้ design ฟรี หรือ design ที่ต้องการจ่ายเงินเพื่อซื้อ


### Solution
- สร้าง website ที่ให้ customer สามารถเลือกประเภทของ website ที่ต้องการได้
- ให้ customer สามารถใส่ requirement ของตัวเองได้
- ให้ customer สามารถเลือก component, template, theme, color, font, layout, etc. ที่ต้องการได้
- ใช้ User UX UI ที่มีอยู่แล้วในตลาดในการออกแบบ
- ให้ customer สามารถ preview website ที่ใกล้เคียงกับ requirement ที่ให้มาได้
- ให้ customer สามารถเลือกได้ว่าจะใช้ design ฟรี หรือ design ที่ต้องการจ่ายเงินเพื่อซื้อ
- ให้ customer สามารถเลือก design ที่ต้องการได้จากการประมูลของเจ้าของ design เอง

### Tech Stack
- Frontend: React.js, Next.js, Tailwind CSS
- Backend: Node.js, Express.js
- Database: MongoDB
- Authentication: JWT, OAuth
- Deployment: Vercel, Heroku

### Features
- User Authentication (Sign Up, Login, Logout)
- User Roles (Customer, Designer)
- Website Type Selection
- Requirement Input
- Component, Template, Theme, Color, Font, Layout Selection
- Design Preview
- Free and Paid Design Options
- Design Auction System
- Admin Dashboard for managing designs and users