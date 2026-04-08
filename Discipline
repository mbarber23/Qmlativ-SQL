/* This table queries discipline incidents, offenses, and actions. Only incidents are pulled, not referrals. Be aware that the relationships in this query are very complicated. */

Select
I.EntityID,
I.SchoolYearID,
Student.StudentNumber,
I.IncidentNumber,
I.DateTime as IncidentDate,
I.Description as IncidentDescription,
ION.Statement,
ION.Description as OffenseDescription,
IONIN.StateCriminalEventINID as GangRelation,
IONIN.StateArrestTypeINID as Arrest,
IONIN.StateArrestReasonINID as ArrestReason,
IONIN.IsPhysicalRestraint,
IONIN.IsSeclusion,
IONIN.IsStaffInjured,
O.Code as OffenseCode,
O.Description as OffenseCodeDescription,
IONA.ActionID,
IONA.StatusCode,
IONA.OrderedDate,
IONA.Comment as ActionComment,
IONA.ActionTypeID,
A.Code as ActionCode,
A.Description as ActionCodeDescription,
AT.Code as ActionTypeCode,
AT.Description as ActionTypeDescription

From Student.Discipline.Incident I  

Join Student.Discipline.IncidentOffense IO On I.IncidentID = IO.IncidentID

Join Student.Discipline.IncidentOffenseName ION ON IO.IncidentOffenseID = ION.IncidentOffenseID

Join Student.Discipline.IncidentOffenseNameIN IONIN ON ION.IncidentOffenseNameID = IONIN.IncidentOffenseNameID

Join Student.Discipline.Offense O On IO.OffenseID = O.OffenseID

Left Join Student.Discipline.IncidentOffenseNameAction IONA ON ION.IncidentOffenseNameID = IONA.IncidentOffenseNameID /*left join to include incidents w/o accidents*/

Left Join Student.Discipline.Action A ON IONA.ActionID = A.ActionID

Left Join Student.Discipline.ActionType AT ON A.ActionTypeID = AT.ActionTypeID

Join Student.Demographics.Name Name ON ION.NameID = Name.NameID

Join Student.Student.Student Student On Name.NameID = Student.NameID

Where I.TypeCode = 'I'
