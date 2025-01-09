SELECT SUM(kaufpreis) AS Gesamtwert
FROM fahrzeuge;

SELECT COUNT(*) AS Anzahl_Schrott
FROM fahrzeuge
WHERE besonderheit = 'Schrott';

UPDATE fahrzeuge
SET angebotspreis = angebotspreis * 0.9;

SELECT hersteller, modell, stellplatznr
FROM fahrzeuge
WHERE hersteller = 'Volkswagen AG'
  AND besonderheit != 'Schrott'
  AND kilometerstand < 10000;

DELETE FROM fahrzeuge
WHERE besonderheit = 'Schrott';

UPDATE fahrzeuge
SET bemerkungen = 'Hoher Kilometerstand'
WHERE kilometerstand > 200000;

SELECT AVG(kilometerstand) AS Durchschnitt_Kilometerstand
FROM fahrzeuge;

SELECT *
FROM fahrzeuge
ORDER BY angebotspreis DESC
LIMIT 1;

SELECT *
FROM fahrzeuge
ORDER BY angebotspreis ASC
LIMIT 1;

SELECT baujahr, COUNT(*) AS Anzahl_Fahrzeuge
FROM fahrzeuge
GROUP BY baujahr
ORDER BY baujahr ASC;

UPDATE fahrzeuge
SET angebotspreis = angebotspreis * 0.95
WHERE hersteller = 'BMW';

UPDATE fahrzeuge
SET bemerkungen = 'Klassiker'
WHERE baujahr < YEAR(CURDATE()) - 20;

SELECT SUM(angebotspreis) AS Gesamt_Umsatzpotenzial
FROM fahrzeuge;

SELECT *
FROM fahrzeuge
WHERE angebotspreis BETWEEN 10000 AND 20000;

SELECT hersteller, modell, COUNT(*)
FROM fahrzeuge
GROUP BY hersteller, modell
HAVING COUNT(*) > 1;

DELETE FROM fahrzeuge
WHERE angebotspreis < kaufpreis;

ALTER TABLE fahrzeuge
ADD COLUMN zustand VARCHAR(50);

UPDATE fahrzeuge
SET zustand = 'Gut'
WHERE kilometerstand < 100000;




