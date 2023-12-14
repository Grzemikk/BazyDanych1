ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto;


ALTER TABLE rozliczenia.pensje 
ADD COLUMN kwota_netto money;


ALTER TABLE rozliczenia.pensje
SET kwota_netto = kwota_brutto * 0,77;