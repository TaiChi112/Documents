# Use Case Diagram Examples with PlantUML

This document showcases examples of creating Use Case Diagrams with PlantUML, covering various techniques commonly used in design.

## Example 1: Basic Use Case Diagram (with Balanced Actors)

```plantuml
@startuml "Library Management System - Basic"
left to right direction
skinparam packageStyle rectangle

' Left-side actor
actor "Library User" as User

rectangle "Library Management System" {
  usecase "Search Books" as UC1
  usecase "Borrow Books" as UC2
  usecase "Return Books" as UC3
  usecase "Pay Fines" as UC4
  usecase "Add New Books" as UC5
  usecase "Manage Members" as UC6
}

' Right-side actor
actor "Librarian" as Librarian

' Left-side connections
User --> UC1
User --> UC2
User --> UC3
User --> UC4

' Right-side connections
UC5 <-- Librarian
UC6 <-- Librarian
UC1 <-- Librarian
@enduml
```

## Example 2: Using Relationships

```plantuml
@startuml "Relationships in Library Management System"
left to right direction
skinparam packageStyle rectangle

actor "Library User" as User
actor "Librarian" as Librarian
actor "System Administrator" as Admin

rectangle "Library Management System" {
  usecase "Search Books" as UC1
  usecase "Borrow Books" as UC2
  usecase "Return Books" as UC3
  usecase "Check Book Status" as UC4
  usecase "Online Book Borrowing" as UC5
  usecase "Print Receipt" as UC6
  usecase "Verify Member Information" as UC7
  usecase "Manage System" as UC8
}

' Extends relationship
UC5 .> UC2 : <<extends>>

' Includes relationship
UC2 .> UC4 : <<includes>>
UC2 .> UC7 : <<includes>>
UC3 .> UC6 : <<includes>>

' Relationship between actors (generalization)
Admin --|> Librarian

' Actor to use cases relationships
User --> UC1
User --> UC2
User --> UC3

Librarian --> UC4
Librarian --> UC7

Admin --> UC8

' Use case inheritance
@enduml
```

## Example 3: Using Stereotypes and Notes

```plantuml
@startuml "Using Stereotypes and Notes"
left to right direction
skinparam packageStyle rectangle

' Define stereotypes for actors
:Library User: as User <<Human>>
:Librarian: as Librarian <<Human>>
:Notification System: as NotificationSystem <<System>>

rectangle "Library Management System" {
  usecase "Search Books" as UC1
  usecase "Borrow Books" as UC2 <<Primary>>
  usecase "Return Books" as UC3 <<Primary>>
  usecase "Send Due Date Reminder" as UC4 <<Secondary>>
}

User --> UC1
User --> UC2
User --> UC3

Librarian --> UC1
Librarian --> UC2
Librarian --> UC3

NotificationSystem --> UC4

' Using notes
note right of UC2
  User must have a valid membership card
  and no outstanding fines
end note

note "Books must be returned on time\notherwise fines will apply" as N1
UC3 .. N1
@enduml
```

## Example 4: Grouping Use Cases with Packages

```plantuml
@startuml "Grouping with Packages"
left to right direction

actor "Library User" as User
actor "Librarian" as Librarian
actor "System Administrator" as Admin

package "Resource Management System" {
  usecase "Search Books" as UC1
  usecase "View Book Details" as UC2
  usecase "Check Status" as UC3
}

package "Borrow-Return System" {
  usecase "Borrow Books" as UC4
  usecase "Return Books" as UC5
  usecase "Renew Loan" as UC6
  usecase "Calculate Fines" as UC7
}

package "Member Management System" {
  usecase "Register New Member" as UC8
  usecase "Edit Member Information" as UC9
  usecase "Suspend Member" as UC10
}

User --> UC1
User --> UC2
User --> UC4
User --> UC5
User --> UC6

Librarian --> UC1
Librarian --> UC3
Librarian --> UC4
Librarian --> UC5
Librarian --> UC7
Librarian --> UC8
Librarian --> UC9

Admin --> UC10
@enduml
```

## Example 5: Complex System with Multiple Relationships

