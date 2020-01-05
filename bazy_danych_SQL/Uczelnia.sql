CREATE DATABASE IF NOT EXISTS Uczelnia;

CREATE TABLE studenci(
	nr_indeksu INT NOT NULL,
  	imie CHAR(10),
  	nazwisko CHAR(20),
  	data_urodzenia DATE,
  	ID_adresu INT,
  	ID_wydzialu INT,
  	rok_studiow INT)
      PRIMARY KEY (nr_indeksu),
      ADD FOREIGN KEY (rok_studiow) REFERENCES oceny(rok_studiow),
      ADD FOREIGN KEY (ID_wydzialu) REFERENCES wydzialy(ID_wydzialu),
      ADD FOREIGN KEY (ID_adresu) REFERENCES adres(ID_adresu),
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci; /* sprawdzić co tu nie działa */

CREATE TABLE wykladowcy(
	ID_prowadzacego INT NOT NULL,
    tytul_zawodowy CHAR,
 	imie CHAR(10),
  	nazwisko CHAR(20),
  	ID_wydzialu INT,
    PRIMARY KEY (ID_prowadzacego),
    ADD FOREIGN KEY (ID_wydzialu) REFERENCES wydzialy(ID_wydzialu))
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE wydzialy(
    ID_wydzialu INT NOT NULL,
    nazwa_wydzialu CHAR,
    ID_kierunku INT,
    PRIMARY KEY (ID_wydzialu),
    ADD FOREIGN KEY (ID_kierunku) REFERENCES przedmioty(ID_kierunku))
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE przedmioty(
    ID_kierunku INT NOT NULL,
    ID_prowadzacego INT,
    nazwa_kierunku CHAR,
    ID_przedmiotu INT,
    PRIMARY KEY (ID_kierunku),
    ADD FOREIGN KEY (ID_przedmiotu) REFERENCES oceny(ID_przedmiotu))
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE oceny(
    ID_przedmiotu INT NOT NULL,
    nr_indeksu INT,
    rok_studiow INT,
    nazwa_przedmiotu CHAR,
    ocena_kolokwium_1 FLOAT(6,2),
    ocena_kolokwium_2 FLOAT(6,2),
    ocena_kolokwium_3 FLOAT(6,2),
    zaliczenie BOOLEAN,
    egazmin FLOAT,
    PRIMARY KEY (ID_przedmiotu),
    ADD FOREIGN KEY (nr_indeksu) REFERENCES studenci(nr_indeksu),
    ADD FOREIGN KEY (rok_studiow) REFERENCES studenci(rok_studiow))
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE adres(
    ID_adresu INT NOT NULL,
    wojewodztwo CHAR,
    miejscowosc CHAR,
    ulica CHAR,
    nr_domu INT,
    nr_lokalu INT,
    PRIMARY KEY (ID_adresu))
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;