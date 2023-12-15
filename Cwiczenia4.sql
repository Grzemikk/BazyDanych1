CREATE TABLE IF NOT EXISTS ksiegowosc.pracownicy(
	id_pracownika INT PRIMARY KEY,
	imie VARCHAR(50),
	nazwisko VARCHAR(50),
	adres TEXT,
	telefon VARCHAR(15)
);


CREATE TABLE IF NOT EXISTS ksiegowosc.godziny(
	id_godziny INT PRIMARY KEY,
	data DATE,
	liczba_godzin INT,
	id_pracownika INT,
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika) 
 );
 
 CREATE TABLE IF NOT EXISTS ksiegowosc.pensje (
	id_pensji INT PRIMARY KEY,
	stanowisko VARCHAR(50),
	kwota INT
);

CREATE TABLE IF NOT EXISTS ksiegowosc.premie (
	id_premii INT PRIMARY KEY,
	rodzaj VARCHAR(50),
	kwota INT
);


CREATE TABLE IF NOT EXISTS ksiegowosc.wynagrodzenie (
	id_wynagrodzenia INT PRIMARY KEY,
	data DATE,
	id_pracownika INT,
	id_godziny INT,
	id_pensji INT,
	id_premii INT,
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika), 
	FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
	FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji),
	FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii)
);
-- opisy/komentarze dla każdej tabeli – użyj polecenia COMMENT

COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela przechowujaca dane na temat pracowników';
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela przechowujaca dane na temat godzin pracy';
COMMENT ON TABLE ksiegowosc.pensje IS 'Tabela przechowujaca dane na temat pensji';
COMMENT ON TABLE ksiegowosc.premie IS 'Tabela przechowujaca dane na temat premii';
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela przechowujaca dane na temat wynagrodzen';

-- INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon)
-- -- VALUES
-- -- (1, 'Jan', 'Kowalski', 'ul. Kwiatowa 1, Warszawa', '123-456-7890'),
-- -- (2, 'Anna', 'Nowak', 'ul. Ogrodowa 2, Kraków', '987-654-3210'),
-- -- (3, 'Piotr', 'Wiśniewski', 'ul. Leśna 3, Gdańsk', '111-222-3333'),
-- -- (4, 'Maria', 'Dąbrowska', 'ul. Polna 4, Wrocław', '444-555-6666'),
-- -- (5, 'Tomasz', 'Lewandowski', 'ul. Słoneczna 5, Poznań', '777-888-9999'),
-- -- (6, 'Alicja', 'Zając', 'ul. Bławatną 6, Katowice', '111-333-5555'),
-- -- (7, 'Marcin', 'Adamczyk', 'ul. Różana 7, Łódź', '222-444-6666'),
-- -- (8, 'Katarzyna', 'Sikora', 'ul. Główna 8, Lublin', '333-555-7777'),
-- -- (9, 'Wojciech', 'Wójcik', 'ul. Miodowa 9, Szczecin', '444-666-8888'),
-- -- (10, 'Magdalena', 'Kaczmarek', 'ul. Klonowa 10, Bydgoszcz', '555-777-9999');



-- -- INSERT INTO ksiegowosc.godziny VALUES
-- -- (1, '2023-01-01', 8, 1),
-- -- (2, '2023-01-02', 7, 2),
-- -- (3, '2023-01-03', 6, 3),
-- -- (4, '2023-01-04', 8, 4),
-- -- (5, '2023-01-05', 9, 5),
-- -- (6, '2023-01-06', 7, 6),
-- -- (7, '2023-01-07', 6, 7),
-- -- (8, '2023-01-08', 8, 8),
-- -- (9, '2023-01-09', 9, 9),
-- -- (10, '2023-01-10', 7, 10);

-- -- INSERT INTO ksiegowosc.pensje VALUES
-- -- (1, 'Księgowy', 5000),
-- -- (2, 'Specjalista ds. Finansowych', 6000),
-- -- (3, 'Analityk Finansowy', 5500),
-- -- (4, 'Kierownik Finansowy', 7000),
-- -- (5, 'Asystent Księgowego', 4500),
-- -- (6, 'Analityk Rachunkowości', 5500),
-- -- (7, 'Dyrektor Finansowy', 8000),
-- -- (8, 'Asystent Finansowy', 4700),
-- -- (9, 'Księgowa', 4800),
-- -- (10, 'Specjalista ds. Rachunkowości', 5200);

