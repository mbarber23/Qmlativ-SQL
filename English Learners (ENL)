/*The English Learners table queries the most recent English Learner program record from each student with such a program.
The table responds with the WIDA test score and the ML program number. The program number is recoded in PowerBI, please note that the program numbers are different than expected*/




WITH maxdate AS (
    SELECT
        StudentID,
        MAX(EndDate) AS MaxEndDate
    FROM Student.SpecialPrograms.EnglishLearnerIN
    GROUP BY StudentID
)
SELECT 
    ENL.StudentID,
    ENL.StartDate,
    ENL.EndDate,
    ENL.WIDAProficiencyLevel,
    ENL.StateInstructionalLanguageProgramINID
FROM Student.SpecialPrograms.EnglishLearnerIN ENL
JOIN maxdate ON ENL.StudentID = maxdate.StudentID AND ENL.EndDate = maxdate.MaxEndDate;

