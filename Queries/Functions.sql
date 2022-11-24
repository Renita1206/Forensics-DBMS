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


-- Function to find no of cases of a particular status
DELIMITER $$
CREATE FUNCTION number_of_cases(stat varchar(255))
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE c int;
    
    SELECT count(CaseID) into c
	FROM Cases
	WHERE statusOfCase = stat;
    
	RETURN c;
END; $$
DELIMITER ;