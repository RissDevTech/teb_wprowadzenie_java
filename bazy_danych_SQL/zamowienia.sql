-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 01 Gru 2019, 14:07
-- Wersja serwera: 10.1.38-MariaDB
-- Wersja PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zamowienia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres`
--

CREATE TABLE `adres` (
  `ulica` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `numermieszkania` int(11) DEFAULT NULL,
  `numerdomu` int(11) DEFAULT NULL,
  `miejscowosc_ID` int(11) DEFAULT NULL,
  `IDadres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID_klienta` int(11) NOT NULL,
  `imie` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `wiek` int(11) DEFAULT NULL,
  `adresID` int(11) DEFAULT NULL,
  `plecID` int(11) DEFAULT NULL,
  `zawodID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klientplec`
--

CREATE TABLE `klientplec` (
  `ID_plec` int(11) NOT NULL,
  `plec` char(1) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klientzawod`
--

CREATE TABLE `klientzawod` (
  `ID_zawod` int(11) NOT NULL,
  `zawod` char(1) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejscowosci`
--

CREATE TABLE `miejscowosci` (
  `nazwa` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `kodpocztowy` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `wojewodztwo_ID` int(11) DEFAULT NULL,
  `IDmiejscowosci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `ID_przedmiotu` int(11) NOT NULL,
  `przedmiot` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `cena` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wojewodztwa`
--

CREATE TABLE `wojewodztwa` (
  `ID_mojewodztwa` int(11) NOT NULL,
  `Nazwa` char(1) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `klientID` int(11) DEFAULT NULL,
  `przedmiot_ID` int(11) DEFAULT NULL,
  `numerzamowienia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adres`
--
ALTER TABLE `adres`
  ADD PRIMARY KEY (`IDadres`),
  ADD KEY `miejscowosc_ID` (`miejscowosc_ID`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_klienta`),
  ADD KEY `adresID` (`adresID`),
  ADD KEY `plecID` (`plecID`),
  ADD KEY `zawodID` (`zawodID`);

--
-- Indeksy dla tabeli `klientplec`
--
ALTER TABLE `klientplec`
  ADD PRIMARY KEY (`ID_plec`);

--
-- Indeksy dla tabeli `klientzawod`
--
ALTER TABLE `klientzawod`
  ADD PRIMARY KEY (`ID_zawod`);

--
-- Indeksy dla tabeli `miejscowosci`
--
ALTER TABLE `miejscowosci`
  ADD PRIMARY KEY (`IDmiejscowosci`),
  ADD KEY `wojewodztwo_ID` (`wojewodztwo_ID`);

--
-- Indeksy dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`ID_przedmiotu`);

--
-- Indeksy dla tabeli `wojewodztwa`
--
ALTER TABLE `wojewodztwa`
  ADD PRIMARY KEY (`ID_mojewodztwa`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`numerzamowienia`),
  ADD KEY `klientID` (`klientID`),
  ADD KEY `przedmiot_ID` (`przedmiot_ID`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `adres`
--
ALTER TABLE `adres`
  ADD CONSTRAINT `adres_ibfk_1` FOREIGN KEY (`miejscowosc_ID`) REFERENCES `miejscowosci` (`IDmiejscowosci`);

--
-- Ograniczenia dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD CONSTRAINT `klienci_ibfk_1` FOREIGN KEY (`adresID`) REFERENCES `adres` (`IDadres`),
  ADD CONSTRAINT `klienci_ibfk_2` FOREIGN KEY (`plecID`) REFERENCES `klientplec` (`ID_plec`),
  ADD CONSTRAINT `klienci_ibfk_3` FOREIGN KEY (`zawodID`) REFERENCES `klientzawod` (`ID_zawod`);

--
-- Ograniczenia dla tabeli `miejscowosci`
--
ALTER TABLE `miejscowosci`
  ADD CONSTRAINT `miejscowosci_ibfk_1` FOREIGN KEY (`wojewodztwo_ID`) REFERENCES `wojewodztwa` (`ID_mojewodztwa`);

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`klientID`) REFERENCES `klienci` (`ID_klienta`),
  ADD CONSTRAINT `zamowienie_ibfk_2` FOREIGN KEY (`przedmiot_ID`) REFERENCES `przedmiot` (`ID_przedmiotu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
