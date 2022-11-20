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