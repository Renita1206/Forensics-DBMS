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