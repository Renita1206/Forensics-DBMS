-- Renita Kurian - PES1UG20CS331
-- Forensic Database Project

-- CREATE DATABASE FORENSICS_331
USE FORENSICS_331;

-- Case Data
CREATE TABLE CASES(CaseID varchar(255) NOT NULL UNIQUE, TypeOfCase varchar(255),NameOfCase varchar(255), LeadingOfficer varchar(255), AsstOfficer varchar(255), TimeOfReport datetime NOT NULL, Loc varchar(255), statusOfCase varchar(255), PRIMARY KEY(CaseID));

-- Criminal Data
CREATE TABLE CRIMINAL(CID varchar(255) NOT NULL UNIQUE, CName varchar(255) NOT NULL, Alias varchar(255), Age int, NoOfCases int, DominantHand varchar(255), CurrentStatus varchar(255), DNAID varchar(50), FingerprintID varchar(50), nationality varchar(255), PRIMARY KEY(CID));

-- Criminal Case
CREATE TABLE CriminalCase(CriminalID varchar(255), CrimeID varchar(255), FOREIGN KEY(CriminalID) REFERENCES CRIMINAL(CID), FOREIGN KEY(CrimeID) REFERENCES CASES(CaseID));

-- Ballistics Data
CREATE TABLE BALLISTICS(CaseID varchar(255), B_ID varchar(255) NOT NULL UNIQUE,Model varchar(255), Manufacturer varchar(255), Year int, typeOfGun varchar(255), gauge float, caliber int, CountryOfOrigin varchar(255),PRIMARY KEY(B_ID), FOREIGN KEY(CaseID) REFERENCES CASES(CaseID) );

-- Drugs Data
CREATE TABLE DRUGS(CaseID varchar(255), NDC_No varchar(255) NOT NULL UNIQUE, dname varchar(255), color varchar(255), class varchar(255), narcotic varchar(255), PRIMARY KEY(NDC_No), FOREIGN KEY(CaseID) REFERENCES CASES(CaseID));

-- Paint Data
CREATE TABLE PAINT(CaseID varchar(255), PID varchar(255) NOT NULL UNIQUE, Color varchar(255) NOT NULL, Solvent varchar(255), Binder varchar(255), Pigments varchar(255), Additive varchar(255), PRIMARY KEY(PID), FOREIGN KEY(CaseID) REFERENCES CASES(CaseID));

-- Automobile Data
CREATE TABLE AUTOMOBILE(CaseID varchar(255), AID varchar(255), model varchar(255), Year int, Manufacturer varchar(255), typeOfVehicle varchar(255), PRIMARY KEY(AID), FOREIGN KEY(CaseID) REFERENCES CASES(CaseID));


-- INSERT QUERIES
INSERT INTO `automobile` (`CaseID`, `AID`, `model`, `Year`, `Manufacturer`, `typeOfVehicle`) VALUES
('T22', 'IR32', 'Model S', 2019, 'Tesla', 'Sedan'),
('T22', 'TWQ123', 'Model X', 2018, 'Tesla', 'Sedan');

INSERT INTO `ballistics` (`CaseID`, `B_ID`, `Model`, `Manufacturer`, `Year`, `typeOfGun`, `gauge`, `caliber`, `CountryOfOrigin`) VALUES
('M981', 'H39', 'Automag II', 'AMT', 1970, 'Handgun', 410, 9, 'USA'),
('M981', 'H9', 'Glock 21', 'Glock', 1970, 'Handgun', -1, 10, 'Austria'),
('M46', 'S123PW', 'Glock 20', 'Glock', 1980, 'Pistol', 9, -1, 'Austria'),
('M981', 'SH09', 'Benneli M1', 'Benneli Armi', 1986, 'Shotgun', 20, -1, 'Italy'),
('M981', 'SH23', 'Benneli M3', 'Benneli Armi', 1989, 'Shotgun', 20, -1, 'Italy');

INSERT INTO `cases` (`CaseID`, `TypeOfCase`, `NameOfCase`, `LeadingOfficer`, `AsstOfficer`, `TimeOfReport`, `Loc`, `statusOfCase`) VALUES
('KSFHG12', 'Murder', 'Polten Murder', 'Jake Peralta', 'Amy Santiago', '2022-11-25 08:48:01', 'Brooklyn', 'ongoing'),
('M46', 'Murder', 'Tuomi Murder', 'Ray Holt', 'Charles Boyle', '2022-11-20 13:49:08', 'Milwaukee', 'Archived'),
('M53', 'Murder', 'Ann Heally Murder', 'Amy Santiago', 'Gina Linetti', '2022-11-20 13:51:28', 'Washington', 'Ongoing'),
('M981', 'Murder', 'Capo Murder', 'Jake Peralta', 'Amy Santiago', '2022-11-20 14:16:28', 'Chicago', 'Ongoing'),
('QT09P1', 'Theft', 'Greenlane 15 Robbery', 'Michaela Stone', 'Jared Vasquez', '2022-11-20 17:48:20', 'Brooklyn', 'Ongoing'),
('T22', 'Theft', 'Private Jet Theft', 'Jake Peralta', 'Charles Boyle', '2022-11-20 13:54:59', 'New York', 'Archived');

