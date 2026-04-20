/* Current Year Attendance Letters */
/* Update school year or delete school year where clause */

Select 
SDT.StudentID,
RH.Date,
RH.AttachmentDisplayName,
SDT.RepeatableThresholdInterval,
RH.EntityID,
RH.SchoolYearID

from Student.Attendance.AttendanceReportRunHistory RH
Join Student.Attendance.StudentDisciplineThresholdAttendanceReportRunHistory SDT ON RH.AttendanceReportRunHistoryID = SDT.AttendanceReportRunHistoryID

Where RH.SchoolYearID = 14
and RH.StatusCode = 'A'
