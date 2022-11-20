-- CREATE DATABASE FORENSICS

USE FORENSICS;

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


