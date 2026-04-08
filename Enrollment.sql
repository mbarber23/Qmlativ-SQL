/*This query returns all enrollments for all students of all time. It returns a 1 if the enrollment is active. */


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
