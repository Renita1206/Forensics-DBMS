import mysql.connector 

mydb = mysql.connector.connect(host="localhost", user="root", password="", database="Forensics")
c = mydb.cursor()

def viewTables(tableName):
    command = 'SELECT * FROM ' + tableName +';'
    print(command)
    c.execute(command)
    data = c.fetchall()
    return data

def updateStatus(id, status, choice):
    if choice=="Criminal":
        command = 'UPDATE CRIMINAL set CurrentStatus = "' + status + '" where CID = "' + id + '"'
    elif choice=="Cases":
        command = 'UPDATE CASES set StatusOfCase = "' + status + '" where CaseID = "' + id + '"'
    print(command)
    c.execute(command)
    mydb.commit()

def execQuery(command):
    c.execute(command)
    data = c.fetchall()
    return data

def viewQueryResult(choice):
    command=""
    if choice==1:
        command = 'select NameOfCase, model, Manufacturer from (AUTOMOBILE JOIN CASES ON AUTOMOBILE.CaseID=CASES.CaseID);'
    elif choice==2:
        command = 'select CName, NameOfCase  from (CriminalCase JOIN Criminal ON CriminalCase.CriminalID=Criminal.CID) JOIN CASES ON CASES.CaseID=CriminalCase.CrimeID;'
    elif choice==3:
        command = 'select DISTINCT CName, TypeOfCase  from (CriminalCase JOIN Criminal ON CriminalCase.CriminalID=Criminal.CID) JOIN CASES ON CASES.CaseID=CriminalCase.CrimeID;'
    elif choice==4:
        command = 'select DISTINCT CName, LeadingOfficer from (CASES JOIN (CRIMINALCASE JOIN CRIMINAL ON CRIMINALCASE.CriminalID=CRIMINAL.CID) ON Cases.CaseID=CriminalCase.CrimeID) UNION select DISTINCT CName, AsstOfficer from (CASES JOIN (CRIMINALCASE JOIN CRIMINAL ON CRIMINALCASE.CriminalID=CRIMINAL.CID) ON Cases.CaseID=CriminalCase.CrimeID);'
    elif choice==5:
        command = 'select NameOfCase, count(*) from (DRUGS NATURAL JOIN CASES) group by CaseID;'
    elif choice==6:
        command = 'select Solvent, count(*) from Paint group by Solvent;'
    elif choice==7:
        command = 'select narcotic, count(*) from DRUGS group by narcotic;'
    elif choice==8:
        command = 'select Loc, count(*) from CASES group by Loc;'
    elif choice==9:
        command = 'select DISTINCT NameOfCase, LeadingOfficer from CASES;'
    elif choice==10:
        command='select DISTINCT CName, LeadingOfficer from (CASES JOIN (CRIMINALCASE JOIN CRIMINAL ON CRIMINALCASE.CriminalID=CRIMINAL.CID) ON Cases.CaseID=CriminalCase.CrimeID);'
    c.execute(command)
    data = c.fetchall()
    return data

def get_case_no(): 
    c.execute('SELECT CaseID FROM CASES') 
    data = c.fetchall()
    return data

def get_criminal_no(): 
    c.execute('SELECT CID FROM CRIMINAL') 
    data = c.fetchall()
    return data

def get_drug_no(): 
    c.execute('SELECT NDC_No FROM DRUGS') 
    data = c.fetchall()
    return data

def get_automobile_no(): 
    c.execute('SELECT AID FROM AUTOMOBILE') 
    data = c.fetchall()
    return data

def get_ballistics_no(): 
    c.execute('SELECT B_ID FROM BALLISTICS') 
    data = c.fetchall()
    return data

def get_paint_no(): 
    c.execute('SELECT PID FROM PAINT') 
    data = c.fetchall()
    return data

def delRec(id, choice):
    if choice=="Automobile":
        command = 'DELETE FROM Automobile where AID = "' + id + '"'
    elif choice=="Ballistics":
        command = 'DELETE FROM BALLISTICS where B_ID = "' + id + '"'
    elif choice=="Drugs":
        command = 'DELETE FROM DRUGS where NDC_NO = "' + id + '"'
    elif choice=="Paint":
        command = 'DELETE FROM PAINT where PID = "' + id + '"'
    elif choice=="Cases":
        command = 'DELETE FROM CASES WHERE CaseID = "' + id + '"'
    elif choice=="Criminal":
        command = 'DELETE FROM CRIMINAL where CID = "' + id + '"'
    print(command)
    c.execute(command)
    mydb.commit()

def add_automobile(cid, id, name, year, mfd, type):
    command = 'INSERT INTO AUTOMOBILE VALUES("'+cid+'","'+id+'","'+name+'","'+year+'","'+mfd+'","'+type+'");'
    #print(command)
    c.execute(command)
    mydb.commit()

def add_ballistics(cid, id, name, mfd, year, type, gauge, caliber, orig):
    command = 'Insert INTO BALLISTICS VALUES("'+cid+'","'+id+'","'+name+'","'+mfd+'","'+year+'","'+type+'","'+gauge+'","'+caliber+'","'+orig+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_case(id, type, name, lo, ao, loc, stat):
    command = 'Insert INTO CASES VALUES("'+id+'","'+type+'","'+name+'","'+lo+'","'+ao+'",now(),"'+loc+'","'+stat+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_criminal(id, name, alias, age, n, h, stat, dna, f, nationality):
    command = 'INSERT INTO CRIMINAL VALUES("'+id+'","'+name+'","'+alias+'","'+age+'","'+n+'","'+h+'","'+stat+'","'+dna+'","'+f+'","'+nationality+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_drug(cid, code, name, color, dclass, narc):
    command = 'INSERT INTO DRUGS VALUES("'+cid+'","'+code+'","'+name+'","'+color+'","'+dclass+'","'+narc+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_paint(cid, id, col, sol, bind, pigment, add):
    command = 'INSERT INTO PAINT VALUES("'+cid+'","'+id+'","'+col+'","'+sol+'","'+bind+'","'+pigment+'","'+add+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_criminalcase(cid, id):
    command = 'INSERT INTO CriminalCase VALUES("'+cid+'","'+id+'");'
    print(command)
    c.execute(command)
    mydb.commit()



