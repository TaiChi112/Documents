# Balanced Actor Positioning in Use Case Diagrams

PlantUML สามารถกำหนดให้ actor อยู่ทั้งฝั่งซ้ายและขวาของแผนภาพได้ เพื่อให้เกิดความสมดุลทางการออกแบบ มีหลายวิธีในการทำเช่นนี้:

## Example 1: Using left/right keywords

```plantuml
@startuml "Balanced Actors Example"
left to right direction
skinparam packageStyle rectangle

' Left-side actors
actor "Student" as Student
actor "Teacher" as Teacher

' Right-side actors
actor "Administrator" as Admin
actor "System" as System

rectangle "School Management System" {
  usecase "Register for Course" as UC1
  usecase "Assign Grades" as UC2
  usecase "Manage Users" as UC3
  usecase "Generate Reports" as UC4
}

' Left-side connections
Student --> UC1
Teacher --> UC2

' Right-side connections
UC3 <-- Admin
UC4 <-- System

@enduml
```

## Example 2: Explicit actor positioning

```plantuml
@startuml "Hospital Information System"
left to right direction

' Left-side actors
actor "Patient" as Patient
actor "Doctor" as Doctor
actor "Nurse" as Nurse

' Right-side actors
actor "Administrator" as Admin
actor "Insurance Company" as Insurance
actor "Pharmacy" as Pharmacy

rectangle "Hospital Information System" {
  usecase "Schedule Appointment" as UC1
  usecase "Examine Patient" as UC2
  usecase "Administer Treatment" as UC3
  usecase "Manage Patient Records" as UC4
  usecase "Process Insurance Claims" as UC5
  usecase "Fill Prescription" as UC6
}

' Left-side connections
Patient --> UC1
Doctor --> UC2
Doctor --> UC4
Nurse --> UC3

' Right-side connections
UC4 <-- Admin
UC5 <-- Insurance
UC6 <-- Pharmacy
@enduml
```

## Example 3: Using "left" and "right" in actor definition

```plantuml
@startuml "E-Commerce System"
skinparam actorStyle awesome

' Left-side actors with explicit positioning
left to right direction
:Customer: as Customer
:Guest User: as Guest

rectangle "E-Commerce System" {
  usecase "Browse Products" as UC1
  usecase "Place Order" as UC2
  usecase "Make Payment" as UC3
  usecase "Process Orders" as UC4
  usecase "Manage Inventory" as UC5
  usecase "Generate Reports" as UC6
}

' Right-side actors with explicit positioning
:Seller: as Seller
:Administrator: as Admin
:Shipping Company: as Shipping

' Connections from left actors
Customer --> UC1
Customer --> UC2
Customer --> UC3
Guest --> UC1

' Connections to right actors
UC4 <-- Seller
UC5 <-- Seller
UC5 <-- Admin
UC6 <-- Admin
UC4 <-- Shipping
@enduml
```

## Example 4: Complex system with balanced actors

```plantuml
@startuml "Banking System with Balanced Actors"
left to right direction
skinparam actorStyle awesome
skinparam usecaseBackgroundColor AliceBlue
skinparam usecaseBorderColor DarkSlateBlue

' Left-side actors
actor "Customer" as Customer
actor "Teller" as Teller
actor "Loan Officer" as LoanOfficer

' Right-side actors
actor "Bank Manager" as Manager
actor "External Auditor" as Auditor
actor "Credit Bureau" as CreditBureau

rectangle "Banking System" {
  package "Account Management" {
    usecase "Open Account" as UC1
    usecase "Close Account" as UC2
    usecase "Deposit Money" as UC3
    usecase "Withdraw Money" as UC4
  }
  
  package "Loan Processing" {
    usecase "Apply for Loan" as UC5
    usecase "Check Credit Score" as UC6
    usecase "Approve Loan" as UC7
    usecase "Disburse Funds" as UC8
  }
  
  package "Administration" {
    usecase "Generate Reports" as UC9
    usecase "Audit Transactions" as UC10
    usecase "Manage Staff" as UC11
  }
}

' Left-side connections
Customer --> UC1
Customer --> UC2
Customer --> UC3
Customer --> UC4
Customer --> UC5
Teller --> UC1
Teller --> UC3
Teller --> UC4
LoanOfficer --> UC5
LoanOfficer --> UC7
LoanOfficer --> UC8

' Right-side connections
UC9 <-- Manager
UC11 <-- Manager
UC7 <-- Manager
UC10 <-- Auditor
UC6 <-- CreditBureau

' Include/Extend relationships
UC5 ..> UC6 : <<includes>>
UC7 ..> UC8 : <<includes>>

note bottom of UC6 #lightyellow
  Credit check requires external
  verification with Credit Bureau
end note
@enduml
```

## Example 5: Business Process with Balanced Stakeholders

```plantuml
@startuml "Supply Chain Management"
left to right direction
skinparam handwritten true
skinparam actorStyle awesome
skinparam usecaseBorderThickness 1

' Left-side business actors
:Supplier: as Supplier <<Business Actor>>
:Manufacturer: as Manufacturer <<Business Actor>>
:Distribution Center: as Distribution <<Business Actor>>

' Right-side business actors
:Retailer: as Retailer <<Business Actor>>
:End Customer: as EndCustomer <<Business Actor>>
:Logistics Provider: as Logistics <<Business Actor>>

rectangle "Supply Chain Management System" {
  usecase "Submit Order" as UC1
  usecase "Process Materials" as UC2
  usecase "Manufacture Products" as UC3
  usecase "Distribute to Centers" as UC4
  usecase "Deliver to Stores" as UC5
  usecase "Sell to Customer" as UC6
  usecase "Track Shipments" as UC7
}

' Left-side connections
Supplier --> UC1
Manufacturer --> UC2
Manufacturer --> UC3
Distribution --> UC4

' Right-side connections
UC5 <-- Retailer
UC6 <-- Retailer
UC6 <-- EndCustomer
UC7 <-- Logistics
UC4 <-- Logistics
UC5 <-- Logistics

' Workflow arrows showing process flow
UC1 -[#blue,dashed]-> UC2
UC2 -[#blue,dashed]-> UC3
UC3 -[#blue,dashed]-> UC4
UC4 -[#blue,dashed]-> UC5
UC5 -[#blue,dashed]-> UC6
@enduml
```

## ข้อแนะนำในการจัดวาง Actors ให้สมดุล

1. **ใช้ทิศทางความสัมพันธ์ที่ถูกต้อง**:
   - ใช้ `-->` สำหรับเชื่อมจาก actor ฝั่งซ้ายไปยัง use case
   - ใช้ `<--` สำหรับเชื่อมจาก use case ไปยัง actor ฝั่งขวา

2. **ใช้การจัดกลุ่ม actors ตามหน้าที่**:
   - ฝั่งซ้าย: มักใช้สำหรับ primary actors หรือ actors ที่เริ่มต้นใช้ระบบ
   - ฝั่งขวา: มักใช้สำหรับ secondary actors หรือ supporting actors

3. **ควรกำหนด** `left to right direction` เพื่อให้แผนภาพมีทิศทางที่ชัดเจน

4. **ระวังเรื่องการใช้สี** เพื่อให้แผนภาพอ่านง่ายเมื่อมี actors ทั้งสองฝั่ง