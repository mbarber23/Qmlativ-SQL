/* Advisors */

Select
SEY.StudentID,
SEY.EntityID,
SEY.SchoolYearID,
SEY.StaffIDAdvisor,
Staff.FullNameLFM


from Student.Enrollment.StudentEntityYear SEY

Join Student.Staff.Staff Staff on SEY.StaffIDAdvisor = Staff.StaffID 

Where SEY.IsDefaultEntity = 1
