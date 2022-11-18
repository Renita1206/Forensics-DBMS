-- Before deleting case record delete crime-case and delete case access
DELIMITER $$
CREATE TRIGGER delCase
BEFORE DELETE
ON CASES FOR EACH ROW
BEGIN
    delete from access where caseID = old.caseID;
    delete from CriminalCase where CrimeID = old.CaseID;
END $$
DELIMITER ;