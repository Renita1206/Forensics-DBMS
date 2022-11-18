-- To get all color variations for each model
select color, model from (CarColor JOIN PAINT ON CARCOLOR.PAINTID=PAINT.PID) JOIN AUTOMOBILE ON AUTOMOBILE.AID=carcolor.automobileID;

-- To get criminal and name
select CName, NameOfCase  from (CriminalCase JOIN Criminal ON CriminalCase.CriminalID=Criminal.CID) JOIN CASES ON CASES.CaseID=CriminalCase.CrimeID;

-- To get criminal and types of crimes
select CName, TypeOfCase  from (CriminalCase JOIN Criminal ON CriminalCase.CriminalID=Criminal.CID) JOIN CASES ON CASES.CaseID=CriminalCase.CrimeID;

-- to get username and cases they have access to
select username, NameOfCase from (USER JOIN ACCESS on USER.UserID=ACCESS.UserID) JOIN CASES on CASES.CaseID=ACCESS.CaseID;

