# Use Case Description in Table Format

## Use Case: Register for Course (UC-001)

| Aspect | Description |
|--------|-------------|
| **Use Case ID** | UC-001 |
| **Use Case Name** | Register for Course |
| **Description** | This use case enables a student to register for available courses during the registration period. |
| **Primary Actor** | Student |
| **Secondary Actors** | Professor (for approval when required) |
| **Preconditions** | • Student is authenticated in the system<br>• Registration period is open<br>• Student is in good academic standing |
| **Trigger** | Student initiates course registration process |
| **Main Flow** | 1. Student navigates to the course registration section<br>2. System displays list of available courses for the current term<br>3. Student selects desired course(s)<br>4. System checks for prerequisites and schedule conflicts<br>5. System displays registration summary<br>6. Student confirms registration<br>7. System registers student for the course(s)<br>8. System sends confirmation email to student |
| **Alternative Flows** | **4a. Prerequisite not met:**<br>1. System notifies student of missing prerequisites<br>2. Student may request prerequisite override<br>3. If approved, continue to step 5; otherwise, registration is blocked for that course<br><br>**4b. Schedule conflict:**<br>1. System alerts student of the conflict<br>2. Student can choose to resolve the conflict or continue with non-conflicting courses<br><br>**4c. Course requires approval:**<br>1. System marks the course as "pending approval"<br>2. System notifies relevant professor<br>3. Registration is completed once approved |
| **Post Conditions** | • Student is enrolled in the selected course(s)<br>• Course roster is updated<br>• Student's schedule reflects the new course(s) |
| **Business Rules** | • Maximum course load is 21 credit hours per semester<br>• Some courses have limited enrollment<br>• Priority registration is based on seniority |
| **Special Requirements** | • Registration process must complete within 30 seconds<br>• System must handle peak loads during registration periods |
| **Frequency of Use** | High during registration periods, low otherwise |
| **Notes and Issues** | • Integration with billing system is required<br>• Performance testing needed for peak registration periods |

## Use Case Relationship Diagram

```plantuml
@startuml
left to right direction
actor "Student" as student
actor "Professor" as professor

rectangle "Registration System" {
  usecase "Register for Course" as UC1
  usecase "Check Prerequisites" as UC2
  usecase "Approve Registration" as UC3
  usecase "Update Course Roster" as UC4
}

student --> UC1
UC1 ..> UC2 : <<include>>
UC1 ..> UC3 : <<extend>>
UC1 --> UC4
professor --> UC3
@enduml
```
