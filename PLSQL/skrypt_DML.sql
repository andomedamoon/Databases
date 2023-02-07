


INSERT ALL
INTO STANOWISKO (id, nazwa_stanowiska)
        VALUES (11, 'Dentysta')
INTO STANOWISKO (id, nazwa_stanowiska)
        VALUES (12, 'Asystent')
SELECT * FROM dual;

INSERT ALL 
INTO PRACOWNIK (id, imie, nazwisko, data_urodzenia, adres, telefon, stanowisko_id)
        VALUES (1234, 'Adam', 'Majewski',DATE '1978-12-11', 'Warszawa', '444221456', 11)
INTO PRACOWNIK (id, imie, nazwisko, data_urodzenia, adres, telefon, stanowisko_id)
        VALUES (3456, 'Norbert', 'Sadowski',DATE '1980-06-12', 'Otwock', '453434218', 11)
INTO PRACOWNIK (id, imie, nazwisko, data_urodzenia, adres, telefon, stanowisko_id)
        VALUES (3653, 'Magdalena', 'Nowak',DATE '1986-04-01', 'Legionowo', '412453117', 12)
INTO PRACOWNIK (id, imie, nazwisko, data_urodzenia, adres, telefon, stanowisko_id)
        VALUES (6432, 'Dorota', 'Kowalczyk',DATE '1989-07-16', 'Warszawa', '221445175', 12)
SELECT * FROM dual;


INSERT ALL
INTO PACJENT (id_pacjenta, imie, nazwisko, adres, telefon, e_mail)
        VALUES (45323344, 'Jan', 'Magiera', 'Warszawa', 343788111, 'jan.magiera@gmail.com')
INTO PACJENT (id_pacjenta, imie, nazwisko, adres, telefon, e_mail)
        VALUES(34328978, 'Agata', 'Michalak', 'Piaseczno', 343421584, 'agata.michalak@gmail.com')
INTO PACJENT (id_pacjenta, imie, nazwisko, adres, telefon, e_mail)
        VALUES(78788988, 'Marek', 'Rogalski', 'Siedlce', 343554183, 'marek.rogalski@wp.pl')
INTO PACJENT (id_pacjenta, imie, nazwisko, adres, telefon, e_mail)
        VALUES(23144555, 'Dariusz', 'Zawadzki', 'Sochaczew', 343556587, 'dariusz.zawadzki@op.pl')
INTO PACJENT (id_pacjenta, imie, nazwisko, adres, telefon, e_mail)
        VALUES(65663312, 'Ewelina', 'Smolarek', 'Radzymin', 343897893, 'ewelina.smolarek@yahoo.com')
SELECT * FROM dual;

INSERT ALL
INTO DOKUMENT (id, opis, lokalizacja, pacjent_id_pacjenta)
        VALUES(232, 'Rentgen szczęki', 'Pokój nr 6', 45323344)
INTO DOKUMENT (id, opis, lokalizacja, pacjent_id_pacjenta)
        VALUES(233, 'Rentgen szczęki', 'Pokoj nr 6', 34328978)
INTO DOKUMENT (id, opis, lokalizacja, pacjent_id_pacjenta)
        VALUES(234, 'Rentgen szczęki', 'Pokoj nr 6', 78788988)
INTO DOKUMENT (id, opis, lokalizacja, pacjent_id_pacjenta)
        VALUES(235, 'Recepta', 'Pokoj nr 6', 23144555)
INTO DOKUMENT (id, opis, lokalizacja, pacjent_id_pacjenta)
        VALUES(236, 'Recepta', 'Pokój nr 6', 65663312)
SELECT * FROM dual;

INSERT INTO BUDYNEK (nazwa, liczba_pieter, adres)
        VALUES ('Klinika dentystyczna Rajdent', 2, 'ul. Losowa 34');


INSERT ALL
INTO SALA(nazwa, pietro, budynek_nazwa)
        VALUES('Recepcja', 1, 'Klinika dentystyczna Rajdent')
INTO SALA(nazwa, pietro, budynek_nazwa)
        VALUES('Pokój nr 1', 1, 'Klinika dentystyczna Rajdent')
INTO SALA(nazwa, pietro, budynek_nazwa)
        VALUES('Pokój nr 2', 1, 'Klinika dentystyczna Rajdent')
