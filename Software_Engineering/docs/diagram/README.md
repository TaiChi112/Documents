```mermaid
sequenceDiagram
    actor User
    participant System
    User->>System: Enter Username and Password
    System->>System: Validate Credentials
    alt Credentials Valid
        System->>User: Login Successful
    else Credentials Invalid
        System->>User: Display Error Message
    end
```

- This is some introductory text in Markdown.

```plantuml
        @startuml
            Alice -> Bob: Authentication Request
            Bob --> Alice: Authentication Response
            Alice -> Bob: Another authentication Request
            Alice <-- Bob: Another authentication Response
        @enduml
```

```plantuml
@startuml
left to right direction
actor "Student" as Student
actor "Professor" as Teacher

rectangle "Register" {
  usecase "Regist Course" as UC1
  usecase "Schedule Course" as UC2
  usecase "Printing Documentation" as UC3
  usecase "Confirm Register" as UC4
}

Student -- UC1
Student -- UC2
Teacher -- UC3

UC1 ..> UC4 : <<include>>
@enduml
```

```plantuml
@startuml
skinparam titleFontSize 14
title Example of simple table

|= Header 1 |= Header 2 |= Header 3 |
| Cell A1 | Cell A2 | Cell A3 |
| Cell B1 | Cell B2 | Cell B3 |
@enduml
```