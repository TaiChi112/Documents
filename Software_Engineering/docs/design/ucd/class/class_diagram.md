# Class Diagram สำหรับระบบแนะนำรายวิชา

Class Diagram นี้แสดงองค์ประกอบหลักและความสัมพันธ์ระหว่างคลาสต่างๆ ในระบบแนะนำรายวิชา ซึ่งถูกออกแบบตามความต้องการจาก Use Case Description และ Sequence Diagram

## Class Diagram หลักของระบบทั้งหมด

```mermaid
classDiagram
    %% ส่วนของผู้ใช้งานระบบ
    class User {
        -int id
        -String username
        -String password
        -String email
        -String firstName
        -String lastName
        -String phone
        -boolean isActive
        -Date lastLogin
        +login(username, password) boolean
        +logout() void
        +resetPassword(email) boolean
        +updateProfile(userDetails) boolean
        +getProfile() UserDTO
    }

    class Student {
        -String studentId
        -String faculty
        -String department
        -int year
        -double gpa
        -List~CompletedCourse~ courseHistory
        +getEnrolledCourses() List~Course~
        +getCompletedCourses() List~CompletedCourse~
        +getRecommendations() List~Course~
    }

    class Professor {
        -String employeeId
        -String faculty
        -String department
        -String position
        -List~Course~ taughtCourses
        +getTeachingCourses() List~Course~
        +addCourse(courseDetails) boolean
        +editCourse(courseId, courseDetails) boolean
    }

    class Admin {
        -String adminLevel
        +manageUsers() void
        +generateReports() void
        +systemConfiguration() void
    }

    %% ส่วนของรายวิชา
    class Course {
        -String courseId
        -String courseName
        -String description
        -int credits
        -String semester
        -int academicYear
        -int capacity
        -List~Professor~ instructors
        -List~Course~ prerequisites
        -boolean isActive
        +getCourseDetails() CourseDTO
        +addPrerequisite(courseId) boolean
        +removePrerequisite(courseId) boolean
        +updateDetails(courseDetails) boolean
        +getAvailableSeats() int
    }

    class CompletedCourse {
        -Course course
        -Student student
        -String grade
        -String semester
        -int academicYear
        +getGradePoint() double
    }

    class ClassSchedule {
        -Course course
        -String room
        -String day
        -Time startTime
        -Time endTime
        +getScheduleDetails() ScheduleDTO
        +checkConflict(schedule) boolean
        +updateSchedule(scheduleDetails) boolean
    }

    %% ส่วนของระบบแนะนำรายวิชา
    class RecommendationSystem {
        -List~Student~ students
        -List~Course~ availableCourses
        +getRecommendations(studentId) List~Course~
        +filterByPrerequisites(studentId, courses) List~Course~
        +filterByInterests(studentId, courses) List~Course~
        +rankCourses(studentId, courses) List~Course~
        +updateRecommendations(studentId) void
    }

    class CourseManager {
        +getAllCourses() List~Course~
        +getCourseById(courseId) Course
        +searchCourses(criteria) List~Course~
        +addCourse(courseDetails) boolean
        +updateCourse(courseId, courseDetails) boolean
        +deleteCourse(courseId) boolean
        +getPrerequisites(courseId) List~Course~
    }

    class AuthenticationSystem {
        +authenticate(username, password) boolean
        +generateToken(userId) String
        +validateToken(token) boolean
        +revokeToken(token) void
        +checkPermission(userId, resource) boolean
    }

    class NotificationService {
        +sendEmail(toEmail, subject, body) boolean
        +sendPasswordResetLink(email) boolean
        +notifyNewCourse(courseId) void
        +notifyCourseFull(courseId) void
    }

    %% การแสดงความสัมพันธ์ระหว่างคลาส
    User <|-- Student : inheritance
    User <|-- Professor : inheritance
    User <|-- Admin : inheritance

    Student "1" -- "*" CompletedCourse : has
    Course "1" -- "*" CompletedCourse : referenced in
    Course "*" -- "*" Course : prerequisite for
    Course "1" -- "*" ClassSchedule : has
    Course "*" -- "*" Professor : taught by
    
    RecommendationSystem -- Student : recommends for
    RecommendationSystem -- Course : recommends
    CourseManager -- Course : manages
    AuthenticationSystem -- User : authenticates
    NotificationService -- User : notifies

    %% คลาสสนับสนุนเพิ่มเติม
    class UserDTO {
        +int id
        +String username
        +String email
        +String firstName
        +String lastName
        +String role
    }

    class CourseDTO {
        +String courseId
        +String courseName
        +String description
        +int credits
        +String semester
        +int academicYear
        +int capacity
        +int availableSeats
        +List~String~ instructorNames
        +List~String~ prerequisites
        +List~ScheduleDTO~ schedules
    }

    class ScheduleDTO {
        +String room
        +String day
        +String startTime
        +String endTime
    }

    class SearchCriteria {
        +String keyword
        +String faculty
        +String department
        +Integer minCredits
        +Integer maxCredits
        +String semester
        +Integer academicYear
        +String instructor
        +applyFilters(courses) List~Course~
    }

    User -- UserDTO : converts to
    Course -- CourseDTO : converts to
    ClassSchedule -- ScheduleDTO : converts to
    CourseManager -- SearchCriteria : uses
```

