import streamlit as st
import pandas as pd
from database import viewQueryResult
from database import execQuery

def predef_queries():
    q = [   "Color Variations for each vehicle", 
            "Criminals and the cases they are associated with", 
            "Criminals and the type of cases they are associated with",
            "No of narcotic and non-narcotic drugs",
            "Cases grouped by Location",
            "No. of evidence instances for each case",
            "Blue Narcotic Drugs",
            "No of Cases lead by each officer"]
    choice = st.selectbox("Choose a Query: ", q)
    result = viewQueryResult(q.index(choice)+1)
    #print(result)
    df = pd.DataFrame(result) 
    st.dataframe(df)

def query_cmd():
    command = st.text_input("Enter Query")
    if command:
        result = execQuery(command)
        #print(result)
        df = pd.DataFrame(result) 
        st.dataframe(df)

    