SET SERVEROUTPUT ON;

--------------------------------------------------------------------------------

/* 
1. Podnosi cenę wszystkich wizyt o podana w parametrze wartość.
*/

CREATE OR REPLACE PROCEDURE hikePrice(
amount IN NUMBER)
IS
idTemp NUMBER;
BEGIN
    DECLARE CURSOR visits IS SELECT idRezerwacja FROM WIZYTA;
    BEGIN
        OPEN visits;
        LOOP
        FETCH visits INTO idTemp;
        EXIT WHEN visits%NOTFOUND;
        UPDATE WIZYTA
        SET cena = cena + amount
        WHERE idRezerwacja = idTemp;
        END LOOP;
        CLOSE visits;
    END;
END;

SELECT * FROM WIZYTA;

BEGIN
hikePrice(200);
END;

--------------------------------------------------------------------------------

/*
2. Odwoluje wizytę o podanym numerze id.
*/

CREATE OR REPLACE PROCEDURE cancelTheVisit(
visitID IN NUMBER)
IS
countVisit NUMBER;
BEGIN
    SELECT COUNT(*) INTO countVisit
    FROM STATUS_WIZYTY
    WHERE id = visitID;
    
    IF (countVisit > 0)
    THEN UPDATE STATUS_WIZYTY
         SET nazwa_statusu = 'ODWOLANA'
         WHERE id = visitID;
    ELSE
        dbms_output.put_line('Nie ma takiej wizyty w bazie!');
    END IF;
END;

SELECT * FROM STATUS_WIZYTY;

BEGIN
cancelTheVisit(7988311);
END;

--------------------------------------------------------------------------------

/*
3. Nie pozwala na wprowadzenie do bazy pracownika bez specjalizacji.
*/

CREATE OR REPLACE TRIGGER notWithoutProfession
AFTER INSERT ON PRACOWNIK
REFERENCING NEW AS temp_pracownik
FOR EACH ROW
BEGIN
IF :temp_pracownik.stanowisko_id IS NULL 
THEN RAISE_APPLICATION_ERROR(-20999,'Pracownik musi mieć przypisana role w klinice!');
END IF;
END;
    

INSERT INTO PRACOWNIK(id, imie, nazwisko, data_urodzenia, adres, telefon, stanowisko_id)
VALUES(5555, 'PAWEŁ', 'MATEJA', '1980-06-12', 'WARSZAWA', '797913813', null);
    
--------------------------------------------------------------------------------

/*
4. Wyzwalacz z funkcja pomocnicza. Uniemożliwia on zmiane ceny za wizyte już
odbyta lub odwolana.
*/

CREATE OR REPLACE FUNCTION giveStatus
(idRezerwacja IN NUMBER)
RETURN VARCHAR2
IS
status VARCHAR2(100);
BEGIN
    SELECT nazwa_statusu INTO status
    FROM STATUS_WIZYTY
    WHERE id = idRezerwacja;
RETURN status;
END giveStatus;

CREATE OR REPLACE TRIGGER doNotLetChangeCharge
BEFORE UPDATE OF cena ON WIZYTA
FOR EACH ROW
DECLARE
status_temp VARCHAR2(100);
BEGIN
    status_temp:=giveStatus(:old.idRezerwacja);
    
    IF (status_temp = 'ODWOLANA' OR status_temp = 'ODBYTA')
    THEN RAISE_APPLICATION_ERROR(-20999,'Nie można zmienić należności za nieaktualna wizytę!');
    END IF;
END;

SELECT *
FROM WIZYTA INNER JOIN STATUS_WIZYTY
ON WIZYTA.idRezerwacja = STATUS_WIZYTY.id;

UPDATE WIZYTA
SET cena = 1000
WHERE idRezerwacja = 6123714;

--------------------------------------------------------------------------------

/*
5. Wyzwalacz nie pozwala na zarezerwowanie wizyty w już niedostepnym terminie.
*/

CREATE OR REPLACE TRIGGER doNotLetSameHour
BEFORE INSERT ON REZERWACJA
FOR EACH ROW
DECLARE
countTime NUMBER;
BEGIN
    SELECT COUNT(*) INTO countTime
    FROM REZERWACJA
    WHERE dataRezerwacji = :new.dataRezerwacji;
    
    IF (countTime > 0)
    THEN RAISE_APPLICATION_ERROR(-20999,'Podany termin rezerwacji jest już zajęty!');
    END IF;
END;

SELECT * FROM REZERWACJA;
    

INSERT INTO REZERWACJA(idRezerwacja, id_pacjenta, dataRezerwacji)
VALUES(1111111, 78788988, TO_DATE('2022/02/16 16:30', 'yyyy/mm/dd hh24:mi'));


--------------------------------------------------------------------------------