## Class Diagram สำหรับส่วนของผู้ใช้ (User Subsystem)

```mermaid
classDiagram
    class User {
        -int id
        -String username
        -String password
        -String email
        -String firstName
        -String lastName
        -String phone
        -boolean isActive
        -Date lastLogin
        -Date createdAt
        -Date updatedAt
        +login(username, password) boolean
        +logout() void
        +resetPassword(email) boolean
        +updateProfile(userDetails) boolean
        +getProfile() UserDTO
        +checkPassword(password) boolean
        +changePassword(oldPassword, newPassword) boolean
        +deactivateAccount() boolean
    }

    class Student {
        -String studentId
        -String faculty
        -String department
        -int year
        -double gpa
        -List~CompletedCourse~ courseHistory
        -List~String~ interests
        +getEnrolledCourses() List~Course~
        +getCompletedCourses() List~CompletedCourse~
        +getRecommendations() List~Course~
        +updateInterests(interests) boolean
        +calculateGPA() double
        +getYearOfStudy() int
        +getCoursesTaken() int
        +getCreditsTaken() int
        +getCompletedCredits() int
    }

    class Professor {
        -String employeeId
        -String faculty
        -String department
        -String position
        -List~Course~ taughtCourses
        -String specialization
        +getTeachingCourses() List~Course~
        +addCourse(courseDetails) boolean
        +editCourse(courseId, courseDetails) boolean
        +getHistoricalCourses() List~Course~
        +getAvailableTimeSlots() List~TimeSlot~
        +getTotalTeachingHours() int
    }

    class Admin {
        -String adminLevel
        -List~String~ permissions
        +manageUsers() void
        +generateReports() void
        +systemConfiguration() void
        +createUser(userDetails) boolean
        +updateUser(userId, userDetails) boolean
        +deactivateUser(userId) boolean
        +assignPermissions(userId, permissions) boolean
        +auditSystemActivity() List~AuditLog~
    }

    class UserProfile {
        -User user
        -String avatarUrl
        -String bio
        -Map~String, String~ preferences
        +updateAvatar(url) boolean
        +updateBio(text) boolean
        +setPreference(key, value) void
        +getPreference(key) String
    }

    class LoginHistory {
        -User user
        -DateTime timestamp
        -String ipAddress
        -String device
        -String browser
        -boolean successful
        +isSuccessful() boolean
        +getLoginDateTime() DateTime
    }

    User <|-- Student : inheritance
    User <|-- Professor : inheritance
    User <|-- Admin : inheritance
    User "1" -- "1" UserProfile : has
    User "1" -- "*" LoginHistory : has
```

## Class Diagram สำหรับส่วนของรายวิชา (Course Subsystem)

