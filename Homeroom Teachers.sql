/* Homeroom Teachers */

Select
SEY.StudentID,
SEY.EntityID,
SEY.SchoolYearID,
SEY.HomeroomID,
Staff.FullNameLFM


from Student.Enrollment.StudentEntityYear SEY

Join Student.Enrollment.Homeroom Homeroom on SEY.HomeroomID = Homeroom.HomeroomID
Join Student.Staff.Staff Staff on Homeroom.StaffID = Staff.StaffID

Where SEY.IsDefaultEntity = 1