INSERT INTO `criminal` (`CID`, `CName`, `Alias`, `Age`, `NoOfCases`, `DominantHand`, `CurrentStatus`, `DNAID`, `FingerprintID`, `nationality`) VALUES
('ZK53', 'Jeffrey Dahmer', 'Milwaukee Cannibal', 25, 17, 'Left', 'Dead', 'OERNO123JG', 'ZWGKGJ123DFOG', 'American');

INSERT INTO `criminalbackup` (`ID`, `CriminalName`, `Alias`, `NoOfCases`, `dominantHand`, `Nationality`) VALUES
(NULL, 'Luke Wrenner', 'Sticky Fingers', 2, 'Right', 'American'),
(NULL, 'Anna Sorokin', 'Anna Delvey', 6, 'Unknown', 'German'),
('RX12', 'Ted Bundy', 'Lady Killer', 50, 'Left', 'American'),
('213FD', 'Joe Palmer', 'None', 1, 'Unknown', 'Russian');

INSERT INTO `drugs` (`CaseID`, `NDC_No`, `dname`, `color`, `class`, `narcotic`) VALUES
('T22', '6745103120', 'Lexapro', 'blue', 'analgesic', 'yes'),
('M53', '6745718120', 'Ketamine', 'white', 'inhalants', 'yes'),
('M981', '6998813120', 'Heroin', 'white', 'opioid', 'no'),
('QT09P1', '8861238761', 'Axypenetril', 'Pink', 'Hallucinogins', 'no'),
('QT09P1', '97234698', 'Nescipixinol', 'Green', 'Inhalants', 'no');

INSERT INTO `paint` (`CaseID`, `PID`, `Color`, `Solvent`, `Binder`, `Pigments`, `Additive`) VALUES
('M53', 'B349', 'Black', 'Benzene', 'Linseed Oil', 'Chromium', 'Penetrol'),
('QT09P1', 'QW11', 'White', 'Toluene', 'Linseed Oil', 'Cadmium', 'Penetrol'),
('T22', 'R041', 'Red', 'Benzene', 'Linseed Oil', 'Cadmium', 'Penetrol'),
('M53', 'R09', 'Yellow', 'Toluene', 'Linseed Oil', 'Casein', 'Fleotrol');

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


-- FUNCTIONS
-- Function to find no of cases lead by an officer
DELIMITER $$
CREATE FUNCTION number_of_cases_lead(officer varchar(255))
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE case_count int;
    
    SELECT count(CaseID) into case_count
	FROM CASES
	WHERE LeadingOfficer = officer;
    
	RETURN case_count;
END; $$
DELIMITER ;

--Command to use function
select LeadingOfficer, number_of_cases(LeadingOfficer) from CASES;


-- Function to find no of criminals of a particular status
DELIMITER $$
CREATE FUNCTION number_of_criminals(stat varchar(255))
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE c int;
    
    SELECT count(CID) into c
	FROM Criminal
	WHERE CurrentStatus = stat;
    
	RETURN c;
END; $$
DELIMITER ;


-- TRIGGERS
-- Before deleting case record delete crime-case and delete case access
DELIMITER $$
CREATE TRIGGER delCase
BEFORE DELETE
ON CASES FOR EACH ROW
BEGIN
    delete from CriminalCase where CrimeID = old.CaseID;
    delete from DRUGS where CaseID = old.CaseID;
    delete from BALLISTICS where CaseID = old.CaseID;
    delete from PAINT where CaseID = old.CaseID;
    delete from AUTOMOBILE where CaseID = old.CaseID;
END $$

DELIMITER ;


-- Before deleting criminal record delete  case criminal record and also backup criminal info
DELIMITER $$
CREATE TRIGGER delCriminal
BEFORE DELETE
ON CRIMINAL FOR EACH ROW
BEGIN
    DECLARE id, criminalname, a, d, n varchar(255);
    DECLARE ncases int;
    DECLARE c1 CURSOR FOR SELECT CID, CName, Alias, NoOfCases, DominantHand, nationality from CRIMINAL where CID = old.CID;
    open c1;
    fetch c1 into id, criminalname, a, ncases, d, n;
    insert into criminalBackup values(id, criminalName, a, ncases, d, n);
    close c1;
    delete from CriminalCase where CriminalID = old.CID;
END $$

DELIMITER ;