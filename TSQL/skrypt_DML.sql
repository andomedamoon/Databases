


INSERT INTO STANOWISKO (id, nazwa_stanowiska)
        VALUES (11, 'Dentysta'),
               (12, 'Asystent');

INSERT INTO PRACOWNIK (id, imie, nazwisko, data_urodzenia, adres, telefon, stanowisko_id)
        VALUES (1234, 'Adam', 'Majewski','1978-12-11', 'Warszawa', '444221456', 11),
               (3456, 'Norbert', 'Sadowski','1980-06-12', 'Otwock', '453434218', 11),
               (3653, 'Magdalena', 'Nowak','1986-04-01', 'Legionowo', '412453117', 12),
               (6432, 'Dorota', 'Kowalczyk','1989-07-16', 'Warszawa', '221445175', 12);


INSERT INTO PACJENT (id_pacjenta, imie, nazwisko, adres, telefon, e_mail)
        VALUES (45323344, 'Jan', 'Magiera', 'Warszawa', 343788111, 'jan.magiera@gmail.com'),
               (34328978, 'Agata', 'Michalak', 'Piaseczno', 343421584, 'agata.michalak@gmail.com'),
               (78788988, 'Marek', 'Rogalski', 'Siedlce', 343554183, 'marek.rogalski@wp.pl'),
               (23144555, 'Dariusz', 'Zawadzki', 'Sochaczew', 343556587, 'dariusz.zawadzki@op.pl'),
               (65663312, 'Ewelina', 'Smolarek', 'Radzymin', 343897893, 'ewelina.smolarek@yahoo.com');

INSERT INTO DOKUMENT (id, opis, lokalizacja, pacjent_id_pacjenta)
        VALUES(232, 'Rentgen szczęki', 'Pokój nr 6', 45323344),
			  (233, 'Rentgen szczęki', 'Pokoj nr 6', 34328978),
			  (234, 'Rentgen szczęki', 'Pokoj nr 6', 78788988),
			  (235, 'Recepta', 'Pokoj nr 6', 23144555),
			   (236, 'Recepta', 'Pokój nr 6', 65663312);

INSERT INTO BUDYNEK (nazwa, liczba_pieter, adres)
        VALUES ('Klinika dentystyczna Rajdent', 2, 'ul. Losowa 34');


INSERT INTO SALA(nazwa, pietro, budynek_nazwa)
        VALUES('Recepcja', 1, 'Klinika dentystyczna Rajdent'),
			  ('Pokój nr 1', 1, 'Klinika dentystyczna Rajdent'),
			  ('Pokój nr 2', 1, 'Klinika dentystyczna Rajdent'),
			  ('Pokój nr 3', 1, 'Klinika dentystyczna Rajdent'),
			  ('Pokój nr 4', 2, 'Klinika dentystyczna Rajdent'),
		      ('Pokój nr 5', 2, 'Klinika dentystyczna Rajdent'),
		      ('Pokój nr 6', 2, 'Klinika dentystyczna Rajdent');


INSERT INTO KATALOG_PROBLEMOW(id, nazwa_problemu)
        VALUES(676821, 'pacjent przed wizyta'),
			  (347894, 'pacjent przed wizyta'),
			  (987899, 'ból zęba (6)'),
			  (277771, 'Wstawienie implantów'),
			  (454521, 'wizyta nie odbyta');

INSERT INTO ZEBY(id, czy_zeby_dziecka, zeby)
        VALUES(87213, 'N', 'W trakcie leczenia'),
			  (34291, 'T', 'W trakcie leczenia'),
              (23253, 'N', 'Po leczeniu'),
              (78691, 'N', 'Po leczeniu'),
              (65552, 'N', 'Przed badaniem');
		 

INSERT INTO REZERWACJA(idRezerwacja, id_pacjenta, dataRezerwacji)
        VALUES(8766771, 45323344,'2022-02-25 11:30'),
			  (7988311, 34328978,'2022-02-27 14:00'),
			  (6123714, 78788988,'2022-01-07 12:00'),
			  (1471152, 23144555,'2022-02-15 13:00'),
			  (2871113, 65663312,'2022-02-16 16:30');

INSERT INTO STATUS_WIZYTY(id, nazwa_statusu)
        VALUES(8766771, 'ZAREZERWOWANA'),
			  (7988311, 'ZAREZERWOWANA'),
			  (6123714, 'ODBYTA'),
			  (1471152, 'ODBYTA'),
			  (2871113, 'ODWOLANA');


INSERT INTO WIZYTA(sala_nazwa, cena, komentarz, idRezerwacja)
        VALUES('Pokój nr 1', 0, 'brak',8766771),
			  ('Pokój nr 2', 0, 'pacjent niepelnosprawny',7988311),
			  ('Pokój nr 3', 4000, 'brak',6123714),
			  ('Pokój nr 4', 500, 'brak',1471152),
			  ('Pokój nr 2', 0, 'brak',2871113);



INSERT INTO ZDIAGNOZOWANY_PROBLEM(id, zeby_id, katalog_problemow_id, wizyta_id)
        VALUES(897877782131, 87213, 676821, 8766771),
			  (789143771352, 34291, 347894, 7988311),
              (687783124086, 23253, 987899, 6123714),
              (453432413653, 78691, 277771, 1471152),
              (988788787897, 65552, 454521, 2871113);


INSERT INTO PRACOWNIK_PODCZAS_WIZYTY(wizyta_idRezerwacja, pracownik_id, rola_pracownika)
        VALUES(8766771, 1234, 'Lekarz prowadzacy'),
			  (8766771, 3653, 'Asystent stomatologiczny'),
			  (7988311, 3456, 'Lekarz prowadzacy'),
			  (7988311, 6432, 'Asystent stomatologiczny'),
			  (6123714, 1234, 'Lekarz prowadzacy'),
			  (6123714, 3653, 'Asystent stomatologiczny'),
			  (1471152, 3456, 'Lekarz prowadzacy'),
			  (1471152, 6432, 'Asystent stomatologiczny'),
			  (2871113, 1234, 'Lekarz prowadzacy'),
			  (2871113, 3653, 'Asystent stomatologiczny');

INSERT INTO LECZENIE(id, nazwa_leczenia, opis)
        VALUES(8789789789812, 'brak', 'brak'),
			  (6786767867867, 'brak', 'brak'),
			  (3878971000798, 'leczenie kanalowe zebow 6,7', 'calkowite wypelnienie kanalow zebow 6 i 7'),
			  (1789798991920, 'wstawienie implantow', 'Docelowe wstawienie u pacjenta implantow obu dolnych szostek'),
			  (2878911128837, 'brak', 'brak');



INSERT INTO KROK(id, nazwa_kroku, opis, leczenie_id)
        VALUES(67673426819, 'brak', 'brak', 8789789789812),
			  (38881232410, 'brak', 'brak', 6786767867867),
			  (56767123456, 'leczenie kanalowe lewej dolnej szóstki', 'brak', 3878971000798),
			  (27788143241, 'wstawienie implantu prawej dolnej szostki', 'brak', 1789798991920),
			  (89078700145, 'brak', 'brak', 2878911128837);

INSERT INTO KROKILECZENIA(krok_id, wizyta_id)
        VALUES(67673426819, 8766771),
			  (38881232410, 7988311),
			  (56767123456, 6123714),
			  (27788143241, 1471152),
			  (89078700145, 2871113);




























        








        

