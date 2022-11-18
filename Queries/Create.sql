-- CREATE DATABASE FORENSICS

USE FORENSICS;

-- Ballistics Data
CREATE TABLE BALLISTICS(B_ID varchar(255) NOT NULL UNIQUE,Model varchar(255), Manufacturer varchar(255), Year int, typeOfGun varchar(255), gauge float, caliber int, CountryOfOrigin varchar(255),PRIMARY KEY(B_ID));

-- Drugs Data
CREATE TABLE DRUGS(NDC_No varchar(255) NOT NULL UNIQUE, dname varchar(255), color varchar(255), class varchar(255), narcotic varchar(255), PRIMARY KEY(NDC_No));

-- Paint Data
CREATE TABLE PAINT(PID varchar(255) NOT NULL UNIQUE, Color varchar(255) NOT NULL, Solvent varchar(255), Binder varchar(255), Pigments varchar(255), Additive varchar(255), PRIMARY KEY(PID));


-- Automobile Data
CREATE TABLE AUTOMOBILE(AID varchar(255), model varchar(255), Year int, Manufacturer varchar(255), typeOfVehicle varchar(255), PRIMARY KEY(AID));

-- Automobile-Paint data
CREATE TABLE CARCOLOR(AutomobileID varchar(255) NOT NULL, PaintID varchar(255) NOT NULL, FOREIGN KEY(AutomobileID) REFERENCES AUTOMOBILE(AID),FOREIGN KEY(PaintID) REFERENCES PAINT(PID));

-- Case Data
CREATE TABLE CASES(CaseID varchar(255) NOT NULL UNIQUE, TypeOfCase varchar(255),NameOfCase varchar(255), LeadingOfficer varchar(255), AsstOfficer varchar(255), TimeOfReport datetime NOT NULL, Loc varchar(255), statusOfCase varchar(255), PRIMARY KEY(CaseID));

-- User Data
CREATE TABLE USER(UserID varchar(255) NOT NULL UNIQUE, Username varchar(255), Passkey varchar(255), Title varchar(255), PRIMARY KEY(UserID));

-- Access Table
CREATE TABLE ACCESS(UserID varchar(255), CaseID varchar(255), FOREIGN KEY(UserID) REFERENCES USER(UserID), FOREIGN KEY(CaseID) REFERENCES CASES(CaseID));

-- Criminal Data
CREATE TABLE CRIMINAL(CID varchar(255) NOT NULL UNIQUE, CName varchar(255) NOT NULL, Age varchar(255), Alias varchar(255), NoOfCases int, DominantHand varchar(255), CurrentStatus varchar(255), PRIMARY KEY(CID));

-- Criminal Case
CREATE TABLE CriminalCase(CriminalID varchar(255), CrimeID varchar(255), FOREIGN KEY(CriminalID) REFERENCES CRIMINAL(CID), FOREIGN KEY(CrimeID) REFERENCES CASES(CaseID));

-- Biometrics -> DNA and fingerprint
-- ShoePrint data

-- Evidence 
CREATE TABLE EVIDENCE(CaseID varchar(255)NOT NULL, EID varchar(255) NOT NULL UNIQUE, EDate date,EType varchar(255), Result varchar(255), PRIMARY KEY(EID), FOREIGN KEY(CaseID) REFERENCES CASES(CaseID));




