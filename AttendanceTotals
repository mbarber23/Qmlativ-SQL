/* This table queries current year attendance. This table is extremely complex. It is not recommended that you edit the table without understanding its function. 
This query joins the attendance table to the calendar table on calendardayID, so that each day has a 1:1 relationship. 
The first half of the query pulls all attendance between the students start and end dates of the current school year (this has to be updated yearly).
The second half queries attendance for currently active students and their attendance upto the current date. 

Every year this query must be update for the current school year ID and current school year start date */



Select
EntryWithdrawal.StudentID,
EntryWithdrawal.EntityID,
CalendarDay.Date,
Sum(CalendarDay.CountAs) "Days Possible",
Sum(StudentAttendance.DaysExcused) "Days Excused",
Sum(StudentAttendance.DaysUnexcused) "Days Unexcused",
Sum(StudentAttendance.DaysOther) "Days Other"
from Student.Attendance.CalendarDay CalendarDay

Join Student.Enrollment.EntryWithdrawal EntryWithdrawal on CalendarDay.CalendarID = EntryWithdrawal.CalendarID

FULL Join Student.Attendance.StudentAttendance StudentAttendance on EntryWithdrawal.StudentID = StudentAttendance.StudentID AND CalendarDay.CalendarDayID = StudentAttendance.CalendarDayID

Where CalendarDay.Date >= EntryWithdrawal.StartDate
AND CalendarDay.Date <= EntryWithdrawal.EndDate
AND EntryWithdrawal.SchoolYearID = 14
AND EntryWithdrawal.StartDate > '8/5/2025'
Group By
EntryWithdrawal.StudentID,
EntryWithdrawal.EntityID,
CalendarDay.Date

Union

Select
EntryWithdrawal.StudentID,
EntryWithdrawal.EntityID,
CalendarDay.Date,
Sum(CalendarDay.CountAs) "Days Possible",
Sum(StudentAttendance.DaysExcused) "Days Excused",
Sum(StudentAttendance.DaysUnexcused) "Days Unexcused",
Sum(StudentAttendance.DaysOther) "Days Other"
from Student.Attendance.CalendarDay CalendarDay

Join Student.Enrollment.EntryWithdrawal EntryWithdrawal on CalendarDay.CalendarID = EntryWithdrawal.CalendarID

Full Join Student.Attendance.StudentAttendance StudentAttendance on EntryWithdrawal.StudentID = StudentAttendance.StudentID AND CalendarDay.CalendarDayID = StudentAttendance.CalendarDayID

Where CalendarDay.Date >= EntryWithdrawal.StartDate
AND EntryWithdrawal.SchoolYearID = 14
AND EntryWithdrawal.EndDate is NULL
AND EntryWithdrawal.EntityID != 11 /*Summer school*/
AND CalendarDay.Date <= CURRENT_TIMESTAMP


Group By 
EntryWithdrawal.StudentID,
EntryWithdrawal.EntityID,
CalendarDay.Date
