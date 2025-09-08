# Use Case Reference Table

## Course Management System - Quick Reference

| ID | Name | Actor | Brief Description | Pre-conditions | Main Steps | Post-conditions |
|----|------|-------|-------------------|----------------|------------|----------------|
| UC-001 | Register for Course | Student | Student registers for available courses | • Authenticated<br>• Registration open | 1. Navigate to registration<br>2. Select courses<br>3. Confirm registration | • Student enrolled<br>• Roster updated |
| UC-002 | Drop Course | Student | Student drops a registered course | • Authenticated<br>• Course registered | 1. View registered courses<br>2. Select course to drop<br>3. Confirm drop | • Course removed<br>• Schedule updated |
| UC-003 | View Schedule | Student | Student views current course schedule | • Authenticated | 1. Access schedule view<br>2. View calendar | • Schedule displayed |
| UC-004 | Approve Registration | Professor | Professor approves student registration requests | • Authenticated<br>• Pending requests | 1. Review requests<br>2. Approve/deny<br>3. Provide feedback | • Requests processed<br>• Students notified |
| UC-005 | Manage Catalog | Registrar | Registrar updates course catalog | • Admin privileges | 1. Access catalog<br>2. Add/edit/remove courses<br>3. Confirm changes | • Catalog updated |
| UC-006 | Assign Grades | Professor | Professor assigns grades to students | • Course in progress<br>• Professor assigned | 1. Access grade book<br>2. Enter grades<br>3. Submit grades | • Grades recorded<br>• Students notified |
| UC-007 | Generate Transcript | Student | Student generates academic transcript | • Authenticated | 1. Request transcript<br>2. Select format<br>3. Download | • Transcript generated |
| UC-008 | Pay Tuition | Student | Student makes tuition payment | • Balance due<br>• Authenticated | 1. Access payment system<br>2. Select payment method<br>3. Complete payment | • Payment recorded<br>• Receipt issued |

## Use Case Relationships

```mermaid
graph TD
    UC1[Register for Course]
    UC2[Drop Course]
    UC3[View Schedule]
    UC4[Approve Registration]
    UC5[Manage Catalog]
    UC6[Assign Grades]
    UC7[Generate Transcript]
    UC8[Pay Tuition]
    
    UC1 -->|depends on| UC5
    UC1 -->|may require| UC4
    UC1 -->|affects| UC3
    UC2 -->|affects| UC3
    UC6 -->|contributes to| UC7
    UC8 -->|enables| UC1
```

## Detailed Business Rules

| Use Case ID | Business Rules |
|-------------|----------------|
| UC-001 | • Maximum 21 credit hours per semester<br>• Prerequisites must be met<br>• Registration priority by academic level<br>• Payment or payment plan required |
| UC-002 | • Before deadline: no record<br>• Before withdrawal deadline: W grade<br>• After withdrawal deadline: not permitted<br>• Dropping below minimum credits affects financial aid |
| UC-004 | • Professors can only approve their courses<br>• Department chair can override<br>• Decisions must include reasons if denied |
| UC-005 | • Course codes must be unique<br>• Changes cannot affect current registrations<br>• Department approval required for new courses |
| UC-006 | • Grades must be submitted by deadline<br>• Grade changes require department approval<br>• Incomplete grades require contract |
| UC-008 | • Payment plans require approval for balances >$5000<br>• Late fees apply after due date<br>• Service blocks applied for unpaid balances |
