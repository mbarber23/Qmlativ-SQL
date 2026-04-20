/* Activities with Types */

Select
SA.StudentID,
SA.IsActive,
A.Description,
A.EntityID,
A.SchoolYearID,
AT.Description

from Student.Activity.StudentActivity SA

Join Student.Activity.Activity A ON SA.ActivityID = A.ActivityID

Join Student.Activity.ActivityType AT ON A.ActivityTypeID = AT.ActivityTypeID
