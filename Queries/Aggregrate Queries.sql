-- to get number of drug instances associated with a case
select NameOfCase, count(*) from (DRUGS NATURAL JOIN CASES) group by CaseID;

-- to get no of colors grouped by solvent
select Solvent, count(*) from Paint group by Solvent;

-- No. of narcotic vs not narcotic Drugs
select narcotic, count(*) from DRUGS group by narcotic;

-- Cases grouped by location
select Loc, count(*) from CASES group by Loc;