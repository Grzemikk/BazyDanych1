


-- Wykorzystując bazę danych stworzoną na poprzednich ćwiczeniach wykonaj następujące polecenia:

-- a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski
-- w nawiasie (+48)

UPDATE ksiegowosc.pracownicy 
SET telefon = '+48' || telefon;

SELECT *
FROM ksiegowosc.pracownicy;


-- b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg
-- wzoru: ‘555-222-333’

UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT(
SUBSTRING(telefon, 1, 6), '-',
SUBSTRING(telefon, 7, 3), '-',
SUBSTRING(telefon, 10, 3)
);

SELECT *
FROM ksiegowosc.pracownicy;



-- c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter

SELECT id_pracownika, UPPER(imie), UPPER(nazwisko), UPPER(adres), telefon
FROM ksiegowosc.pracownicy
WHERE LENGTH(nazwisko) = ( SELECT MAX(LENGTH(nazwisko)) FROM ksiegowosc.pracownicy );



-- d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5

SELECT MD5(CAST(ksiegowosc.pracownicy.imie AS TEXT) ||
      CAST(ksiegowosc.pracownicy.nazwisko AS TEXT) ||
      CAST(ksiegowosc.pracownicy.adres AS TEXT) ||
      CAST(ksiegowosc.pracownicy.telefon AS TEXT) ||
      CAST(ksiegowosc.pensje.kwota AS TEXT)) AS dane_md5
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji;



-- f) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne

SELECT imie, nazwisko, pensje.kwota, premie.kwota
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pracownicy USING(id_pracownika)
LEFT JOIN ksiegowosc.pensje USING(id_pensji)
LEFT JOIN ksiegowosc.premie USING(id_premii);



-- g) wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:
-- Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, gdzie
-- wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł, nadgodziny: 540 zł

SELECT 'Pracownik ' || imie || ' ' || nazwisko || ' w dniu ' || wynagrodzenie.data || 
		' orzymał pensję całkowitą na kwotę ' || pensje.kwota + premie.kwota ||
		' , gdzie wynagrodzenie zasadnicze wynosiło: ' || pensje.kwota ||
		' zł, premia: ' || premie.kwota || ' zł, nadgodziny: 0 zł'    -- nie ma nadgodzin u mnie w rekordach bo wpisywałem godziny dniami a nie miesiącami 
FROM ksiegowosc.wynagrodzenie 
LEFT JOIN ksiegowosc.pracownicy USING(id_pracownika)
LEFT JOIN ksiegowosc.pensje USING(id_pensji)
LEFT JOIN ksiegowosc.premie USING(id_premii)
LEFT JOIN ksiegowosc.godziny USING(id_godziny);


--





















