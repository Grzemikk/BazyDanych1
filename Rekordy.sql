
INSERT INTO pracownicy 
VALUES
    (1, 'Jan', 'Kowalski', 'ul. Klonowa 123, Warszawa', '123-456-789'),
    (2, 'Anna', 'Nowak', 'ul. Dębowa 45, Kraków', '987-654-321'),
    (3, 'Piotr', 'Zawadzki', 'ul. Słoneczna 7, Gdańsk', '555-777-888'),
    (4, 'Alicja', 'Lis', 'ul. Lipowa 56, Poznań', '111-222-333'),
    (5, 'Marek', 'Wójcik', 'ul. Brzozowa 89, Łódź', '999-111-222'),
    (6, 'Katarzyna', 'Kaczmarek', 'ul. Różana 12, Wrocław', '444-666-999'),
    (7, 'Andrzej', 'Malinowski', 'ul. Topolowa 34, Kraków', '777-888-555'),
    (8, 'Ewa', 'Dąbrowska', 'ul. Jesienna 78, Warszawa', '123-456-789'),
    (9, 'Robert', 'Wojciechowski', 'ul. Słoneczna 45, Gdańsk', '555-777-888'),
    (10, 'Magdalena', 'Kowalczyk', 'ul. Brzozowa 23, Łódź', '999-111-222');


INSERT INTO godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
    (1, '2023-01-15', 40.5, 1),
    (2, '2023-01-16', 37.0, 2),
    (3, '2023-01-15', 38.0, 3),
    (4, '2023-01-16', 41.5, 4),
    (5, '2023-01-15', 35.0, 5),
    (6, '2023-01-16', 42.0, 6),
    (7, '2023-01-15', 39.5, 7),
    (8, '2023-01-16', 40.0, 8),
    (9, '2023-01-15', 37.5, 9),
    (10, '2023-01-16', 36.0, 10);


INSERT INTO pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES
    (1, 'Kierownik', 5000.00, 1),
    (2, 'Pracownik', 3500.00, 2),
    (3, 'Kierownik', 5200.00, 3),
    (4, 'Pracownik', 3600.00, 4),
    (5, 'Kierownik', 5100.00, 5),
    (6, 'Pracownik', 3400.00, 6),
    (7, 'Kierownik', 5250.00, 7),
    (8, 'Pracownik', 3700.00, 8),
    (9, 'Kierownik', 5150.00, 9),
    (10, 'Pracownik', 3450.00, 10);


INSERT INTO premie (id_premii, rodzaj, kwota)
VALUES
    (1, 'Nagroda za wyniki', 500.00),
    (2, 'Premia świąteczna', 300.00),
    (3, 'Nagroda za wyniki', 550.00),
    (4, 'Premia świąteczna', 320.00),
    (5, 'Nagroda za wyniki', 510.00),
    (6, 'Premia świąteczna', 310.00),
    (7, 'Nagroda za wyniki', 525.00),
    (8, 'Premia świąteczna', 330.00),
    (9, 'Nagroda za wyniki', 515.00),
    (10, 'Premia świąteczna', 340.00);