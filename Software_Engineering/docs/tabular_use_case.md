# Tabular Use Case Description

## Use Case: Submit Assignment

| Use Case ID | UC-004 |
|-------------|--------|
| Name | Submit Assignment |
| Description | Allows a student to submit an assignment for a course |
| Actors | Primary: Student<br>Secondary: Instructor |
| Trigger | Student needs to submit coursework |
| Preconditions | - Student is enrolled in the course<br>- Assignment has been created by instructor<br>- Current date is before deadline |
| Basic Flow | 1. Student navigates to the assignment page<br>2. System displays assignment details and submission form<br>3. Student uploads file(s) and/or enters text submission<br>4. Student reviews submission<br>5. Student confirms submission<br>6. System validates submission format and size<br>7. System saves submission and timestamps it<br>8. System confirms successful submission<br>9. System notifies instructor of new submission |
| Alternative Flows | **A1: Save Draft**<br>4a. Student saves draft instead of submitting<br>4b. System saves current work as draft<br>4c. Student can return later to complete submission<br><br>**A2: Edit Submission**<br>8a. Student realizes mistake after submission<br>8b. Student edits submission (if before deadline)<br>8c. System updates submission with new timestamp |
| Exception Flows | **E1: File Too Large**<br>6a. System detects file exceeds size limit<br>6b. System notifies student<br>6c. Student must reduce file size or split submission<br><br>**E2: Past Deadline**<br>5a. System detects submission is after deadline<br>5b. System marks submission as late<br>5c. System notifies student of late status |
| Postconditions | - Assignment is recorded as submitted<br>- Submission is available for instructor review<br>- Submission history is updated |
| Business Rules | - Late submissions may incur grade penalty<br>- Maximum file size: 50MB<br>- Allowed file formats: PDF, DOCX, XLSX, ZIP |
| Notes | - Consider adding plagiarism check integration<br>- Future enhancement: group submissions |

## State Diagram

```mermaid
stateDiagram-v2
    [*] --> NotStarted
    NotStarted --> InProgress: Student begins work
    InProgress --> Draft: Save draft
    Draft --> InProgress: Resume work
    InProgress --> Submitted: Submit
    Draft --> Submitted: Submit from draft
    Submitted --> UnderReview: Instructor opens
    Submitted --> Revised: Student edits
    Revised --> UnderReview: Instructor opens
    UnderReview --> Graded: Instructor grades
    Graded --> [*]
    
    state Submitted {
        [*] --> OnTime
        [*] --> Late: After deadline
    }
```

## Data Requirements

| Field | Type | Validation | Notes |
|-------|------|------------|-------|
| Submission ID | UUID | Auto-generated | Primary key |
| Student ID | Integer | Required | Foreign key to Users |
| Assignment ID | Integer | Required | Foreign key to Assignments |
| Submission Text | Text | Optional | For text responses |
| File Attachments | File Array | Max 5 files, 50MB total | For file uploads |
| Submission Time | DateTime | Auto-generated | Used for deadline check |
| Status | Enum | Required | (Draft, Submitted, Late, Graded) |
| Grade | Decimal | Optional | Added by instructor later |
| Comments | Text | Optional | Feedback from instructor |
