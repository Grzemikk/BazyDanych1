-- 1. Napisz procedur� wypisuj�c� do konsoli ci�g Fibonacciego. Procedura musi przyjmowa� jako
--argument wej�ciowy liczb� n. Generowanie ci�gu Fibonacciego musi zosta�
--zaimplementowane jako osobna funkcja, wywo�ywana przez procedur�.

CREATE FUNCTION dbo.Fibo(@n INT)
RETURNS @FibTable TABLE( nFib INT ) AS
BEGIN 
DECLARE @F1 INT = 0, @F2 INT = 1, @temp INT = 0, @i INT = 1;
	WHILE @n > @i
	BEGIN
	INSERT INTO @FibTable( nFib ) VALUES ( @F1 )
	SET @temp = @F1;
	SET	@F1 = @F2;
	SET @F2 = @temp + @F2;
	SET @i = @i + 1;
END
RETURN;
END;
GO


CREATE PROCEDURE dbo.PrintFibo( @n INT ) AS
BEGIN
DECLARE @FibT TABLE( nFib INT );
INSERT INTO @FibT
	SELECT nFib 
	FROM dbo.Fibo( @n );
	SELECT nFib
	FROM @FibT
END;
GO

EXEC dbo.PrintFibo @n = 15;
GO




--2. Napisz trigger DML, kt�ry po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko
--tak, aby by�o napisane du�ymi literami.

CREATE TRIGGER UpNazwisko
ON Person.Person
AFTER INSERT
AS
BEGIN 
UPDATE Person.Person
		SET LastName = UPPER(Person.LastName)
		FROM inserted
		WHERE Person.BusinessEntityID = inserted.BusinessEntityID
END;
GO



--3. Przygotuj trigger �taxRateMonitoring�, kt�ry wy�wietli komunikat o b��dzie, je�eli nast�pi
--zmiana warto�ci w polu �TaxRate� o wi�cej ni� 30%

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
IF UPDATE(TaxRate)
BEGIN
	DECLARE @Tax DECIMAL( 8, 4 )
	DECLARE @NewTax DECIMAL( 8, 4 )
	SELECT @Tax = TaxRate FROM deleted
	SELECT @NewTax = TaxRate FROM inserted
	
	IF @NewTax > 1.3*@Tax OR @NewTax < 0.7*@Tax
	BEGIN
	RAISERROR('ERROR: TaxRate cannot be changed by more than 30%', 16, 1 )
	ROLLBACK
	RETURN
END
END
END