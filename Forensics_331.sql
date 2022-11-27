-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2022 at 06:47 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forensics_331`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `number_of_cases` (`officer` VARCHAR(255)) RETURNS INT(11) BEGIN
    DECLARE case_count int;
    
    SELECT count(CaseID) into case_count
FROM CASES
WHERE LeadingOfficer = officer;
    
RETURN case_count;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `number_of_criminals` (`stat` VARCHAR(255)) RETURNS INT(11) BEGIN
    DECLARE c int;
    
    SELECT count(CID) into c
FROM Criminal
WHERE CurrentStatus = stat;
    
RETURN c;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `automobile`
--

CREATE TABLE `automobile` (
  `CaseID` varchar(255) DEFAULT NULL,
  `AID` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Manufacturer` varchar(255) DEFAULT NULL,
  `typeOfVehicle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `automobile`
--

INSERT INTO `automobile` (`CaseID`, `AID`, `model`, `Year`, `Manufacturer`, `typeOfVehicle`) VALUES
('T22', 'IR32', 'Model S', 2019, 'Tesla', 'Sedan'),
('T22', 'TWQ123', 'Model X', 2018, 'Tesla', 'Sedan');

-- --------------------------------------------------------

--
-- Table structure for table `ballistics`
--

CREATE TABLE `ballistics` (
  `CaseID` varchar(255) DEFAULT NULL,
  `B_ID` varchar(255) NOT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Manufacturer` varchar(255) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `typeOfGun` varchar(255) DEFAULT NULL,
  `gauge` float DEFAULT NULL,
  `caliber` int(11) DEFAULT NULL,
  `CountryOfOrigin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ballistics`
--

INSERT INTO `ballistics` (`CaseID`, `B_ID`, `Model`, `Manufacturer`, `Year`, `typeOfGun`, `gauge`, `caliber`, `CountryOfOrigin`) VALUES
('M981', 'H39', 'Automag II', 'AMT', 1970, 'Handgun', 410, 9, 'USA'),
('M981', 'H9', 'Glock 21', 'Glock', 1970, 'Handgun', -1, 10, 'Austria'),
('M46', 'S123PW', 'Glock 20', 'Glock', 1980, 'Pistol', 9, -1, 'Austria'),
('M981', 'SH09', 'Benneli M1', 'Benneli Armi', 1986, 'Shotgun', 20, -1, 'Italy'),
('M981', 'SH23', 'Benneli M3', 'Benneli Armi', 1989, 'Shotgun', 20, -1, 'Italy');

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `CaseID` varchar(255) NOT NULL,
  `TypeOfCase` varchar(255) DEFAULT NULL,
  `NameOfCase` varchar(255) DEFAULT NULL,
  `LeadingOfficer` varchar(255) DEFAULT NULL,
  `AsstOfficer` varchar(255) DEFAULT NULL,
  `TimeOfReport` datetime NOT NULL,
  `Loc` varchar(255) DEFAULT NULL,
  `statusOfCase` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`CaseID`, `TypeOfCase`, `NameOfCase`, `LeadingOfficer`, `AsstOfficer`, `TimeOfReport`, `Loc`, `statusOfCase`) VALUES
('KSFHG12', 'Murder', 'Polten Murder', 'Jake Peralta', 'Amy Santiago', '2022-11-25 08:48:01', 'Brooklyn', 'ongoing'),
('M46', 'Murder', 'Tuomi Murder', 'Ray Holt', 'Charles Boyle', '2022-11-20 13:49:08', 'Milwaukee', 'Archived'),
('M53', 'Murder', 'Ann Heally Murder', 'Amy Santiago', 'Gina Linetti', '2022-11-20 13:51:28', 'Washington', 'Ongoing'),
('M981', 'Murder', 'Capo Murder', 'Jake Peralta', 'Amy Santiago', '2022-11-20 14:16:28', 'Chicago', 'Ongoing'),
('QT09P1', 'Theft', 'Greenlane 15 Robbery', 'Michaela Stone', 'Jared Vasquez', '2022-11-20 17:48:20', 'Brooklyn', 'Ongoing'),
('T22', 'Theft', 'Private Jet Theft', 'Jake Peralta', 'Charles Boyle', '2022-11-20 13:54:59', 'New York', 'Archived');

--
-- Triggers `cases`
--
DELIMITER $$
CREATE TRIGGER `delCase` BEFORE DELETE ON `cases` FOR EACH ROW BEGIN
    delete from CriminalCase where CrimeID = old.CaseID;
    delete from DRUGS where CaseID = old.CaseID;
    delete from BALLISTICS where CaseID = old.CaseID;
    delete from PAINT where CaseID = old.CaseID;
    delete from AUTOMOBILE where CaseID = old.CaseID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `criminal`
