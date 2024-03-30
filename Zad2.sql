WITH CompanyRev 
AS (
	SELECT CONCAT( c.CompanyName, ' (', FirstName, ' ', LastName, ')') AS CompanyContact, SUM(oh.TotalDue) as Revenue
	FROM SalesLT.Customer AS c
	INNER JOIN SalesLT.SalesOrderHeader AS oh ON c.CustomerID = oh.CustomerID
	GROUP BY c.CompanyName, FirstName, LastName
	)


SELECT *
FROM CompanyRev;

	
