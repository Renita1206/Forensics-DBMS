-- Inserting data into drugs table
Load data infile 'Drugs.csv' into table DRUGS
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting data into ballistics table
Load data infile 'Ballistics.csv' into table BALLISTICS
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting Data into Paint table
Load data infile 'Paint.csv' into table PAINT
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting data into automobile table
Load data infile 'Automobiles.csv' into table AUTOMOBILE
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting data into Car-Color table
Load data infile 'Auto-Paint.csv' into table CARCOLOR
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting data into user table
Load data infile 'Users.csv' into table USER
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting data into cases table
Load data infile 'Cases.csv' into table CASES
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting data into criminals table
Load data infile 'Criminals.csv' into table CRIMINAL
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting data into CriminalCase table
Load data infile 'CriminalCase.csv' into table CRIMINALCASE
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting data into Access table
Load data infile 'Access.csv' into table ACCESS
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;

-- Inserting data into evidence table
Load data infile 'Evidence.csv' into table EVIDENCE
columns terminated by ',' 
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n' 
ignore 1 lines;


-- Issues
-- Criminal Case and Access table data insertion not working via csv but insert command works