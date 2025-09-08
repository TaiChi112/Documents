# Course Management System - Use Case Catalog

## System Overview
This document provides a catalog of use cases for the Course Management System in tabular format.

## Use Case Summary Table

| ID | Name | Primary Actor | Complexity | Priority |
|----|------|---------------|------------|----------|
| UC-001 | Register for Course | Student | Medium | High |
| UC-002 | Drop Course | Student | Low | High |
| UC-003 | View Course Schedule | Student | Low | Medium |
| UC-004 | Approve Registration | Professor | Low | Medium |
| UC-005 | Manage Course Catalog | Registrar | High | High |

## Detailed Use Cases

### UC-001: Register for Course

| Field | Description |
|-------|-------------|
| **ID** | UC-001 |
| **Name** | Register for Course |
| **Description** | Allows a student to register for courses during the registration period |
| **Primary Actor** | Student |
| **Secondary Actors** | Professor |
| **Preconditions** | • Student is authenticated<br>• Registration period is open<br>• Student is in good standing |
| **Trigger** | Student accesses course registration function |
| **Main Success Scenario** | 1. Student navigates to registration section<br>2. System displays available courses<br>3. Student selects desired course(s)<br>4. System validates eligibility<br>5. System displays registration summary<br>6. Student confirms registration<br>7. System records registration<br>8. System sends confirmation |
| **Extensions** | **4a.** Prerequisites not met<br>**4b.** Schedule conflict<br>**4c.** Course requires approval |
| **Post-conditions** | • Student enrolled in course(s)<br>• Course roster updated<br>• Student schedule updated |
| **Business Rules** | • Max 21 credit hours/semester<br>• Priority based on seniority |
| **Frequency** | High (during registration periods) |

### UC-002: Drop Course

| Field | Description |
|-------|-------------|
| **ID** | UC-002 |
| **Name** | Drop Course |
| **Description** | Allows a student to drop a course they are registered for |
| **Primary Actor** | Student |
| **Secondary Actors** | None |
| **Preconditions** | • Student is authenticated<br>• Student is registered for at least one course<br>• Current date is before drop deadline |
| **Trigger** | Student initiates course drop process |
| **Main Success Scenario** | 1. Student navigates to registered courses<br>2. System displays current course registrations<br>3. Student selects course to drop<br>4. System requests confirmation<br>5. Student confirms drop request<br>6. System processes course drop<br>7. System sends drop confirmation |
| **Extensions** | **5a.** Past drop deadline with W grade<br>**5b.** After withdrawal deadline (not permitted) |
| **Post-conditions** | • Student no longer enrolled in course<br>• Course roster updated<br>• Student schedule updated |
| **Business Rules** | • Drop before deadline: no record<br>• Drop after deadline: W grade<br>• No drops after withdrawal deadline |
| **Frequency** | Medium |

### UC-003: View Course Schedule

| Field | Description |
|-------|-------------|
| **ID** | UC-003 |
| **Name** | View Course Schedule |
| **Description** | Allows a student to view their current course schedule |
| **Primary Actor** | Student |
| **Secondary Actors** | None |
| **Preconditions** | • Student is authenticated |
| **Trigger** | Student accesses schedule view |
| **Main Success Scenario** | 1. Student navigates to schedule section<br>2. System retrieves student's current registrations<br>3. System displays schedule in calendar format<br>4. Student can view course details, times, and locations |
| **Extensions** | **3a.** No courses registered - display appropriate message |
| **Post-conditions** | • Schedule information displayed to student |
| **Business Rules** | N/A |
| **Frequency** | High |

### UC-004: Approve Registration

| Field | Description |
|-------|-------------|
| **ID** | UC-004 |
| **Name** | Approve Registration |
| **Description** | Allows a professor to approve student registration requests for courses that require approval |
| **Primary Actor** | Professor |
| **Secondary Actors** | Student |
| **Preconditions** | • Professor is authenticated<br>• There are pending approval requests |
| **Trigger** | Professor accesses pending approvals |
| **Main Success Scenario** | 1. Professor navigates to approval requests<br>2. System displays pending approval requests<br>3. Professor reviews each request<br>4. Professor approves or denies requests<br>5. System updates registration status<br>6. System notifies students of decision |
| **Extensions** | **4a.** Professor requests more information<br>**4b.** Professor approves with conditions |
| **Post-conditions** | • Registration requests processed<br>• Students notified<br>• Course roster updated for approved students |
| **Business Rules** | • Professors can only approve for their own courses<br>• Approval decisions must include reasons if denied |
| **Frequency** | Medium (higher during registration periods) |

### UC-005: Manage Course Catalog

| Field | Description |
|-------|-------------|
| **ID** | UC-005 |
| **Name** | Manage Course Catalog |
| **Description** | Allows a registrar to add, modify, or remove courses from the catalog |
| **Primary Actor** | Registrar |
| **Secondary Actors** | None |
| **Preconditions** | • Registrar is authenticated with admin privileges |
| **Trigger** | Registrar accesses course catalog management |
| **Main Success Scenario** | 1. Registrar navigates to catalog management<br>2. System displays current course catalog<br>3. Registrar selects action (add/edit/remove)<br>4. Registrar enters course details<br>5. System validates information<br>6. Registrar confirms changes<br>7. System updates course catalog |
| **Extensions** | **5a.** Invalid information entered<br>**5b.** Course code already exists |
| **Post-conditions** | • Course catalog updated<br>• Changes available for next registration period |
| **Business Rules** | • Course codes must be unique<br>• Changes cannot affect current registrations<br>• Proper approvals required for new courses |
| **Frequency** | Medium (higher before registration periods) |
