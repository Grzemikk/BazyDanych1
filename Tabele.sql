CREATE TABLE IF NOT EXISTS rozliczenia.pracownicy (
	id_pracownika int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres TEXT NOT NULL,
	telefon VARCHAR(15) NOT NULL
);


CREATE TABLE IF NOT EXISTS rozliczenia.godziny (
	id_godziny int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	data DATE NOT NULL,
	liczba_godzin NUMERIC NOT NULL,
	id_pracownika INT NOT NULL,
	FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika)
);


CREATE TABLE IF NOT EXISTS rozliczenia.premie (
	id_premii INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	rodzaj VARCHAR(50) NOT NULL,
	kwota NUMERIC
);


CREATE TABLE IF NOT EXISTS rozliczenia.pensje (
	id_pensji INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	stanowisko VARCHAR(50) NOT NULL,
	kwota NUMERIC NOT NULL,
	id_premii INT NOT NULL,
	FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii)
);


