-- Aufgabe ba: Länge der längsten Fahrtstrecke (Alias: km)
SELECT MAX(Fahrtstrecke_km) AS km
FROM Fahrt;

-- Aufgabe bb: Anzahl der Fahrgäste auf der Fahrt Nr. 2367
SELECT Anzahl_Fahrgaeste
FROM Fahrt
WHERE Fahrt_nr = 2367;

-- Aufgabe bc: Summe aller Preise pro Fahrt ohne Zusatzleistungen am 10.11.2017
SELECT SUM(Preis_Fahrt) AS Gesamtpreis
FROM Fahrt
WHERE Datum = '2017-11-10';

-- Aufgabe bd: Neuen Datensatz für Fahrt Nr. 6789 einfügen, falls noch nicht vorhanden
-- Prüfen, ob Fahrt Nr. 6789 existiert und nur einfügen, wenn sie nicht existiert
INSERT INTO Fahrt (Fahrt_nr, Datum, Ort, Preis_Fahrt)
SELECT 6789, '2017-11-10', 'Hamburg', 35.50
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1
    FROM Fahrt
    WHERE Fahrt_nr = 6789
);

-- Alternative Lösung für Aufgabe bd: Direkt einfügen oder aktualisieren, falls bereits vorhanden
INSERT INTO Fahrt (Fahrt_nr, Datum, Ort, Preis_Fahrt)
VALUES (6789, '2017-11-10', 'Hamburg', 35.50)
ON DUPLICATE KEY UPDATE
    Datum = VALUES(Datum),
    Ort = VALUES(Ort),
    Preis_Fahrt = VALUES(Preis_Fahrt);

-- Aufgabe be: Preis für Zusatzleistungen bei Fahrt Nr. 3333 um 10,30 EUR erhöhen
UPDATE Fahrt
SET Preis_Zusatzleistung = Preis_Zusatzleistung + 10.30
WHERE Fahrt_nr = 3333;

-- Zusatzaufgabe 1: Fahrten mit mehr als 4 Fahrgästen abfragen
SELECT *
FROM Fahrt
WHERE Anzahl_Fahrgaeste > 4;

-- Zusatzaufgabe 2: Durchschnittlicher Preis aller Fahrten ohne Zusatzleistungen
SELECT AVG(Preis_Fahrt) AS Durchschnittspreis
FROM Fahrt;

-- Zusatzaufgabe 3: Anzahl der Fahrten in Hamburg
SELECT COUNT(*) AS Anzahl_Fahrten
FROM Fahrt
WHERE Ort = 'Hamburg';

-- Zusatzaufgabe 4: Gesamtkosten aller Fahrten mit Zusatzleistungen
SELECT SUM(Preis_Fahrt + Preis_Zusatzleistung) AS Gesamtkosten
FROM Fahrt;

-- Zusatzaufgabe 5: Alle Fahrten sortieren basierend auf der Strecke (absteigend)
SELECT *
FROM Fahrt
ORDER BY Fahrtstrecke_km DESC;
