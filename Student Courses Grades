/* Student courses and grades for all grade levels since 2014. */

Select 
Course.EntityID,
Course.CurriculumID,
Course.CourseCode,
Course.Description,
Department.Description AS "Department",
SchoolYear.Description As "School Year",
SectionLength.Description As "Section Length",
Section.Code AS "SectionCode",
MeetSummary.Days,
MeetSummary.Period,
Staff.FullNameFL,
StudentSection.StudentID,
StudentIN.StudentTestNumber,
GM.Code,
GPA.GPACredits,
GPA.GPAPoints,
GPA.BonusGPAPoints

from 

--Core Tables
Student.Student.StudentIN StudentIN

Join Student.Scheduling.StudentSection StudentSection on StudentSection.StudentID = StudentIN.StudentID

Join Student.Scheduling.Section Section on StudentSection.SectionID = Section.SectionID

Join Student.Scheduling.Course Course on Section.CourseID = Course.CourseID

Full Join Student.Scheduling.Meet Meet on StudentSection.SectionID = Meet.SectionID 

Full Join Student.Scheduling.MeetSummary MeetSummary on Meet.MeetID = MeetSummary.MeetID

Full Join Student.Scheduling.StaffMeet StaffMeet on Meet.MeetID = StaffMeet.MeetID

Join Student.Grading.StudentGradeBucket SGB ON StudentSection.StudentSectionID = SGB.StudentSectionID 

--Lookup/Reference Tables

Full Join Student.Staff.Staff Staff on StaffMeet.StaffID = Staff.StaffID

Full Join Student.Scheduling.SectionLength SectionLength on Section.SectionLengthID = SectionLength.SectionLengthID

Full Join Student.Staff.Department Department on Course.DepartmentID = Department.DepartmentID

Full Join Student.District.SchoolYear SchoolYear on StudentSection.SchoolYearIDCourse = SchoolYear.SchoolYearID

Join Student.Grading.GradeMark GM ON SGB.GradeMarkID = GM.GradeMarkID

WHERE (Meet.IsPrimary =1 Or MeetSummary.Period is null)
And (StaffMeet.IsPrimary = 1 OR Staff.FullNameFL is null)
And SchoolYear.NumericYear >2013
