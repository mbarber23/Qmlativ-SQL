/*Counselor */

Select
SEY.StudentID,
SEY.EntityID,
SEY.SchoolYearID,
SEY.StaffIDCounselor,
Staff.FullNameLFM


from Student.Enrollment.StudentEntityYear SEY

Join Student.Staff.Staff Staff on SEY.StaffIDCounselor = Staff.StaffID 

Where SEY.IsDefaultEntity = 1

