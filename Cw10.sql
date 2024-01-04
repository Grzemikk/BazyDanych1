--1. Napisz zapytanie, które wykorzystuje transakcjê (zaczyna j¹), a nastêpnie aktualizuje cenê 
--produktu o ProductID równym 680 w tabeli Production.Product o 10% i nastêpnie 
--zatwierdza transakcjê.

BEGIN TRANSACTION;

UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680;

ROLLBACK TRANSACTION;

SELECT ListPrice 
FROM Production.Product
Where ProductID = 680;

COMMIT;

--2. Napisz zapytanie, które zaczyna transakcjê, usuwa produkt o ProductID równym 707 z tabeli 
--Production. Product, ale nastêpnie wycofuje transakcjê.

BEGIN TRANSACTION;

DELETE 
FROM Production.Product
WHERE ProductID = 707;

SELECT *
FROM Production.Product
WHERE ProductID = 707;

ROLLBACK;

SELECT *
FROM Production.Product
WHERE ProductID = 707;



--3. Napisz zapytanie, które zaczyna transakcjê, dodaje nowy produkt do tabeli 
--Production.Product, a nastêpnie zatwierdza transakcjê.

BEGIN TRANSACTION;

INSERT INTO Production.Product( Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, 
ReorderPoint, StandardCost, DaysToManufacture, SellStartDate, rowguid, ModifiedDate ) 
VALUES ( 'Nowy Produkt', 'KR-R93C-45', 1, 1, 50, 25, 50, 1, GETDATE(), NEWID(), GETDATE() );

SELECT * 
FROM Production.Product
WHERE ProductID = 1000;





--4. Napisz zapytanie, które zaczyna transakcjê i aktualizuje StandardCost wszystkich produktów 
--w tabeli Production.Product o 10%, je¿eli suma wszystkich StandardCost po aktualizacji nie 
--przekracza 50000. W przeciwnym razie zapytanie powinno wycofaæ transakcjê.


BEGIN TRANSACTION;

UPDATE Production.Product
SET StandardCost = StandardCost * 1.1
IF( SELECT SUM(StandardCost) FROM Production.Product ) <= 500000
	COMMIT;
ELSE
	ROLLBACK;


SELECT SUM(StandardCost)
FROM Production.Product;



--5. Napisz zapytanie SQL, które zaczyna transakcjê i próbuje dodaæ nowy produkt do tabeli 
--Production.Product. Jeœli ProductNumber ju¿ istnieje w tabeli, zapytanie powinno wycofaæ 
--transakcjê.

BEGIN TRANSACTION;

INSERT INTO Production.Product ( ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, 
ReorderPoint, StandardCost, DaysToManufacture, SellStartDate, rowguid, ModifiedDate ) 
VALUES ( 1000, 'Nowy Produkt', 'MMMMMM', 1, 1, 1000, 1000, 1000, 1000, '2023-20-12 00:00:00.000', 'AAAAAAAAAAAAA', '2023-20-12 00:00:00.000' );
IF EXISTS ( SELECT 1 FROM Production.Product WHERE ProductID = 1000 )
 ROLLBACK;
ELSE
 COMMIT;


 SELECT *
 FROM Production.Product 
 WHERE ProductID = 1000;




--6. Napisz zapytanie SQL, które zaczyna transakcjê i aktualizuje wartoœæ OrderQty dla ka¿dego 
--zamówienia w tabeli Sales.SalesOrderDetail. Je¿eli którykolwiek z zamówieñ ma OrderQty 
--równ¹ 0, zapytanie powinno wycofaæ transakcjê.

BEGIN TRANSACTION;

UPDATE Sales.SalesOrderDetail 
SET OrderQty = OrderQty + 1
IF EXISTS( SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0 )
ROLLBACK;
ELSE
COMMIT;


SELECT *
FROM Sales.SalesOrderDetail;



--7. Napisz zapytanie SQL, które zaczyna transakcjê i usuwa wszystkie produkty, których 
--StandardCost jest wy¿szy ni¿ œredni koszt wszystkich produktów w tabeli 
--Production.Product. Je¿eli liczba produktów do usuniêcia przekracza 10, zapytanie powinno 
--wycofaæ transakcjê.
--Wynikiem z zajêæ jest skrypt SQL zawieraj¹cy rozwi¹zania wszystkich zadañ

SELECT *
FROM Production.Product;


BEGIN TRANSACTION;

DELETE 
FROM Production.Product 
WHERE StandardCost > ( SELECT AVG(StandardCost) FROM Production.Product ); 

DECLARE @Del INT;
SET @Del = @@ROWCOUNT;

IF @Del > 10
ROLLBACK;
ELSE 
COMMIT;