```mermaid
classDiagram
    class Course {
        -String courseId
        -String courseName
        -String description
        -int credits
        -String semester
        -int academicYear
        -int capacity
        -List~Professor~ instructors
        -List~Course~ prerequisites
        -boolean isActive
        -Date createdAt
        -Date updatedAt
        -User createdBy
        +getCourseDetails() CourseDTO
        +addPrerequisite(courseId) boolean
        +removePrerequisite(courseId) boolean
        +updateDetails(courseDetails) boolean
        +getAvailableSeats() int
        +isPrerequisiteSatisfied(Student) boolean
        +getInstructorNames() List~String~
        +activateCourse() void
        +deactivateCourse() void
        +isFull() boolean
    }

    class CompletedCourse {
        -Course course
        -Student student
        -String grade
        -String semester
        -int academicYear
        -Date completionDate
        +getGradePoint() double
        +isPassing() boolean
        +getSemesterYear() String
    }

    class ClassSchedule {
        -Course course
        -String room
        -String day
        -Time startTime
        -Time endTime
        -boolean isActive
        +getScheduleDetails() ScheduleDTO
        +checkConflict(schedule) boolean
        +updateSchedule(scheduleDetails) boolean
        +getDuration() int
        +getFormattedTime() String
        +isActive() boolean
    }

    class CourseDepartment {
        -String code
        -String name
        -String faculty
        -List~Course~ courses
        +addCourse(course) void
        +getCourses() List~Course~
        +getActiveCourses() List~Course~
    }

    class CourseCategory {
        -String code
        -String name
        -String description
        -List~Course~ courses
        +addCourse(course) void
        +removeCourse(course) void
        +getCourses() List~Course~
    }

    class CourseReview {
        -Course course
        -Student student
        -int rating
        -String comment
        -Date reviewDate
        +updateReview(rating, comment) boolean
        +getFormattedDate() String
    }

    Course "1" -- "*" CompletedCourse : referenced in
    Course "*" -- "*" Course : prerequisite for
    Course "1" -- "*" ClassSchedule : has
    Course "*" -- "1" CourseDepartment : belongs to
    Course "*" -- "*" CourseCategory : categorized as
    Course "1" -- "*" CourseReview : receives
```

## Class Diagram สำหรับส่วนของระบบแนะนำรายวิชา (Recommendation Subsystem)

```mermaid
classDiagram
    class RecommendationSystem {
        -List~Student~ students
        -List~Course~ availableCourses
        +getRecommendations(studentId) List~Course~
        +filterByPrerequisites(studentId, courses) List~Course~
        +filterByInterests(studentId, courses) List~Course~
        +rankCourses(studentId, courses) List~Course~
        +updateRecommendations(studentId) void
        +getPopularCourses() List~Course~
        +getSimilarCourses(courseId) List~Course~
    }

    class RecommendationAlgorithm {
        -String algorithmName
        -Map~String, Double~ weightFactors
        +calculateRecommendations(student, courses) List~Course~
        +setWeightFactor(factor, value) void
        +getWeightFactor(factor) double
        +normalizeScores(scores) Map~Course, Double~
    }

    class StudentPreference {
        -Student student
        -Map~String, Integer~ categoryPreferences
        -Map~String, Integer~ instructorPreferences
        -Map~String, Integer~ timeSlotPreferences
        +updateFromHistory(studentHistory) void
        +updateFromExplicitPreferences(preferences) void
        +getPriorityForCategory(category) int
        +getPriorityForInstructor(instructor) int
        +getPriorityForTimeSlot(timeSlot) int
    }

    class CoursePopularity {
        -Course course
        -int viewCount
        -int enrollmentCount
        -double averageRating
        -Date lastUpdated
        +incrementViews() void
        +incrementEnrollments() void
        +updateRating(newRating) void
        +getPopularityScore() double
    }

    class RecommendationHistory {
        -Student student
        -List~Course~ recommendedCourses
        -Date recommendedAt
        -boolean wasHelpful
        +setHelpful(helpful) void
        +getRecommendedCourses() List~Course~
    }

    class CourseSimilarity {
        -Course course1
        -Course course2
        -double similarityScore
        -List~String~ commonKeywords
        +getSimilarityScore() double
        +updateSimilarity(newScore) void
        +getCommonKeywords() List~String~
    }

    RecommendationSystem -- RecommendationAlgorithm : uses
    RecommendationSystem -- StudentPreference : analyzes
    RecommendationSystem -- CoursePopularity : considers
    RecommendationSystem -- RecommendationHistory : maintains
    RecommendationSystem -- CourseSimilarity : utilizes
    StudentPreference -- Student : belongs to
    CoursePopularity -- Course : measures
    RecommendationHistory -- Student : tracks for
    RecommendationHistory -- Course : includes
    CourseSimilarity -- Course : connects
```

## Class Diagram สำหรับส่วนของการจัดการระบบ (Management Subsystem)

