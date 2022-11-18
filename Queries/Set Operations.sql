-- narcotic drugs that are blue
select dname from DRUGS where narcotic="yes" 
INTERSECT
select dname from DRUGS where color="blue"

-- Rifles manufactured in year 2003
select make, Manufacturer, gauge, caliber from BALLISTICS where Year=2003
INTERSECT
select make, Manufacturer, gauge, caliber from BALLISTICS where typeOfGun="rifle"

-- Cases lead by Jake and not assisted by Amy
select NameOfCase from CASES where LeadingOfficer="Jake"
MINUS
select NameOfCase from CASES where AsstOfficer="Amy"

-- Cars manufactured by Volkswagon or Hyundai
select model from AUTOMOBILE where Manufacturer="Volkswagon"
UNION
select model from AUTOMOBILE where Manufacturer="Hyundai"

