/* This query returns all students of all time with their most recent food service category, i.e. Free/Reduced Status. 
The F/R status is cleaned in Power BI */


WITH LatestCustomerCategory AS (
    SELECT 
        CustomerID,
        MAX(EffectiveTime) AS LatestEffectiveTime
    FROM Student.FoodService.CustomerCategory
    GROUP BY CustomerID
)

SELECT 
    Customer.CustomerID,
    Customer.IsCurrentActive,
    Student.StudentNumber,
    CustomerCategory.EligibilityCategoryID,
    CustomerCategory.EffectiveTime
FROM Student.FoodService.CustomerCategory CustomerCategory
JOIN LatestCustomerCategory LCC 
    ON CustomerCategory.CustomerID = LCC.CustomerID 
    AND CustomerCategory.EffectiveTime = LCC.LatestEffectiveTime
JOIN Student.FoodService.Customer Customer 
    ON CustomerCategory.CustomerID = Customer.CustomerID
RIGHT JOIN Student.Student.Student Student 
    ON Customer.NameID = Student.NameID