-- -- INSERT INTO ksiegowosc.premie VALUES
-- -- (1, 'Premia kwartalna', 1000),
-- -- (2, 'Premia za wyjątkowe osiągnięcia', 1500),
-- -- (3, 'Bonus roczny', 1200),
-- -- (4, 'Premia za efektywność', 800),
-- -- (5, 'Dodatkowa nagroda za projekt', 1000),
-- -- (6, 'Premia miesięczna', 900),
-- -- (7, 'Nagroda za innowacyjność', 1300),
-- -- (8, 'Premia roczna', 1100),
-- -- (9, 'Bonus za osiągnięcia zespołu', 1000),
-- -- (10, 'Nagroda za najlepszy pomysł', 1200);

-- -- INSERT INTO ksiegowosc.wynagrodzenie VALUES
-- -- (1, '2023-01-01', 1, 1, 1, 1),
-- -- (2, '2023-01-02', 2, 2, 2, 2),
-- -- (3, '2023-01-03', 3, 3, 3, 3),
-- -- (4, '2023-01-04', 4, 4, 4, 4),
-- -- (5, '2023-01-05', 5, 5, 5, 5),
-- -- (6, '2023-01-06', 6, 6, 6, 6),
-- -- (7, '2023-01-07', 7, 7, 7, 7),
-- -- (8, '2023-01-08', 8, 8, 8, 8),
-- -- (9, '2023-01-09', 9, 9, 9, 9),
-- -- (10, '2023-01-10', 10, 10, 10, 10);


-- 6. Wykonaj następujące zapytania:
-- a) Wyświetl tylko id pracownika oraz jego nazwisko
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

-- b) Wyświetl id pracowników, których płaca jest większa niż 1000
SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
GROUP BY wynagrodzenie.id_pracownika 
HAVING SUM ( pensje.kwota + premie.kwota ) > 6000;


-- c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000
SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
WHERE (pensje.kwota ) > 2000 AND (premie.kwota ) = 0;


-- d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’
SELECT * 
FROM ksiegowosc.pracownicy
WHERE ( pracownicy.imie ) LIKE 'J%';


-- e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a
SELECT *
FROM ksiegowosc.pracownicy 
WHERE ( pracownicy.nazwisko ) LIKE '%w%' AND ( pracownicy.imie ) LIKE '%a';



-- f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy 
-- czas pracy to 160 h miesięcznie
SELECT imie, nazwisko, ( liczba_godzin - 160) AS nadgodziny
FROM ksiegowosc.godziny 
JOIN ksiegowosc.pracownicy ON godziny.id_pracownika = pracownicy.id_pracownika
WHERE liczba_godzin > 160;


-- g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 
-- PL
SELECT imie, nazwisko
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
WHERE pensje.kwota > 1500 AND pensje.kwota < 3000;


-- h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali 
-- premii
SELECT imie, nazwisko
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.godziny ON wynagrodzenie.id_godziny = godziny.id_godziny
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
Where premie.kwota IS NULL AND godziny.liczba_godzin > 160;


-- i) Uszereguj pracowników według pensji
Select * 
From ksiegowosc.wynagrodzenie 
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji 
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
ORDER BY pensje.kwota;


-- j) Uszereguj pracowników według pensji i premii malejąco

SELECT *, (pensje.kwota + premie.kwota) AS zarobki 
FROM ksiegowosc.wynagrodzenie 
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
ORDER BY (pensje.kwota + premie.kwota) DESC;



-- k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’

SELECT stanowisko, COUNT(*) AS liczba_pracownikow
FROM ksiegowosc.wynagrodzenie 
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
GROUP BY pensje.stanowisko;


-- l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’
-- (jeżeli takiego nie masz, to przyjmij dowolne inne).

SELECT stanowisko, MIN(kwota) AS min_pensja, AVG(kwota) AS sr_pensja, MAX(kwota) AS max_pensja
FROM ksiegowosc.pensje 
WHERE stanowisko = 'Kierownik Finansowy'
GROUP BY stanowisko;



-- m) Policz sumę wszystkich wynagrodzeń.

SELECT SUM( pensje.kwota + premie.kwota ) AS suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie 
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii;




-- n) Policz sumę wynagrodzeń w ramach danego stanowiska

SELECT stanowisko, SUM( pensje.kwota + premie.kwota ) AS suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie 
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
GROUP BY pensje.stanowisko;



-- o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska

SELECT stanowisko, COUNT(id_premii) AS liczba_premi_na_danym_stanowisku 
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
GROUP BY stanowisko;	


-- p) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.

 DELETE
 FROM ksiegowosc.pracownicy
 WHERE id_pracownika IN ( SELECT  id_pracownika
 					   FROM ksiegowosc.wynagrodzenie 
 					   JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji 
				   	   WHERE kwota < 5000);
					   
