INTO SALA(nazwa, pietro, budynek_nazwa)
        VALUES('Pokój nr 3', 1, 'Klinika dentystyczna Rajdent')
INTO SALA(nazwa, pietro, budynek_nazwa)
        VALUES('Pokój nr 4', 2, 'Klinika dentystyczna Rajdent')
INTO SALA(nazwa, pietro, budynek_nazwa)
        VALUES('Pokój nr 5', 2, 'Klinika dentystyczna Rajdent')
INTO SALA(nazwa, pietro, budynek_nazwa)
        VALUES('Pokój nr 6', 2, 'Klinika dentystyczna Rajdent')
SELECT * FROM dual;


INSERT ALL
INTO KATALOG_PROBLEMOW(id, nazwa_problemu)
        VALUES(676821, 'pacjent przed wizyta')
INTO KATALOG_PROBLEMOW(id, nazwa_problemu)
        VALUES(347894, 'pacjent przed wizyta')
INTO KATALOG_PROBLEMOW(id, nazwa_problemu)
        VALUES(987899, 'ból zęba (6)')
INTO KATALOG_PROBLEMOW(id, nazwa_problemu)
        VALUES(277771, 'Wstawienie implantów')
INTO KATALOG_PROBLEMOW(id, nazwa_problemu)
        VALUES(454521, 'wizyta nie odbyta')
SELECT * FROM dual;

INSERT ALL
INTO ZEBY(id, czy_zeby_dziecka, zeby)
        VALUES(87213, 'N', 'W trakcie leczenia')
INTO ZEBY(id, czy_zeby_dziecka, zeby)
        VALUES(34291, 'T', 'W trakcie leczenia')
INTO ZEBY(id, czy_zeby_dziecka, zeby)
        VALUES(23253, 'N', 'Po leczeniu')
INTO ZEBY(id, czy_zeby_dziecka, zeby)
        VALUES(78691, 'N', 'Po leczeniu')
INTO ZEBY(id, czy_zeby_dziecka, zeby)
        VALUES(65552, 'N', 'Przed badaniem')
SELECT * FROM dual;


INSERT ALL
INTO REZERWACJA(idRezerwacja, id_pacjenta, dataRezerwacji)
        VALUES(8766771, 45323344,TO_DATE('2022/02/25 11:30', 'yyyy/mm/dd hh24:mi'))
INTO REZERWACJA(idRezerwacja, id_pacjenta, dataRezerwacji)
        VALUES(7988311, 34328978,TO_DATE('2022/02/27 14:00', 'yyyy/mm/dd hh24:mi'))
INTO REZERWACJA(idRezerwacja, id_pacjenta, dataRezerwacji)
        VALUES(6123714, 78788988,TO_DATE('2022/01/7 12:00', 'yyyy/mm/dd hh24:mi'))
INTO REZERWACJA(idRezerwacja, id_pacjenta, dataRezerwacji)
        VALUES(1471152, 23144555,TO_DATE('2022/02/15 13:00', 'yyyy/mm/dd hh24:mi'))
INTO REZERWACJA(idRezerwacja, id_pacjenta, dataRezerwacji)
        VALUES(2871113, 65663312,TO_DATE('2022/02/16 16:30', 'yyyy/mm/dd hh24:mi'))
SELECT * FROM dual;

INSERT ALL
INTO STATUS_WIZYTY(id, nazwa_statusu)
        VALUES(8766771, 'ZAREZERWOWANA')
INTO STATUS_WIZYTY(id, nazwa_statusu)
        VALUES(7988311, 'ZAREZERWOWANA')
INTO STATUS_WIZYTY(id, nazwa_statusu)
        VALUES(6123714, 'ODBYTA')
INTO STATUS_WIZYTY(id, nazwa_statusu)
        VALUES(1471152, 'ODBYTA')
INTO STATUS_WIZYTY(id, nazwa_statusu)
        VALUES(2871113, 'ODWOLANA')
SELECT * FROM dual;

INSERT ALL
INTO WIZYTA(sala_nazwa, cena, komentarz, idRezerwacja)
        VALUES('Pokój nr 1', 0, 'brak',8766771)
INTO WIZYTA(sala_nazwa, cena, komentarz, idRezerwacja)
        VALUES('Pokój nr 2', 0, 'pacjent niepelnosprawny',7988311)
INTO WIZYTA(sala_nazwa, cena, komentarz, idRezerwacja)
        VALUES('Pokój nr 3', 4000, 'brak',6123714)
