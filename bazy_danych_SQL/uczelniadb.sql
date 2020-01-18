-- Baza danych: 'uczelniadb'

DROP DATABASE IF EXISTS uczelniadb;

CREATE DATABASE uczelniadb
DEFAULT CHARACTER
SET utf8;

USE uczelniadb;

CREATE TABLE uczelniadb.studenci
(
    nr_indeksu INT NOT NULL,
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    data_urodzenia DATE,
    ID_adresu INT,
    ID_wydzialu INT,
    PRIMARY KEY (nr_indeksu)
);

CREATE TABLE uczelniadb.wykladowcy
(
    ID_prowadzacego INT NOT NULL,
    tytul_zawodowy VARCHAR(30),
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    ID_wydzialu INT,
    PRIMARY KEY (ID_prowadzacego)
);

CREATE TABLE uczelniadb.wydzialy
(
    ID_wydzialu INT NOT NULL,
    nazwa_wydzialu VARCHAR(30),
    ID_kierunku INT,
    PRIMARY KEY (ID_wydzialu)
);

CREATE TABLE uczelniadb.przedmioty
(
    ID_przedmiotu INT NOT NULL,
    nazwa_przedmiotu VARCHAR(30),
    ID_kierunku INT,
    ID_prowadzacego INT,
    PRIMARY KEY (ID_przedmiotu)
);

CREATE TABLE uczelniadb.oceny
(
    ID_przedmiotu INT,
    nr_indeksu INT,
    ocena_kolokwium_1 FLOAT(6,2),
    ocena_kolokwium_2 FLOAT(6,2),
    ocena_kolokwium_3 FLOAT(6,2)
);

CREATE TABLE uczelniadb.kierunki
(
    ID_kierunku INT NOT NULL,
    nazwa CHAR(50),
    ID_wydzialu INT,
    PRIMARY KEY (ID_kierunku)
);

CREATE TABLE uczelniadb.adres
(
    ID_adresu INT NOT NULL,
    wojewodztwo CHAR(30),
    miejscowosc CHAR(30),
    ulica CHAR(30),
    nr_domu INT,
    nr_lokalu INT,
    PRIMARY KEY (ID_adresu)
);

INSERT INTO wydzialy
    (ID_wydzialu, nazwa_wydzialu, ID_kierunku)
VALUES
    (1, 'Wydział Techniki Morskiej', 1),
    (2, 'Wydział Humanistyczny', 2);

INSERT INTO studenci
    (nr_indeksu, imie, nazwisko, data_urodzenia, ID_adresu, ID_wydzialu)
VALUES
    ('395185', 'Jan', 'Kowalski', '1990-02-20', 1, 1),
    ('638971', 'Ignacy', 'Krawężnik', '1995-06-14', 2, 2),
    ('457184', 'Karol', 'Wielki', '1999-01-03', 3, 1),
    ('469365', 'Adrian', 'Pałka', '1994-07-28', 4, 1),
    ('167639', 'Jakub', 'Kabel', '1995-06-22', 5, 2),
    ('538614', 'Abdul', 'Abulaha', '1993-12-02', 6, 2);

INSERT INTO kierunki
    (ID_kierunku, nazwa, ID_wydzialu)
VALUES
    (1, 'Eksploatacja Siłowni Okrętowych', 1),
    (2, 'Politologia', 2);

INSERT INTO adres
    (ID_adresu, wojewodztwo, miejscowosc, ulica, nr_domu, nr_lokalu)
VALUES
    (1, 'zachodniopomorskie', 'Szczecin', 'Jagiellońska', 3, 1),
    (2, 'zachodniopomorskie', 'Szczecin', 'Mieszka I', 23, 8),
    (3, 'wielkopolskie', 'Poznań', 'Mickiewicza', 5, 16),
    (4, 'zachodniopomorskie', 'Stargard', 'Długa', 45, 12),
    (5, 'wielkopolskie', 'Oborniki', 'Kręta', 3, 34),
    (6, 'pomorskie', 'Gdańsk', 'Okopowa', 2, 45);

INSERT INTO wykladowcy
    (ID_prowadzacego, tytul_zawodowy, imie, nazwisko, ID_wydzialu)
VALUES
    (1, 'kpt. ż. m. dr inż.', 'Dariusz', 'Nowak', 1),
    (2, 'kpt. ż. w. prof. dr hab. inż', 'Marian', 'Kapusta', 1),
    (3, 'mgr', 'Beata', 'Raskolnikov', 2),
    (4, 'dr', 'Mieczysław', 'Sienkiewicz', 2);

INSERT INTO przedmioty
    (ID_przedmiotu, nazwa_przedmiotu, ID_kierunku, ID_prowadzacego)
VALUES
    (1, 'Termodynamika techniczna', 1, 1),
    (2, 'Maszyny i napędy elektryczne', 1, 2),
    (3, 'Filozofia', 2, 3),
    (4, 'Współczesna myśl polityczna', 2, 4);

INSERT INTO oceny
    (ID_przedmiotu, nr_indeksu, ocena_kolokwium_1, ocena_kolokwium_2, ocena_kolokwium_3)
VALUES
    (1, '395185', 5, 4.5, 5),
    (1, '457184', 4.5, 4, 5),
    (1, '469365', 3, 3.5, 3),
    (2, '395185', 4.5, 4.5, 4.5),
    (2, '457184', 5, 4, 4),
    (2, '469365', 3, 3, 2),
    (3, '638971', 4, 5, 4),
    (3, '167639', 4.5, 5, 3.5),
    (3, '538614', 2, 5, 4),
    (4, '638971', 4.5, 4, 4),
    (4, '167639', 4, 3.5, 5),
    (4, '538614', 4, 3.5, 4.5);

ALTER TABLE uczelniadb.studenci
    ADD FOREIGN KEY (ID_wydzialu) REFERENCES wydzialy(ID_wydzialu);
ALTER TABLE uczelniadb.studenci
    ADD FOREIGN KEY (ID_adresu) REFERENCES adres(ID_adresu);
ALTER TABLE uczelniadb.wykladowcy
    ADD FOREIGN KEY (ID_wydzialu) REFERENCES wydzialy(ID_wydzialu);
ALTER TABLE uczelniadb.wydzialy
    ADD FOREIGN KEY (ID_kierunku) REFERENCES kierunki(ID_kierunku);
ALTER TABLE uczelniadb.przedmioty
    ADD FOREIGN KEY (ID_kierunku) REFERENCES kierunki(ID_kierunku);
ALTER TABLE uczelniadb.przedmioty
    ADD FOREIGN KEY (ID_prowadzacego) REFERENCES wykladowcy(ID_prowadzacego);
ALTER TABLE uczelniadb.oceny
    ADD FOREIGN KEY (nr_indeksu) REFERENCES studenci(nr_indeksu);
ALTER TABLE uczelniadb.oceny
    ADD FOREIGN KEY (ID_przedmiotu) REFERENCES przedmioty(ID_przedmiotu);
ALTER TABLE uczelniadb.kierunki
    ADD FOREIGN KEY (ID_wydzialu) REFERENCES wydzialy(ID_wydzialu);