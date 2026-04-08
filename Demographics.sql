/* 
 * This table queries all students of all time with their current enrollment data. 
 * Returns demographic data.
 */

WITH Entity AS (
    SELECT
        EW.StudentID,
        EW.EntityID,
        EW.SchoolYearID,
        EW.SchoolID,
        EW.StudentTypeID,
        EW.PercentEnrolled,
        EW.CalendarID,
        EW.GradeReferenceID,
        EW.StartDate,
        EW.EntryCodeID,
        EW.EntryComment,
        EW.EndDate,
        EW.WithdrawalCodeID,
        EW.WithdrawalComment,
        SEY.IsActive
    FROM Student.Enrollment.EntryWithdrawal EW
    /* EW of each student of each instance (year/if they left and came back) */
    INNER JOIN Student.Enrollment.StudentEntityYear SEY 
        ON EW.EntryWithdrawalID = SEY.EntryWithdrawalIDLatest
        /* Marks each EW as active 1 or inactive 0 */
        AND SEY.IsActive = 1
        AND EW.IsDefaultEntity = 1
)

SELECT
    Student.StudentID,
    Entity.EntityID,
    Entity.SchoolYearID,
    Student.StudentNumber,
    Student.FirstName,
    Student.MiddleName,
    Student.LastName,
    Student.GradYear,
    Student.Grade,
    Student.GradeNumeric,
    Name.BirthDate,
    Name.GenderCode,
    Name.IsAlaskan,
    Name.IsAsian,
    Name.IsBlack,
    Name.IsHawaiian,
    Name.IsHispanic,
    Name.IsWhite,
    NativeLanguage.Description AS NativeLanguage,
    StudentLanguage.Description AS StudentLanguage,
    StudentIN.BirthCity,
    StudentIN.CountyID,
    StudentIN.StateID,
    StudentIN.StateCountryINID,
    StudentIN.IsNonUSOrigin,
    StudentIN.InitialUSSchoolEntryDate,
    StudentIN.StudentTestNumber
FROM Student.Student.Student Student
INNER JOIN Student.Demographics.Name Name 
    ON Student.NameID = Name.NameID
INNER JOIN Student.Demographics.Language NativeLanguage 
    ON Student.LanguageIDNative = NativeLanguage.LanguageID
INNER JOIN Student.Demographics.Language StudentLanguage 
    ON Student.LanguageIDPrimary = StudentLanguage.LanguageID
INNER JOIN Student.Student.StudentIN StudentIN 
    ON Student.StudentID = StudentIN.StudentID
LEFT JOIN Entity 
    ON Student.StudentID = Entity.StudentID
WHERE Name.IsStudentName = 1
/* Pulls only students */