INTO WIZYTA(sala_nazwa, cena, komentarz, idRezerwacja)
        VALUES('Pokój nr 4', 500, 'brak',1471152)
INTO WIZYTA(sala_nazwa, cena, komentarz, idRezerwacja)
        VALUES('Pokój nr 2', 0, 'brak',2871113)
SELECT * FROM dual;



INSERT ALL
INTO ZDIAGNOZOWANY_PROBLEM(id, zeby_id, katalog_problemow_id, wizyta_id)
        VALUES(897877782131, 87213, 676821, 8766771)
INTO ZDIAGNOZOWANY_PROBLEM(id, zeby_id, katalog_problemow_id, wizyta_id)
        VALUES(789143771352, 34291, 347894, 7988311)
INTO ZDIAGNOZOWANY_PROBLEM(id, zeby_id, katalog_problemow_id, wizyta_id)
        VALUES(687783124086, 23253, 987899, 6123714)
INTO ZDIAGNOZOWANY_PROBLEM(id, zeby_id, katalog_problemow_id, wizyta_id)
        VALUES(453432413653, 78691, 277771, 1471152)
INTO ZDIAGNOZOWANY_PROBLEM(id, zeby_id, katalog_problemow_id, wizyta_id)
        VALUES(988788787897, 65552, 454521, 2871113)
SELECT * FROM dual;


INSERT ALL
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(8766771, 1234, 'Lekarz prowadzacy')
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(8766771, 3653, 'Asystent stomatologiczny')
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(7988311, 3456, 'Lekarz prowadzacy')
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(7988311, 6432, 'Asystent stomatologiczny')
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(6123714, 1234, 'Lekarz prowadzacy')
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(6123714, 3653, 'Asystent stomatologiczny')
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(1471152, 3456, 'Lekarz prowadzacy')
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(1471152, 6432, 'Asystent stomatologiczny')
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(2871113, 1234, 'Lekarz prowadzacy')
INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(2871113, 3653, 'Asystent stomatologiczny')
SELECT * FROM dual;

INSERT ALL
INTO LECZENIE(id, nazwa_leczenia, opis)
        VALUES(8789789789812, 'brak', 'brak')
INTO LECZENIE(id, nazwa_leczenia, opis)
        VALUES(6786767867867, 'brak', 'brak')
INTO LECZENIE(id, nazwa_leczenia, opis)
        VALUES(3878971000798, 'leczenie kanalowe zebow 6,7', 'calkowite wypelnienie kanalow zebow 6 i 7')
INTO LECZENIE(id, nazwa_leczenia, opis)
        VALUES(1789798991920, 'wstawienie implantow', 'Docelowe wstawienie u pacjenta implantow obu dolnych szostek')
INTO LECZENIE(id, nazwa_leczenia, opis)
        VALUES(2878911128837, 'brak', 'brak')
SELECT * FROM dual;



INSERT ALL
INTO KROK(id, nazwa_kroku, opis, leczenie_id)
        VALUES(67673426819, 'brak', 'brak', 8789789789812)
INTO KROK(id, nazwa_kroku, opis, leczenie_id)
        VALUES(38881232410, 'brak', 'brak', 6786767867867)
INTO KROK(id, nazwa_kroku, opis, leczenie_id)
        VALUES(56767123456, 'leczenie kanalowe lewej dolnej szóstki', 'brak', 3878971000798)
INTO KROK(id, nazwa_kroku, opis, leczenie_id)
        VALUES(27788143241, 'wstawienie implantu prawej dolnej szostki', 'brak', 1789798991920)
INTO KROK(id, nazwa_kroku, opis, leczenie_id)
        VALUES(89078700145, 'brak', 'brak', 2878911128837)
SELECT * FROM dual;

INSERT ALL
INTO KROKILECZENIA(krok_id, wizyta_id)
        VALUES(67673426819, 8766771)
INTO KROKILECZENIA(krok_id, wizyta_id)
        VALUES(38881232410, 7988311)
INTO KROKILECZENIA(krok_id, wizyta_id)
        VALUES(56767123456, 6123714)
INTO KROKILECZENIA(krok_id, wizyta_id)
        VALUES(27788143241, 1471152)
INTO KROKILECZENIA(krok_id, wizyta_id)
        VALUES(89078700145, 2871113)
SELECT * FROM dual;































        








        

