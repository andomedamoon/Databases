
/*
1. Poszukuje w bazie danych rekordów dotyczacych umówionych (zarezerwowanych) wizyt lekarskich.
*/
SELECT id, nazwa_statusu
FROM STATUS_WIZYTY
WHERE nazwa_statusu = 'ZAREZERWOWANA';

/*
2. Poszukuje w bazie danych rekordów dotyczacych dokumentow pacjentow (w tym przypadku recept).
Polecenie żada, poza opisem, numeru id pacjenta oraz dokladnej lokalizacji w klinice
*/
SELECT  pacjent_id_pacjenta "ID PACJENTA" , opis, lokalizacja
FROM DOKUMENT
WHERE opis = 'Recepta';


/*
3. Polecenie prosi baze danych o wyswietlenie id rezerwacji ktore nie zawieraja 
zadnego komentarza wzgledem przyszlej wizyty.
*/
SELECT idRezerwacja, komentarz
FROM WIZYTA
WHERE komentarz != 'brak';

/*
4. Polecenie prosi o udostepnienie informacji o pomieszczeniach znajdujacych się
na piętrze nr 2.
*/
SELECT nazwa
FROM SALA
WHERE pietro = 2;


/*
5. Polecenie wysiwetla identyfikator, imie, nazwisko oraz kod stanowiska
dla pracowników urodzonych miedzy 1980 a 1990 rokiem.
*/
SELECT id ,imie, nazwisko, stanowisko_id
FROM PRACOWNIK
WHERE data_urodzenia BETWEEN '1980-01-01' AND '1990-01-01';

--------------------------------------------------------------------------------
/*
6. Polecenie wyswietla sklad personelu podczas konkretnych wizyt pacjentow w klinice 
,zarówno dopiero zaplanowanych jak i już odbytych. 
*/
SELECT idRezerwacja, pracownik_ID, rola_pracownika, sala_nazwa
FROM WIZYTA INNER JOIN PRACOWNIK_PODCZAS_WIZYTY
ON WIZYTA.idRezerwacja = PRACOWNIK_PODCZAS_WIZYTY.wizyta_idrezerwacja;

/*
7. Polecenie wyswietla wszystkie dostepne dane o pracownikach kliniki z
wykorzystaniem operacji zlaczenia tabel.
*/
SELECT PACJENT.id_pacjenta, imie, nazwisko, DataRezerwacji, telefon, e_mail
FROM PACJENT INNER JOIN REZERWACJA
ON PACJENT.id_pacjenta = REZERWACJA.id_pacjenta;

/*
8. Polecenie wyswietla wszystkie dostepne w archiwum kliniki dokumenty pacjentów wraz z
imieniem i nazwiskiem oraz danymi kontaktowymi (telefon oraz e-mail).
*/
SELECT opis, imie, nazwisko, telefon, e_mail
FROM DOKUMENT INNER JOIN PACJENT
ON DOKUMENT.Pacjent_ID_pacjenta = PACJENT.id_pacjenta;

/*
9. Polecenie wyswietla identyfikator wizyty wraz z nazwa problemu z jakim
pacjent pojawil się na konkretnej wizycie.
*/
SELECT wizyta_id, nazwa_problemu
FROM ZDIAGNOZOWANY_PROBLEM INNER JOIN KATALOG_PROBLEMOW
ON ZDIAGNOZOWANY_PROBLEM.katalog_problemow_id = KATALOG_PROBLEMOW.id;

/*
10. Polecenie wyswietla historie wszystkich wizyt w klinice oraz ich obecny status.
Jeśli wizyta się odbyla cena jest rózna od zera.
*/
SELECT idRezerwacja, nazwa_statusu, cena
FROM WIZYTA INNER JOIN STATUS_WIZYTY
ON WIZYTA.idRezerwacja = status_wizyty.id;


--------------------------------------------------------------------------------
/*
11.Polecenie wyswietla dane rezerwacji, które wiazaly się z jakakolwiek oplata.
*/
SELECT idRezerwacja, sala_nazwa, cena
FROM WIZYTA
GROUP BY idRezerwacja, sala_nazwa, cena
HAVING Min(cena) > 0;

/*
12. Polecenie wyswietla dane osobowe tych pracowników, którzy maja id większe
niż liczba 4000.
*/
SELECT imie, nazwisko, id, adres, telefon
FROM PRACOWNIK
GROUP BY imie, nazwisko, id, adres, telefon
HAVING id > 4000;

/*
13. Polecenie podaje liczbę obecnie zarezerwowanych wizyt pacjentow w bazie danych.
*/
SELECT Count(id) "ILOŚĆ", nazwa_statusu
FROM STATUS_WIZYTY
WHERE nazwa_statusu = 'ZAREZERWOWANA'
GROUP BY nazwa_statusu;

/*
14. Polecenie podaje ile osób jest obecnie zatrudnionych na stanowisku o id 11,
czyli na stanowisku dentysty.
*/
SELECT Count(id) "ILOŚĆ", stanowisko_id
FROM PRACOWNIK
WHERE stanowisko_id = 11
GROUP BY stanowisko_id;

/*
15. Polecenie wyświetla listę pomieszczeń w klinice w kolejności pięter.
*/
SELECT nazwa, pietro
FROM SALA
GROUP BY nazwa, pietro
ORDER BY pietro;


--------------------------------------------------------------------------------
/*
16.Polecenie podaje dane osobowe dentystów zatrudnioncyh w klinice
*/
SELECT id, imie, nazwisko
FROM PRACOWNIK
WHERE stanowisko_id = (SELECT id
                       FROM STANOWISKO
                       WHERE nazwa_stanowiska = 'Dentysta');
                       
/*
17. Polecenie wyswietla identyfikator wizyty oraz identyfikator przypisanego
do wizyty uzębienia, które nie mialo jeszcze robionego przegladu przez dentystę.
*/
SELECT wizyta_id, zeby_id
FROM ZDIAGNOZOWANY_PROBLEM
WHERE zeby_id = (SELECT id
                 FROM ZEBY
                 WHERE zeby = 'Przed badaniem');

/*                 
18. Polecenie ma za zadanie zidentyfikowanie zespolu wizyty, która zostala 
odwolana i hipotetyczne przydzielenie mu innej, przyszlej wizyty.
SELECT wizyta_idRezerwacja, pracownik_id, rola_pracownika
*/
FROM PRACOWNIK_PODCZAS_WIZYTY
WHERE wizyta_idRezerwacja = (SELECT id
                             FROM STATUS_WIZYTY
                             WHERE nazwa_statusu = 'ODWOLANA');
           
/*                             
19. Polecenie wyświetla id pacjenta, id jego rezerwacji oraz datę i godzinę jego
rezerwacji.
*/
SELECT idRezerwacja, id_pacjenta, dataRezerwacji
FROM REZERWACJA
WHERE id_pacjenta = (SELECT id_pacjenta
                     FROM PACJENT
                     WHERE id_pacjenta = 78788988);
                     
/*                     
20. Polecenie sluży do wyświetlenia wszystkich kroków przewidzianych do realizacji 
na jednej wizycie pacjenta w klinice.
*/
SELECT id "ID KROKU", nazwa_kroku, opis
FROM KROK
WHERE id = (SELECT krok_ID
            FROM KROKILECZENIA
            WHERE wizyta_id = 1471152);
                             


                 

                       

