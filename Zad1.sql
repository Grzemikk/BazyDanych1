SELECT * 
FROM Person.Person;



WITH EmployeeInfo AS (
	SELECT FirstName, LastName, Rate
	FROM Person.Person AS p
	INNER JOIN HumanResources.EmployeePayHistory AS hr ON p.BusinessEntityID = hr.BusinessEntityID
		WHERE p.PersonType = 'EM' AND hr.ModifiedDate = (
		SELECT MAX(ModifiedDate)
		FROM HumanResources.EmployeePayHistory
		WHERE BusinessEntityID = p.BusinessEntityID
		)
	)


SELECT *
INTO TempEmployeeInfo
FROM EmployeeInfo

SELECT *
FROM TempEmployeeInfo

