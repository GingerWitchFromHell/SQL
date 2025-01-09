USE Grandhotel;

DESCRIBE Gast;

SELECT g_name, g_vorname, g_strasse, g_plz, g_ort
FROM Gast
WHERE g_stammgast = true;

SELECT 
    Zimmer.zimmer_id, 
    Kategorie.kat_bezeichnung, 
    Rechnung.r_belegung, 
    Rechnung.r_ankunft, 
    Rechnung.r_abreise
FROM Gast
INNER JOIN Rechnung ON Gast.gast_id = Rechnung.gast_id
INNER JOIN Zimmer ON Rechnung.zimmer_id = Zimmer.zimmer_id
INNER JOIN Kategorie ON Zimmer.kategorie_id = Kategorie.kategorie_id
WHERE Gast.g_stammgast = true;

SELECT 
    SUM(
        CASE 
            WHEN Rechnung.r_belegung = 'EZ' THEN Kategorie.kat_preis_EZ * DATEDIFF(Rechnung.r_abreise, Rechnung.r_ankunft)
            WHEN Rechnung.r_belegung = 'DZ' THEN Kategorie.kat_preis_DZ * DATEDIFF(Rechnung.r_abreise, Rechnung.r_ankunft)
            ELSE 0
        END
    ) AS Gesamtumsatz
FROM Gast
INNER JOIN Rechnung ON Gast.gast_id = Rechnung.gast_id
INNER JOIN Zimmer ON Rechnung.zimmer_id = Zimmer.zimmer_id
INNER JOIN Kategorie ON Zimmer.kategorie_id = Kategorie.kategorie_id
WHERE Gast.g_stammgast = true;

SELECT 
    Gast.g_name, 
    Gast.g_vorname, 
    Rechnung.r_ankunft, 
    Rechnung.r_abreise, 
    DATEDIFF(Rechnung.r_abreise, Rechnung.r_ankunft) AS Aufenthaltstage
FROM Gast
INNER JOIN Rechnung ON Gast.gast_id = Rechnung.gast_id
WHERE DATEDIFF(Rechnung.r_abreise, Rechnung.r_ankunft) > 5;

SELECT g_name, g_vorname, g_strasse, g_plz, g_ort
FROM Gast
WHERE g_plz LIKE '3%'
ORDER BY g_name ASC;

SELECT Zimmer.zimmer_id, Kategorie.kat_preis_EZ, Kategorie.kat_preis_DZ
FROM Zimmer
INNER JOIN Kategorie ON Zimmer.kategorie_id = Kategorie.kategorie_id
WHERE Kategorie.kat_bezeichnung = 'Luxussuite';

SELECT Gast.g_name, Gast.g_vorname, 
       DATEDIFF(Rechnung.r_abreise, Rechnung.r_ankunft) AS Aufenthaltsdauer_Tage
FROM Gast
INNER JOIN Rechnung ON Gast.gast_id = Rechnung.gast_id
WHERE Gast.gast_id = 4713;
