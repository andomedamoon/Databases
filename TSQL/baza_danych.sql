-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-19 20:30:40.847

-- tables
-- Table: Budynek
CREATE TABLE Budynek (
    Nazwa varchar(100)  NOT NULL,
    Liczba_pieter int  NOT NULL,
    Adres varchar(100)  NOT NULL,
    CONSTRAINT Budynek_pk PRIMARY KEY  (Nazwa)
);

-- Table: Dokument
CREATE TABLE Dokument (
    ID int  NOT NULL,
    Opis varchar(500)  NOT NULL,
    Lokalizacja varchar(500)  NOT NULL,
    Pacjent_ID_pacjenta int  NOT NULL,
    CONSTRAINT Dokument_pk PRIMARY KEY  (ID)
);

-- Table: Katalog_problemow
CREATE TABLE Katalog_problemow (
    ID int  NOT NULL,
    Nazwa_problemu varchar(200)  NOT NULL,
    CONSTRAINT Katalog_problemow_pk PRIMARY KEY  (ID)
);

-- Table: Krok
CREATE TABLE Krok (
    ID bigint  NOT NULL,
    Nazwa_kroku varchar(200)  NOT NULL,
    Opis varchar(300)  NOT NULL,
    Leczenie_ID bigint  NOT NULL,
    CONSTRAINT Krok_pk PRIMARY KEY  (ID)
);

-- Table: KrokiLeczenia
CREATE TABLE KrokiLeczenia (
    Krok_ID bigint  NOT NULL,
    Wizyta_ID int  NOT NULL,
    CONSTRAINT KrokiLeczenia_pk PRIMARY KEY  (Krok_ID,Wizyta_ID)
);

-- Table: Leczenie
CREATE TABLE Leczenie (
    ID bigint  NOT NULL,
    Nazwa_leczenia varchar(200)  NOT NULL,
    Opis varchar(500)  NOT NULL,
    CONSTRAINT Leczenie_pk PRIMARY KEY  (ID)
);

-- Table: Pacjent
CREATE TABLE Pacjent (
    ID_pacjenta int  NOT NULL,
    Imie varchar(100)  NOT NULL,
    Nazwisko varchar(100)  NOT NULL,
    Adres varchar(250)  NOT NULL,
    Telefon varchar(12)  NOT NULL,
    E_mail varchar(100)  NOT NULL,
    CONSTRAINT Pacjent_pk PRIMARY KEY  (ID_pacjenta)
);

-- Table: Pracownik
CREATE TABLE Pracownik (
    ID int  NOT NULL,
    Imie varchar(100)  NOT NULL,
    Nazwisko varchar(100)  NOT NULL,
    Data_urodzenia date  NOT NULL,
    Adres varchar(500)  NOT NULL,
    Telefon varchar(12)  NOT NULL,
    Stanowisko_ID int  NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY  (ID)
);

-- Table: Pracownik_podczas_wizyty
CREATE TABLE Pracownik_podczas_wizyty (
    Wizyta_IdRezerwacja int  NOT NULL,
    Pracownik_ID int  NOT NULL,
    Rola_pracownika varchar(100)  NOT NULL,
    CONSTRAINT Pracownik_podczas_wizyty_pk PRIMARY KEY  (Wizyta_IdRezerwacja,Pracownik_ID)
);

-- Table: Rezerwacja
CREATE TABLE Rezerwacja (
    IdRezerwacja int  NOT NULL,
    ID_pacjenta int  NOT NULL,
    DataRezerwacji datetime  NOT NULL,
    CONSTRAINT Rezerwacja_pk PRIMARY KEY  (IdRezerwacja)
);

-- Table: Sala
CREATE TABLE Sala (
    Nazwa varchar(20)  NOT NULL,
    Pietro int  NOT NULL,
    Budynek_Nazwa varchar(100)  NOT NULL,
    CONSTRAINT Sala_pk PRIMARY KEY  (Nazwa)
);

-- Table: Stanowisko
CREATE TABLE Stanowisko (
    ID int  NOT NULL,
    Nazwa_stanowiska varchar(50)  NOT NULL,
    CONSTRAINT Stanowisko_pk PRIMARY KEY  (ID)
);

-- Table: Status_wizyty
CREATE TABLE Status_wizyty (
    ID int  NOT NULL,
    Nazwa_statusu varchar(100)  NOT NULL,
    CONSTRAINT Status_wizyty_pk PRIMARY KEY  (ID)
);

-- Table: Wizyta
CREATE TABLE Wizyta (
    Sala_Nazwa varchar(20)  NOT NULL,
    Cena int  NOT NULL,
    Komentarz varchar(500)  NOT NULL,
    IdRezerwacja int  NOT NULL,
    CONSTRAINT Wizyta_pk PRIMARY KEY  (IdRezerwacja)
);

-- Table: Zdiagnozowany_problem
CREATE TABLE Zdiagnozowany_problem (
    ID bigint  NOT NULL,
    Zeby_ID int  NULL,
    Katalog_problemow_ID int  NOT NULL,
    Wizyta_ID int  NOT NULL,
    CONSTRAINT Zdiagnozowany_problem_pk PRIMARY KEY  (ID)
);

-- Table: Zeby
CREATE TABLE Zeby (
    ID int  NOT NULL,
    Czy_zeby_dziecka char(1)  NOT NULL,
    Zeby varchar(32)  NOT NULL,
    CONSTRAINT Zeby_pk PRIMARY KEY  (ID)
);

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

