--SELECT *
--FROM SalesLT.ProductCategory;


--SELECT *
--FROM SalesLT.SalesOrderDetail;



WITH ValByCategory 
AS ( 
SELECT pc.Name AS Category, SUM(od.LineTotal) AS SalesValue
FROM SalesLT.ProductCategory AS pc
INNER JOIN SalesLT.Product AS p ON pc.ProductCategoryID = p.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail AS od ON p.ProductID = od.ProductID
GROUP BY pc.Name
)


SELECT *
FROM ValByCategory;