```mermaid
classDiagram
    class CourseManager {
        +getAllCourses() List~Course~
        +getCourseById(courseId) Course
        +searchCourses(criteria) List~Course~
        +addCourse(courseDetails) boolean
        +updateCourse(courseId, courseDetails) boolean
        +deleteCourse(courseId) boolean
        +getPrerequisites(courseId) List~Course~
        +validateCourseData(courseDetails) boolean
        +checkDuplicateCourseId(courseId) boolean
        +exportCourseList(format) File
    }

    class AuthenticationSystem {
        +authenticate(username, password) boolean
        +generateToken(userId) String
        +validateToken(token) boolean
        +revokeToken(token) void
        +checkPermission(userId, resource) boolean
        +enforcePasswordPolicy(password) boolean
        +detectSuspiciousActivity(userId) boolean
        +lockAccount(userId, reason) void
        +getLoginAttempts(userId) int
    }

    class NotificationService {
        +sendEmail(toEmail, subject, body) boolean
        +sendPasswordResetLink(email) boolean
        +notifyNewCourse(courseId) void
        +notifyCourseFull(courseId) void
        +sendBulkNotification(users, message) boolean
        +scheduleNotification(user, message, dateTime) boolean
        +getUnreadNotifications(userId) List~Notification~
        +markAsRead(notificationId) void
    }

    class SystemLogger {
        +logInfo(message, context) void
        +logWarning(message, context) void
        +logError(message, error, context) void
        +logAudit(userId, action, details) void
        +getRecentLogs(count) List~LogEntry~
        +getLogsByUser(userId) List~LogEntry~
        +getLogsByDateRange(start, end) List~LogEntry~
        +exportLogs(criteria, format) File
    }

    class BackupService {
        -String backupLocation
        -int retentionDays
        +createBackup() boolean
        +restoreFromBackup(backupId) boolean
        +listAvailableBackups() List~BackupInfo~
        +scheduleRegularBackups(interval) void
        +deleteOldBackups() int
    }

    class ReportGenerator {
        +generateEnrollmentReport(semester, year) Report
        +generateCoursePopularityReport() Report
        +generateStudentProgressReport(studentId) Report
        +generateSystemUsageReport(dateRange) Report
        +exportReport(report, format) File
        +scheduleRecurringReport(reportType, schedule) boolean
    }

    CourseManager -- Course : manages
    AuthenticationSystem -- User : authenticates
    NotificationService -- User : notifies
    SystemLogger -- AuthenticationSystem : logs for
    SystemLogger -- CourseManager : logs for
    BackupService -- SystemLogger : works with
    ReportGenerator -- CourseManager : uses data from
```

## Class Diagram สำหรับ Data Transfer Objects และ Utility Classes

```mermaid
classDiagram
    class UserDTO {
        +int id
        +String username
        +String email
        +String firstName
        +String lastName
        +String role
        +boolean isActive
        +Date lastLogin
        +toUser() User
        +fromUser(user) UserDTO
    }

    class CourseDTO {
        +String courseId
        +String courseName
        +String description
        +int credits
        +String semester
        +int academicYear
        +int capacity
        +int availableSeats
        +List~String~ instructorNames
        +List~String~ prerequisites
        +List~ScheduleDTO~ schedules
        +toCourse() Course
        +fromCourse(course) CourseDTO
    }

    class ScheduleDTO {
        +String room
        +String day
        +String startTime
        +String endTime
        +toSchedule() ClassSchedule
        +fromSchedule(schedule) ScheduleDTO
    }

    class SearchCriteria {
        +String keyword
        +String faculty
        +String department
        +Integer minCredits
        +Integer maxCredits
        +String semester
        +Integer academicYear
        +String instructor
        +boolean includeInactive
        +applyFilters(courses) List~Course~
        +hasFilters() boolean
        +clearFilters() void
    }

    class DateUtils {
        +formatDate(date, pattern) String
        +parseDate(dateString, pattern) Date
        +getCurrentSemester() String
        +getCurrentAcademicYear() int
        +isDateInRange(date, start, end) boolean
    }

    class ValidationUtils {
        +isValidEmail(email) boolean
        +isStrongPassword(password) boolean
        +isValidCourseId(courseId) boolean
        +sanitizeInput(input) String
        +validateRequiredFields(object, fields) boolean
    }

    UserDTO -- User : converts
    CourseDTO -- Course : converts
    ScheduleDTO -- ClassSchedule : converts
    SearchCriteria -- CourseManager : used by
    DateUtils -- ReportGenerator : used by
    ValidationUtils -- CourseManager : used by
    ValidationUtils -- AuthenticationSystem : used by
```

Class Diagram นี้แสดงให้เห็นถึงโครงสร้างของระบบแนะนำรายวิชาทั้งหมด ครอบคลุมความสัมพันธ์ระหว่างผู้ใช้ รายวิชา และระบบแนะนำ รวมถึงคลาสสนับสนุนต่างๆ ที่จำเป็นสำหรับการทำงานของระบบ