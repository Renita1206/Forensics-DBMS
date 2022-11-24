import streamlit as st
import pandas as pd
from database import viewQueryResult
from database import execQuery

def predef_queries():
    q = [   "Cars associated with Cases", 
            "Criminals and the cases they are associated with", 
            "Criminals and the type of cases they are associated with",
            "Crimnals being Investigated by each officer",
            "Cases Associated with drugs",
            "Colors grouped by solvent",
            "Narcotic vs non narcotic drugs",
            "Cases grouped by Location",
            "lead by each officer"]
    choice = st.selectbox("Choose a Query: ", q)
    result = viewQueryResult(q.index(choice)+1)
    #print(result)
    if(choice==q[0]):
        df = pd.DataFrame(result, columns=("Case", "Model", "Manufacturer"))
    elif(choice==q[1]):
        df = pd.DataFrame(result, columns=("Criminal", "Case Name"))
    elif(choice==q[2]):
        df = pd.DataFrame(result, columns=("Criminal", "Type of Case"))
    elif(choice==q[3]):
        df = pd.DataFrame(result, columns=("Criminal", "Investigating Officer"))
    elif(choice==q[4]):
        df = pd.DataFrame(result, columns=("Case Name", "Drug Name"))
    elif(choice==q[5]):
        df = pd.DataFrame(result, columns=("Paint Solvent", "Count"))
    elif(choice==q[6]):
        df = pd.DataFrame(result, columns=("Narcotic", "Count"))
    elif(choice==q[7]):
        df = pd.DataFrame(result, columns=("Location", "No of Cases"))
    elif(choice==q[8]):
        df = pd.DataFrame(result, columns=("Case", "Officer"))
    st.dataframe(df)

def query_cmd():
    command = st.text_input("Enter Query")
    if command:
        result = execQuery(command)
        #print(result)
        df = pd.DataFrame(result) 
        st.dataframe(df)

    