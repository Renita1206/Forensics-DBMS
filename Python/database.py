import mysql.connector 

mydb = mysql.connector.connect(host="localhost", user="root", password="", database="Forensics")
c = mydb.cursor()

def add_drug(code, name, color, dclass, narc): 
    c.execute('INSERT INTO DRUGS VALUES (%s, %s, %s, %s, %s)',(code, name, color, dclass, narc))
    mydb.commit()

def add_car(id, name, year, mfd, type):
    command = 'INSERT INTO AUTOMOBILE VALUES("'+id+'","'+name+'",'+year+',"'+mfd+'","'+type+'");'
    c.execute(command)
    mydb.commit()

def add_ballistics(id, model, mfd, year, typeof, gauge, caliber, country):
    command = 'INSERT INTO BALLISTICS VALUES("'+id+'","'+model+'",'+mfd+'",'+year+',"'+typeof+'","'+gauge+'","'+caliber+'","'+country+'");'
    c.execute(command)
    mydb.commit()

def viewTables(tableName):
    command = 'SELECT * FROM ' + tableName +';'
    print(command)
    c.execute(command)
    data = c.fetchall()
    return data

def viewQueryResult(choice):
    command=""
    if choice==1:
        command = 'select color, model from (CarColor JOIN PAINT ON CARCOLOR.PAINTID=PAINT.PID) JOIN AUTOMOBILE ON AUTOMOBILE.AID=carcolor.automobileID;'
    elif choice==2:
        command = 'select CName, NameOfCase  from (CriminalCase JOIN Criminal ON CriminalCase.CriminalID=Criminal.CID) JOIN CASES ON CASES.CaseID=CriminalCase.CrimeID;'
    elif choice==3:
        command = 'select CName, TypeOfCase  from (CriminalCase JOIN Criminal ON CriminalCase.CriminalID=Criminal.CID) JOIN CASES ON CASES.CaseID=CriminalCase.CrimeID;'
    elif choice==4:
        command = 'select narcotic, count(*) from DRUGS group by narcotic;'
    elif choice==5:
        command = 'select Loc, count(*) from CASES group by Loc;'
    elif choice==6:
        command = 'select NameOfCase, count(*) from (Evidence NATURAL JOIN CASES) group by CaseID;'
    elif choice==7:
        command = 'select dname from DRUGS where narcotic="yes" INTERSECT select dname from DRUGS where color="blue"'
    elif choice==8:
        command = 'select LeadingOfficer, number_of_cases(LeadingOfficer) from CASES;'
    c.execute(command)
    data = c.fetchall()
    return data

def execQuery(command):
    c.execute(command)
    data = c.fetchall()
    return data

def updateEvidence(id, status):
    command = 'UPDATE EVIDENCE set result = "' + status + '" where EID = "' + id + '"'
    print(command)
    c.execute(command)
    mydb.commit()

def delRec(id):
    command = 'DELETE FROM EVIDENCE where EID = "' + id + '"'
    print(command)
    c.execute(command)
    mydb.commit()