
/*
1. Po stworzeniu rezerwacji wizyty w bazie automatycznie ustawia jej status na 'ZAREZERWOWANA'
*/

CREATE TRIGGER makeReserved
ON REZERWACJA
FOR INSERT
AS
BEGIN
	DECLARE @id INT

	SET @id = (SELECT idRezerwacja FROM INSERTED)

	INSERT INTO STATUS_WIZYTY(id, nazwa_statusu)
						VALUES(@id, 'ZAREZERWOWANA')
END

INSERT INTO REZERWACJA(idRezerwacja, id_pacjenta, dataRezerwacji)
				VALUES(9084309, 45323344, '2022-03-15 15:00')

SELECT * FROM REZERWACJA

SELECT * FROM STATUS_WIZYTY WHERE id = 9084309;
	

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
2. Kasuje wizytę o podanym id z bazy.
*/

CREATE PROCEDURE cancelTheVisit(
@visitID INT)
AS
BEGIN
	DECLARE @countVisit INT;

	SET @countVisit = (SELECT COUNT(*) FROM STATUS_WIZYTY WHERE id = @visitID)
    
    IF @countVisit > 0
		 UPDATE STATUS_WIZYTY
         SET nazwa_statusu = 'ODWOLANA'
         WHERE id = @visitID;
    ELSE
        PRINT 'Nie ma takiej wizyty w bazie!'
END

SELECT * FROM STATUS_WIZYTY;

EXEC cancelTheVisit @visitID = 7988311
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
3. Nie dopuszcza do wprowadzenia do bazy pracownika bez specjalizacji.
*/

CREATE TRIGGER notWithoutProfession
ON PRACOWNIK
FOR INSERT
AS
BEGIN
	DECLARE @tempProfession INT

	SET @tempProfession = (SELECT stanowisko_id FROM INSERTED)

	IF @tempProfession IS NULL
		PRINT 'Pracownik musi mieć przypisaną rolę w klinice!'
		ROLLBACK
END


INSERT INTO PRACOWNIK(id, imie, nazwisko, data_urodzenia, adres, telefon, stanowisko_id)
VALUES(5555, 'Paweł', 'Mateja', '1980-06-12', 'Warszawa', '797913813', null);


SELECT *
FROM PRACOWNIK;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* 
4. Wyzwalacz z funkcją pomocniczą. Nie pozwala on zmienić ceny za wizytę już odbytą lub odwołaną.
*/

CREATE FUNCTION giveStatus (@idRezerwacja INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @status VARCHAR(100);
	SET @status = (SELECT nazwa_statusu FROM STATUS_WIZYTY WHERE id = @idRezerwacja)

    RETURN @status
END

CREATE TRIGGER doNotLetChangeCharge
ON WIZYTA
FOR UPDATE
AS
BEGIN
	DECLARE @id_temp INT;
	DECLARE @status_temp VARCHAR(100);

	SET @id_temp = (SELECT idRezerwacja FROM INSERTED)
	SET @status_temp = (SELECT dbo.giveStatus(@id_temp))

	IF (@status_temp = 'ODWOLANA' OR @status_temp = 'ODBYTA')
		BEGIN
		PRINT 'Nie można zmienić należności za nieaktualną wizytę!'
		ROLLBACK
		END
END

SELECT *
FROM WIZYTA INNER JOIN STATUS_WIZYTY
ON WIZYTA.idRezerwacja = STATUS_WIZYTY.id;

UPDATE WIZYTA
SET cena = 1000
WHERE idRezerwacja = 6123714;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
5. Przesuwa czas wszystkich wizyt o podaną liczbę godzin jako parametr.
*/

CREATE PROCEDURE postponeVisits(
@hours INT)
AS
BEGIN
	DECLARE reservations CURSOR FOR SELECT idRezerwacja, dataRezerwacji FROM REZERWACJA
	DECLARE @id INT
	DECLARE @date DATETIME

	OPEN reservations
	FETCH NEXT FROM reservations INTO @id, @date
	WHILE @@FETCH_STATUS = 0
	BEGIN
	     UPDATE REZERWACJA
         SET dataRezerwacji = DATEADD(hour, @hours, @date)
		 WHERE idRezerwacja = @id
		 FETCH NEXT FROM reservations INTO @id, @date
	END
	CLOSE reservations
	DEALLOCATE reservations
END

SELECT * FROM REZERWACJA;

EXEC postponeVisits @hours = 1
GO
 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
