-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-18 17:58:06.927

-- tables
-- Table: Budynek
CREATE TABLE Budynek (
    Nazwa varchar2(100)  NOT NULL,
    Liczba_pieter integer  NOT NULL,
    Adres varchar2(100)  NOT NULL,
    CONSTRAINT Budynek_pk PRIMARY KEY (Nazwa)
) ;

-- Table: Dokument
CREATE TABLE Dokument (
    ID integer  NOT NULL,
    Opis varchar2(500)  NOT NULL,
    Lokalizacja varchar2(500)  NOT NULL,
    Pacjent_ID_pacjenta integer  NOT NULL,
    CONSTRAINT Dokument_pk PRIMARY KEY (ID)
) ;

-- Table: Katalog_problemow
CREATE TABLE Katalog_problemow (
    ID integer  NOT NULL,
    Nazwa_problemu varchar2(200)  NOT NULL,
    CONSTRAINT Katalog_problemow_pk PRIMARY KEY (ID)
) ;

-- Table: Krok
CREATE TABLE Krok (
    ID integer  NOT NULL,
    Nazwa_kroku varchar2(200)  NOT NULL,
    Opis varchar2(300)  NOT NULL,
    Leczenie_ID integer  NOT NULL,
    CONSTRAINT Krok_pk PRIMARY KEY (ID)
) ;

-- Table: KrokiLeczenia
CREATE TABLE KrokiLeczenia (
    Krok_ID integer  NOT NULL,
    Wizyta_ID integer  NOT NULL,
    CONSTRAINT KrokiLeczenia_pk PRIMARY KEY (Krok_ID,Wizyta_ID)
) ;

-- Table: Leczenie
CREATE TABLE Leczenie (
    ID integer  NOT NULL,
    Nazwa_leczenia varchar2(200)  NOT NULL,
    Opis varchar2(500)  NOT NULL,
    CONSTRAINT Leczenie_pk PRIMARY KEY (ID)
) ;

-- Table: Pacjent
CREATE TABLE Pacjent (
    ID_pacjenta integer  NOT NULL,
    Imie varchar2(100)  NOT NULL,
    Nazwisko varchar2(100)  NOT NULL,
    Adres varchar2(250)  NOT NULL,
    Telefon varchar2(12)  NOT NULL,
    E_mail varchar2(100)  NOT NULL,
    CONSTRAINT Pacjent_pk PRIMARY KEY (ID_pacjenta)
) ;

-- Table: Pracownik
CREATE TABLE Pracownik (
    ID integer  NOT NULL,
    Imie varchar2(100)  NOT NULL,
    Nazwisko varchar2(100)  NOT NULL,
    Data_urodzenia timestamp  NOT NULL,
    Adres varchar2(500)  NOT NULL,
    Telefon varchar2(12)  NOT NULL,
    Stanowisko_ID integer  NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (ID)
) ;

-- Table: Pracownik_podczas_wizyty
CREATE TABLE Pracownik_podczas_wizyty (
    Wizyta_IdRezerwacja integer  NOT NULL,
    Pracownik_ID integer  NOT NULL,
    Rola_pracownika varchar2(100)  NOT NULL,
    CONSTRAINT Pracownik_podczas_wizyty_pk PRIMARY KEY (Wizyta_IdRezerwacja,Pracownik_ID)
) ;

-- Table: Rezerwacja
CREATE TABLE Rezerwacja (
    IdRezerwacja integer  NOT NULL,
    ID_pacjenta integer  NOT NULL,
    DataRezerwacji timestamp  NOT NULL,
    CONSTRAINT Rezerwacja_pk PRIMARY KEY (IdRezerwacja)
) ;

-- Table: Sala
CREATE TABLE Sala (
    Nazwa varchar2(20)  NOT NULL,
    Pietro integer  NOT NULL,
    Budynek_Nazwa varchar2(100)  NOT NULL,
    CONSTRAINT Sala_pk PRIMARY KEY (Nazwa)
) ;

-- Table: Stanowisko
CREATE TABLE Stanowisko (
    ID integer  NOT NULL,
    Nazwa_stanowiska varchar2(50)  NOT NULL,
    CONSTRAINT Stanowisko_pk PRIMARY KEY (ID)
) ;

-- Table: Status_wizyty
CREATE TABLE Status_wizyty (
    ID integer  NOT NULL,
    Nazwa_statusu varchar2(100)  NOT NULL,
    CONSTRAINT Status_wizyty_pk PRIMARY KEY (ID)
) ;

-- Table: Wizyta
CREATE TABLE Wizyta (
    Sala_Nazwa varchar2(20)  NOT NULL,
    Cena integer  NOT NULL,
    Komentarz varchar2(500)  NOT NULL,
    IdRezerwacja integer  NOT NULL,
    CONSTRAINT Wizyta_pk PRIMARY KEY (IdRezerwacja)
) ;

