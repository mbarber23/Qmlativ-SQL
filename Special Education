/*This table queries the special education in Skyward (not PSSP). It pulls the students most resent SPED record. */


WITH MaxDate AS (
    SELECT
        Enrollment.StudentID,
        MAX(Enrollment.StartDate) AS MaxStartDate
    FROM Student.SpecialEducation.SpecialEducationEnrollment AS Enrollment
    GROUP BY Enrollment.StudentID
)
SELECT 
    Enrollment.StudentID,
    Enrollment.StartDate,
    Enrollment.EndDate,
    Program.DisabilityServiceProgramINID,
    Program.Rank,
    Disability.Code,
    Disability.Description
FROM Student.SpecialEducation.SpecialEducationEnrollment AS Enrollment
JOIN MaxDate 
    ON Enrollment.StudentID = MaxDate.StudentID 
    AND Enrollment.StartDate = MaxDate.MaxStartDate
JOIN Student.SpecialEducation.EnrollmentDisabilityServiceProgramIN AS Program 
    ON Enrollment.SpecialEducationEnrollmentID = Program.EnrollmentINID
JOIN Student.SpecialEducation.DisabilityServiceProgramIN AS Disability 
    ON Program.DisabilityServiceProgramINID = Disability.DisabilityServiceProgramINID;
