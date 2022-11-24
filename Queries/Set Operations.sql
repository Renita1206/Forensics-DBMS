-- narcotic drugs that are blue
select dname from DRUGS where narcotic="yes" 
INTERSECT
select dname from DRUGS where color="blue";

-- Handgun manufactured in year 1970
select model, Manufacturer, gauge, caliber from BALLISTICS where Year=1970
INTERSECT
select model, Manufacturer, gauge, caliber from BALLISTICS where typeOfGun="Handgun";

-- Cases lead by Jake and assisted by Amy
select NameOfCase from CASES where LeadingOfficer="Jake Peralta"
INTERSECT
select NameOfCase from CASES where AsstOfficer="Amy Santiago";

-- Cars manufactured by Volkswagon or Hyundai
select model from AUTOMOBILE where Manufacturer="Audi"
UNION
select model from AUTOMOBILE where Manufacturer="Dodge"