-- Table: Zdiagnozowany_problem
CREATE TABLE Zdiagnozowany_problem (
    ID integer  NOT NULL,
    Zeby_ID integer  NULL,
    Katalog_problemow_ID integer  NOT NULL,
    Wizyta_ID integer  NOT NULL,
    CONSTRAINT Zdiagnozowany_problem_pk PRIMARY KEY (ID)
) ;

-- Table: Zeby
CREATE TABLE Zeby (
    ID integer  NOT NULL,
    Czy_zeby_dziecka char(1)  NOT NULL,
    Zeby varchar2(32)  NOT NULL,
    CONSTRAINT Zeby_pk PRIMARY KEY (ID)
) ;

-- foreign keys
-- Reference: Dokument_Pacjent (table: Dokument)
ALTER TABLE Dokument ADD CONSTRAINT Dokument_Pacjent
    FOREIGN KEY (Pacjent_ID_pacjenta)
    REFERENCES Pacjent (ID_pacjenta);

-- Reference: Krok_Leczenie (table: Krok)
ALTER TABLE Krok ADD CONSTRAINT Krok_Leczenie
    FOREIGN KEY (Leczenie_ID)
    REFERENCES Leczenie (ID);

-- Reference: Pracownik_Stanowisko (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Stanowisko
    FOREIGN KEY (Stanowisko_ID)
    REFERENCES Stanowisko (ID);

-- Reference: Rezerwacja_Pacjent (table: Rezerwacja)
ALTER TABLE Rezerwacja ADD CONSTRAINT Rezerwacja_Pacjent
    FOREIGN KEY (ID_pacjenta)
    REFERENCES Pacjent (ID_pacjenta);

-- Reference: Sala_Budynek (table: Sala)
ALTER TABLE Sala ADD CONSTRAINT Sala_Budynek
    FOREIGN KEY (Budynek_Nazwa)
    REFERENCES Budynek (Nazwa);

-- Reference: Table_25_Krok (table: KrokiLeczenia)
ALTER TABLE KrokiLeczenia ADD CONSTRAINT Table_25_Krok
    FOREIGN KEY (Krok_ID)
    REFERENCES Krok (ID);

-- Reference: Table_25_Wizyta (table: KrokiLeczenia)
ALTER TABLE KrokiLeczenia ADD CONSTRAINT Table_25_Wizyta
    FOREIGN KEY (Wizyta_ID)
    REFERENCES Wizyta (IdRezerwacja);

-- Reference: Table_28_Pracownik (table: Pracownik_podczas_wizyty)
ALTER TABLE Pracownik_podczas_wizyty ADD CONSTRAINT Table_28_Pracownik
    FOREIGN KEY (Pracownik_ID)
    REFERENCES Pracownik (ID);

-- Reference: Table_28_Wizyta (table: Pracownik_podczas_wizyty)
ALTER TABLE Pracownik_podczas_wizyty ADD CONSTRAINT Table_28_Wizyta
    FOREIGN KEY (Wizyta_IdRezerwacja)
    REFERENCES Wizyta (IdRezerwacja);

-- Reference: Wizyta_Rezerwacja (table: Wizyta)
ALTER TABLE Wizyta ADD CONSTRAINT Wizyta_Rezerwacja
    FOREIGN KEY (IdRezerwacja)
    REFERENCES Rezerwacja (IdRezerwacja);

-- Reference: Wizyta_Sala (table: Wizyta)
ALTER TABLE Wizyta ADD CONSTRAINT Wizyta_Sala
    FOREIGN KEY (Sala_Nazwa)
    REFERENCES Sala (Nazwa);

-- Reference: Wizyta_Status_wizyty (table: Wizyta)
ALTER TABLE Wizyta ADD CONSTRAINT Wizyta_Status_wizyty
    FOREIGN KEY (IdRezerwacja)
    REFERENCES Status_wizyty (ID);

-- Reference: Zdiagnozowany_problem_Katalog (table: Zdiagnozowany_problem)
ALTER TABLE Zdiagnozowany_problem ADD CONSTRAINT Zdiagnozowany_problem_Katalog
    FOREIGN KEY (Katalog_problemow_ID)
    REFERENCES Katalog_problemow (ID);

-- Reference: Zdiagnozowany_problem_Wizyta (table: Zdiagnozowany_problem)
ALTER TABLE Zdiagnozowany_problem ADD CONSTRAINT Zdiagnozowany_problem_Wizyta
    FOREIGN KEY (Wizyta_ID)
    REFERENCES Wizyta (IdRezerwacja);

-- Reference: Zdiagnozowany_problem_Zeby (table: Zdiagnozowany_problem)
ALTER TABLE Zdiagnozowany_problem ADD CONSTRAINT Zdiagnozowany_problem_Zeby
    FOREIGN KEY (Zeby_ID)
    REFERENCES Zeby (ID);

-- End of file.