```plantuml
@startuml "Online Marketplace System"
left to right direction
skinparam actorStyle awesome
skinparam usecaseBorderThickness 1
skinparam usecaseBackgroundColor lightyellow

' Actors
actor "Customer" as Customer
actor "Seller" as Seller
actor "Administrator" as Admin
actor "Payment System" as PaymentSystem <<External>>

' Inheritance between actors
Admin --|> Seller

rectangle "Online Marketplace System" {
  package "Account Management" {
    usecase "Register" as UC1
    usecase "Login" as UC2
    usecase "Edit Profile" as UC3
    usecase "Password Recovery" as UC4
  }
  
  package "Shopping" {
    usecase "Search Products" as UC5
    usecase "View Product Details" as UC6
    usecase "Add to Cart" as UC7
    usecase "Checkout" as UC8
    usecase "Track Order" as UC9
    usecase "Cancel Order" as UC10
    usecase "Check Inventory" as UC11
  }
  
  package "Selling" {
    usecase "List Product" as UC12
    usecase "Manage Products" as UC13
    usecase "View Orders" as UC14
    usecase "Ship Products" as UC15
  }
  
  package "System Management" {
    usecase "Manage Users" as UC16
    usecase "Fraud Detection" as UC17
    usecase "Statistical Reports" as UC18
  }

  ' Relationships between use cases
  UC7 ..> UC11 : <<includes>>
  UC8 ..> UC7 : <<includes>>
  UC10 .> UC8 : <<extends>>
  UC8 ..> UC2 : <<includes>>
  UC12 ..> UC2 : <<includes>>
}

' Actor relationships with use cases
Customer --> UC1
Customer --> UC2
Customer --> UC3
Customer --> UC4
Customer --> UC5
Customer --> UC6
Customer --> UC7
Customer --> UC8
Customer --> UC9
Customer --> UC10

Seller --> UC2
Seller --> UC3
Seller --> UC12
Seller --> UC13
Seller --> UC14
Seller --> UC15

Admin --> UC16
Admin --> UC17
Admin --> UC18

PaymentSystem <-- UC8 : <<communicates>>

note right of UC8
  Identity verification required before checkout
  and credit card information validation
end note

note right of UC17
  Monitor suspicious behavior
  and block accounts violating rules
end note
@enduml
```

## Example 6: Using Colors, Formatting, and Customization

```plantuml
@startuml "Movie Ticket Booking System"
left to right direction
!option handwritten true
skinparam actorStyle awesome
skinparam shadowing true
skinparam usecase {
  BackgroundColor lightblue
  BorderColor DarkSlateGray
  ArrowColor Maroon
  FontName Arial
  FontSize 12
}

' Using together to group related use cases before defining them
!pragma layout smetana
together {
  usecase "View Showtimes" as UC2
  usecase "Select Seats" as UC3
  usecase "Book Tickets" as UC4 #yellow
}

' Actors
:Viewer: as Viewer #pink
:Staff: as Staff #lightgreen
:Manager: as Manager #orange
:Payment Gateway: as PaymentGateway #lightgrey

rectangle "Movie Ticket Booking System" #AliceBlue {
  usecase "Login" as UC1 #white
  ' UC2, UC3, UC4 already defined above with together
  usecase "Make Payment" as UC5
  usecase "Cancel Booking" as UC6
  usecase "Manage Movies" as UC7
  usecase "Manage Showtimes" as UC8
  usecase "Print Revenue Reports" as UC9 #lightgreen
  usecase "Verify Customer Info" as UC10
}

' Relationships
Viewer --> UC1 #blue : access
Viewer --> UC2 #blue
Viewer --> UC3 #blue
Viewer --> UC4 #blue
Viewer --> UC5 #blue
Viewer --> UC6 #blue

Staff --> UC1
Staff --> UC7
Staff --> UC8
Staff --> UC10

Manager --> UC9

UC4 ..> UC1 : <<includes>> #red
UC4 ..> UC3 : <<includes>> #red
UC4 ..> UC5 : <<includes>> #red

UC5 --> PaymentGateway #green : <<communicates>>

' Using formatted note
note bottom of UC5 #lightyellow
  <b>Payment Methods</b>
  - Credit Card
  - Mobile Banking
  - Coupons/Promotions
end note

@enduml
```

