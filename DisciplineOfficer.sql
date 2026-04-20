/* Discipline Officer */

Select
SEY.StudentID,
SEY.EntityID,
SEY.SchoolYearID,
SEY.StaffIDDisciplineOfficer,
Staff.FullNameLFM


from Student.Enrollment.StudentEntityYear SEY

Join Student.Staff.Staff Staff on SEY.StaffIDDisciplineOfficer = Staff.StaffID 

Where SEY.IsDefaultEntity = 1;
