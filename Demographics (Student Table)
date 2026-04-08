/* This table queries all studentsof all time with their current enrollment data. Returns demographic data. */


With Entity as (
Select 
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
from Student.Enrollment.EntryWithdrawal EW
/* EW of each student of each instance (year/if they left and came back) */

Join Student.Enrollment.StudentEntityYear SEY On EW.EntryWithdrawalID = SEY.EntryWithdrawalIDLatest
/*Marks each EW as active 1 or inactive 0 */

And SEY.IsActive = 1
And EW.IsDefaultEntity = 1)

Select 
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
NativeLanguage.Description As NativeLanguage,
StudentLanguage.Description As StudentLanguage,
StudentIN.BirthCity,
StudentIN.CountyID,
StudentIN.StateID,
StudentIN.StateCountryINID,
StudentIN.IsNonUSOrigin,
StudentIN.InitialUSSchoolEntryDate,
StudentIN.StudentTestNumber

From Student.Student.Student Student

Join Student.Demographics.Name Name On Student.NameID = Name.NameID

Join Student.Demographics.Language NativeLanguage On Student.LanguageIDNative = NativeLanguage.LanguageID

Join Student.Demographics.Language StudentLanguage On Student.LanguageIDPrimary = StudentLanguage.LanguageID

Join Student.Student.StudentIN StudentIN On Student.StudentID = StudentIN.StudentID 

Left Join Entity on Student.StudentID = Entity.StudentID 

Where Name.IsStudentName = 1
/*pulls only students */