**หมายเหตุเกี่ยวกับการใช้ together**: 
- `together` ใช้เพื่อจัดกลุ่มองค์ประกอบที่เกี่ยวข้องกันให้อยู่ใกล้กันในแผนภาพ
- ในตัวอย่างนี้ เราจัดกลุ่ม use case ที่เกี่ยวข้องกับกระบวนการจองตั๋ว (ดูรอบฉาย, เลือกที่นั่ง, จองตั๋ว)
- การใช้ together มักทำงานได้ดีกว่าเมื่อกำหนดก่อนการนิยามองค์ประกอบอื่นๆ
- คำสั่ง `!pragma layout smetana` ช่วยปรับปรุงอัลกอริทึมการจัดวางเพื่อให้ทำงานได้ดีกับ together

## Example 7: Using Business Use Case Diagram

```plantuml
@startuml "Business Use Case Diagram for Sales Process"
left to right direction
skinparam actorStyle awesome
skinparam backgroundColor #EEEBDC

' Business Actors
:Customer: as Customer <<Business Actor>>
:Sales Representative: as SalesRep <<Business Actor>>
:Logistics Department: as Logistics <<Business Actor>>
:Accounting System: as Accounting <<Business Actor>>

' Business Use Cases
rectangle "Sales Process" {
  usecase "Search Products" as UC1 <<Business UC>>
  usecase "Order Products" as UC2 <<Business UC>>
  usecase "Create Quotation" as UC3 <<Business UC>>
  usecase "Check Inventory" as UC4 <<Business UC>>
  usecase "Generate Invoice" as UC5 <<Business UC>>
  usecase "Receive Payment" as UC6 <<Business UC>>
  usecase "Prepare Shipment" as UC7 <<Business UC>>
  usecase "Ship Products" as UC8 <<Business UC>>
  usecase "Track Shipment Status" as UC9 <<Business UC>>
}

' Relationships
Customer --> UC1
Customer --> UC2
SalesRep --> UC3
SalesRep --> UC4
SalesRep --> UC5
Accounting --> UC6
Logistics --> UC7
Logistics --> UC8
Customer --> UC9
SalesRep --> UC9

UC2 ..> UC4 : <<includes>>
UC2 ..> UC3 : <<includes>>
UC5 ..> UC2 : <<includes>>
UC7 ..> UC6 : <<includes>>
UC8 ..> UC7 : <<includes>>

' Business Workflow indication
UC1 -[#blue,dashed]-> UC2 : workflow\nsequence
UC2 -[#blue,dashed]-> UC3
UC3 -[#blue,dashed]-> UC5
UC5 -[#blue,dashed]-> UC6
UC6 -[#blue,dashed]-> UC7
UC7 -[#blue,dashed]-> UC8
UC8 -[#blue,dashed]-> UC9

note bottom of UC6 #lightblue
  Payment processing is a critical step
  that must be verified before shipping
end note
@enduml
```

## Summary of Techniques Used in Use Case Diagrams

1. **Basic Elements**
   - Actors
   - Use Cases
   - System Boundary

2. **Relationships**
   - Association (solid line): Relationship between Actor and Use Case
   - Include (<<includes>>): One use case includes another as part of its main process
   - Extend (<<extends>>): One use case extends the functionality of another
   - Generalization/Inheritance: Inheritance relationship (between actors or between use cases)

3. **Grouping and Structure**
   - Packages: Grouping use cases by category
   - System Boundary: Rectangle showing system scope

4. **Additional Notations**
   - Notes: Explanatory text
   - Stereotypes: <<stereotype>> to indicate element types
   - Colors & Formatting: Using colors and formatting to improve clarity

5. **Advanced Techniques**
   - Business Use Case Diagram: Showing business processes
   - Workflow Indication: Showing sequence of operations
   - Skinparams: Customizing diagram appearance
