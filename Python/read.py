import streamlit as st
import pandas as pd
from database import viewTables

def read():
    menu = ["Drugs", "Ballistics", "Paint", "Automobile", "Cases", "Criminal"]
    choice = st.sidebar.selectbox("Menu", menu)
    result = viewTables(choice)
    #print(result)
    df = pd.DataFrame(result) 
    st.dataframe(df)
