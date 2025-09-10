# Use Case Description Template

## Use Case: [UC-01] Register for Course

**Actor(s):** Student

**Description:** This use case describes the process of a student registering for a course in the system.

**Pre-conditions:**
- User is authenticated in the system
- User has the role of "Student"
- Registration period is open

**Main Flow:**
1. Student navigates to course registration page
2. System displays available courses for the current term
3. Student selects a course to register
4. Student confirms course selection
5. System validates registration eligibility (prerequisites, schedule conflicts, etc.)
6. System adds the course to the student's schedule
7. System displays confirmation message

**Alternative Flows:**
- **A1: Course is Full**
   1. At step 5, system detects the course is full
   2. System offers to add student to waiting list
   3. Student accepts or declines waiting list option
   4. If accepted, system adds student to waiting list and shows confirmation

- **A2: Schedule Conflict**
   1. At step 5, system detects schedule conflict with already registered course
   2. System displays conflict details
   3. Student can either cancel registration or proceed to resolve conflict

**Exceptions:**
- **E1: Prerequisite Not Met**
   1. System detects student does not meet prerequisites
   2. System displays error message with missing prerequisites
   3. Registration is blocked

**Post-conditions:**
- Student is registered for the course (main flow)
- Student is added to waiting list (alternative flow A1)
- Registration is denied (exception E1)

**Frequency of Use:** High during registration periods

**Business Rules:**
- Students cannot register for more than 21 credit hours per term
- Some courses require department approval
- Registration priority is based on student's academic level

**Special Requirements:**
- System should process registration within 3 seconds
- System must maintain accurate count of available seats

---

## Use Case: [UC-02] [Another Use Case Name]

**Actor(s):** [Primary and Secondary Actors]

**Description:** [Brief description of the use case]

**Pre-conditions:**
- [Condition 1]
- [Condition 2]

**Main Flow:**
1. [Step 1]
2. [Step 2]
3. [...]

**Alternative Flows:**
- **A1: [Alternative Flow Name]**
   1. [Step 1]
   2. [...]

**Exceptions:**
- **E1: [Exception Name]**
   1. [Step 1]
   2. [...]

**Post-conditions:**
- [Condition 1]
- [Condition 2]

**Frequency of Use:** [Low/Medium/High]

**Business Rules:**
- [Rule 1]
- [Rule 2]

**Special Requirements:**
- [Requirement 1]
- [Requirement 2]
