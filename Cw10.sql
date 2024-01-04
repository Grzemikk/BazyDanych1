--1. Napisz zapytanie, kt�re wykorzystuje transakcj� (zaczyna j�), a nast�pnie aktualizuje cen� 
--produktu o ProductID r�wnym 680 w tabeli Production.Product o 10% i nast�pnie 
--zatwierdza transakcj�.

BEGIN TRANSACTION;

UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680;

ROLLBACK TRANSACTION;

SELECT ListPrice 
FROM Production.Product
Where ProductID = 680;

COMMIT;

--2. Napisz zapytanie, kt�re zaczyna transakcj�, usuwa produkt o ProductID r�wnym 707 z tabeli 
--Production. Product, ale nast�pnie wycofuje transakcj�.

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



--3. Napisz zapytanie, kt�re zaczyna transakcj�, dodaje nowy produkt do tabeli 
--Production.Product, a nast�pnie zatwierdza transakcj�.

BEGIN TRANSACTION;

INSERT INTO Production.Product( Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, 
ReorderPoint, StandardCost, DaysToManufacture, SellStartDate, rowguid, ModifiedDate ) 
VALUES ( 'Nowy Produkt', 'KR-R93C-45', 1, 1, 50, 25, 50, 1, GETDATE(), NEWID(), GETDATE() );

SELECT * 
FROM Production.Product
WHERE ProductID = 1000;





--4. Napisz zapytanie, kt�re zaczyna transakcj� i aktualizuje StandardCost wszystkich produkt�w 
--w tabeli Production.Product o 10%, je�eli suma wszystkich StandardCost po aktualizacji nie 
--przekracza 50000. W przeciwnym razie zapytanie powinno wycofa� transakcj�.


BEGIN TRANSACTION;

UPDATE Production.Product
SET StandardCost = StandardCost * 1.1
IF( SELECT SUM(StandardCost) FROM Production.Product ) <= 500000
	COMMIT;
ELSE
	ROLLBACK;


SELECT SUM(StandardCost)
FROM Production.Product;



--5. Napisz zapytanie SQL, kt�re zaczyna transakcj� i pr�buje doda� nowy produkt do tabeli 
--Production.Product. Je�li ProductNumber ju� istnieje w tabeli, zapytanie powinno wycofa� 
--transakcj�.

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




--6. Napisz zapytanie SQL, kt�re zaczyna transakcj� i aktualizuje warto�� OrderQty dla ka�dego 
--zam�wienia w tabeli Sales.SalesOrderDetail. Je�eli kt�rykolwiek z zam�wie� ma OrderQty 
--r�wn� 0, zapytanie powinno wycofa� transakcj�.

BEGIN TRANSACTION;

UPDATE Sales.SalesOrderDetail 
SET OrderQty = OrderQty + 1
IF EXISTS( SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0 )
ROLLBACK;
ELSE
COMMIT;


SELECT *
FROM Sales.SalesOrderDetail;



--7. Napisz zapytanie SQL, kt�re zaczyna transakcj� i usuwa wszystkie produkty, kt�rych 
--StandardCost jest wy�szy ni� �redni koszt wszystkich produkt�w w tabeli 
--Production.Product. Je�eli liczba produkt�w do usuni�cia przekracza 10, zapytanie powinno 
--wycofa� transakcj�.
--Wynikiem z zaj�� jest skrypt SQL zawieraj�cy rozwi�zania wszystkich zada�

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
