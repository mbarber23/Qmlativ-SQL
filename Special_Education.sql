/*This table queries the special education in Skyward (not PSSP). It pulls the students most resent SPED record. */

SELECT 
SPEDIN.StudentID,
SPEDIN.StartDate,
SPEDIN.EndDate,
SPEDDisability.Rank,
SPEDProgram.Code,
SPEDProgram.Description


From Student.SpecialEducation.EnrollmentIN SPEDIN

Join Student.SpecialEducation.EnrollmentDisabilityServiceProgramIN SPEDDisability 
    ON SPEDIN.EnrollmentINID = SPEDDisability.EnrollmentINID

Join Student.SpecialEducation.DisabilityServiceProgramIN SPEDProgram
    ON SPEDDisability.DisabilityServiceProgramINID = SPEDProgram.DisabilityServiceProgramINID

Where SpedIN.EndDate is null
And SPEDIN.StudentID = 376607