--

CREATE TABLE `criminal` (
  `CID` varchar(255) NOT NULL,
  `CName` varchar(255) NOT NULL,
  `Alias` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `NoOfCases` int(11) DEFAULT NULL,
  `DominantHand` varchar(255) DEFAULT NULL,
  `CurrentStatus` varchar(255) DEFAULT NULL,
  `DNAID` varchar(50) DEFAULT NULL,
  `FingerprintID` varchar(50) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criminal`
--

INSERT INTO `criminal` (`CID`, `CName`, `Alias`, `Age`, `NoOfCases`, `DominantHand`, `CurrentStatus`, `DNAID`, `FingerprintID`, `nationality`) VALUES
('ZK53', 'Jeffrey Dahmer', 'Milwaukee Cannibal', 25, 17, 'Left', 'Dead', 'OERNO123JG', 'ZWGKGJ123DFOG', 'American');

--
-- Triggers `criminal`
--
DELIMITER $$
CREATE TRIGGER `delCriminal` BEFORE DELETE ON `criminal` FOR EACH ROW BEGIN
    DECLARE id, criminalname, a, d, n varchar(255);
    DECLARE ncases int;
    DECLARE c1 CURSOR FOR SELECT CID, CName, Alias, NoOfCases, DominantHand, nationality from CRIMINAL where CID = old.CID;
    open c1;
    fetch c1 into id, criminalname, a, ncases, d, n;
    insert into criminalBackup values(id, criminalName, a, ncases, d, n);
    close c1;
    delete from CriminalCase where CriminalID = old.CID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `criminalbackup`
--

CREATE TABLE `criminalbackup` (
  `ID` varchar(255) DEFAULT NULL,
  `CriminalName` varchar(255) DEFAULT NULL,
  `Alias` varchar(255) DEFAULT NULL,
  `NoOfCases` int(11) DEFAULT NULL,
  `dominantHand` varchar(255) DEFAULT NULL,
  `Nationality` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criminalbackup`
--

INSERT INTO `criminalbackup` (`ID`, `CriminalName`, `Alias`, `NoOfCases`, `dominantHand`, `Nationality`) VALUES
(NULL, 'Luke Wrenner', 'Sticky Fingers', 2, 'Right', 'American'),
(NULL, 'Anna Sorokin', 'Anna Delvey', 6, 'Unknown', 'German'),
('RX12', 'Ted Bundy', 'Lady Killer', 50, 'Left', 'American'),
('213FD', 'Joe Palmer', 'None', 1, 'Unknown', 'Russian');

-- --------------------------------------------------------

--
-- Table structure for table `criminalcase`
--

CREATE TABLE `criminalcase` (
  `CriminalID` varchar(255) DEFAULT NULL,
  `CrimeID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criminalcase`
--

INSERT INTO `criminalcase` (`CriminalID`, `CrimeID`) VALUES
('ZK53', 'M46');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `CaseID` varchar(255) DEFAULT NULL,
  `NDC_No` varchar(255) NOT NULL,
  `dname` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `narcotic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`CaseID`, `NDC_No`, `dname`, `color`, `class`, `narcotic`) VALUES
('T22', '6745103120', 'Lexapro', 'blue', 'analgesic', 'yes'),
('M53', '6745718120', 'Ketamine', 'white', 'inhalants', 'yes'),
('M981', '6998813120', 'Heroin', 'white', 'opioid', 'no'),
('QT09P1', '8861238761', 'Axypenetril', 'Pink', 'Hallucinogins', 'no'),
('QT09P1', '97234698', 'Nescipixinol', 'Green', 'Inhalants', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `paint`
--

CREATE TABLE `paint` (
  `CaseID` varchar(255) DEFAULT NULL,
  `PID` varchar(255) NOT NULL,
  `Color` varchar(255) NOT NULL,
  `Solvent` varchar(255) DEFAULT NULL,
  `Binder` varchar(255) DEFAULT NULL,
  `Pigments` varchar(255) DEFAULT NULL,
  `Additive` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paint`
--

INSERT INTO `paint` (`CaseID`, `PID`, `Color`, `Solvent`, `Binder`, `Pigments`, `Additive`) VALUES
('M53', 'B349', 'Black', 'Benzene', 'Linseed Oil', 'Chromium', 'Penetrol'),
('QT09P1', 'QW11', 'White', 'Toluene', 'Linseed Oil', 'Cadmium', 'Penetrol'),
('T22', 'R041', 'Red', 'Benzene', 'Linseed Oil', 'Cadmium', 'Penetrol'),
('M53', 'R09', 'Yellow', 'Toluene', 'Linseed Oil', 'Casein', 'Fleotrol');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `automobile`
--
ALTER TABLE `automobile`
  ADD PRIMARY KEY (`AID`),
  ADD KEY `CaseID` (`CaseID`);

--
-- Indexes for table `ballistics`
--
ALTER TABLE `ballistics`
  ADD PRIMARY KEY (`B_ID`),
  ADD UNIQUE KEY `B_ID` (`B_ID`),
  ADD KEY `CaseID` (`CaseID`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`CaseID`),
  ADD UNIQUE KEY `CaseID` (`CaseID`);

--
-- Indexes for table `criminal`
--
ALTER TABLE `criminal`
  ADD PRIMARY KEY (`CID`),
  ADD UNIQUE KEY `CID` (`CID`);

--
-- Indexes for table `criminalcase`
--
ALTER TABLE `criminalcase`
  ADD KEY `CriminalID` (`CriminalID`),
  ADD KEY `CrimeID` (`CrimeID`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`NDC_No`),
  ADD UNIQUE KEY `NDC_No` (`NDC_No`),
  ADD KEY `CaseID` (`CaseID`);

--
-- Indexes for table `paint`
--
ALTER TABLE `paint`
  ADD PRIMARY KEY (`PID`),
  ADD UNIQUE KEY `PID` (`PID`),
  ADD KEY `CaseID` (`CaseID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `automobile`
--
ALTER TABLE `automobile`
  ADD CONSTRAINT `automobile_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `cases` (`CaseID`);

--
-- Constraints for table `ballistics`
--
ALTER TABLE `ballistics`
  ADD CONSTRAINT `ballistics_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `cases` (`CaseID`);

--
-- Constraints for table `criminalcase`
--
ALTER TABLE `criminalcase`
  ADD CONSTRAINT `criminalcase_ibfk_1` FOREIGN KEY (`CriminalID`) REFERENCES `criminal` (`CID`),
  ADD CONSTRAINT `criminalcase_ibfk_2` FOREIGN KEY (`CrimeID`) REFERENCES `cases` (`CaseID`);

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `drugs_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `cases` (`CaseID`);

--
-- Constraints for table `paint`
--
ALTER TABLE `paint`
  ADD CONSTRAINT `paint_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `cases` (`CaseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- JOIN QUERIES
-- To get all car associated with case
select NameOfCase, model, Manufacturer from (AUTOMOBILE JOIN CASES ON AUTOMOBILE.CaseID=CASES.CaseID);

-- To get criminal and name
select CName, NameOfCase  from (CriminalCase JOIN Criminal ON CriminalCase.CriminalID=Criminal.CID) JOIN CASES ON CASES.CaseID=CriminalCase.CrimeID;

-- To get criminal and types of crimes
select DISTINCT CName, TypeOfCase  from (CriminalCase JOIN Criminal ON CriminalCase.CriminalID=Criminal.CID) JOIN CASES ON CASES.CaseID=CriminalCase.CrimeID;

-- To get criminal and investigating officers
select DISTINCT CName, LeadingOfficer from (CASES JOIN (CRIMINALCASE JOIN CRIMINAL ON CRIMINALCASE.CriminalID=CRIMINAL.CID) ON Cases.CaseID=CriminalCase.CrimeID)
UNION
select DISTINCT CName, AsstOfficer from (CASES JOIN (CRIMINALCASE JOIN CRIMINAL ON CRIMINALCASE.CriminalID=CRIMINAL.CID) ON Cases.CaseID=CriminalCase.CrimeID)


-- AGGREGATE QUERIES
-- to get number of drug instances associated with a case
select NameOfCase, count(*) from (DRUGS NATURAL JOIN CASES) group by CaseID;

-- to get no of colors grouped by solvent
select Solvent, count(*) from Paint group by Solvent;

-- No. of narcotic vs not narcotic Drugs
select narcotic, count(*) from DRUGS group by narcotic;

-- Cases grouped by location
select Loc, count(*) from CASES group by Loc;


-- SET OPERATIONS
-- narcotic drugs that are blue
select dname from DRUGS where narcotic="yes" 
INTERSECT
select dname from DRUGS where color="blue";

-- Handgun manufactured in year 1970
select model, Manufacturer, gauge, caliber from BALLISTICS where Year=1970
INTERSECT
select model, Manufacturer, gauge, caliber from BALLISTICS where typeOfGun="Handgun";

-- Cases lead by Jake and assisted by Amy
select NameOfCase from CASES where LeadingOfficer="Jake Peralta"
INTERSECT
select NameOfCase from CASES where AsstOfficer="Amy Santiago";

-- Cars manufactured by Volkswagon or Hyundai
select model from AUTOMOBILE where Manufacturer="Audi"
UNION
select model from AUTOMOBILE where Manufacturer="Dodge"
