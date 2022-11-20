import streamlit as st
from database import updateStatus
from database import viewTables
import pandas as pd
from database import get_case_no
from database import get_criminal_no

def update():
    menu = ["Cases", "Criminal"]
    choice = st.sidebar.selectbox("Menu", menu)
    result = viewTables(choice)
    #print(result)
    df = pd.DataFrame(result) 
    st.dataframe(df)
    c1, c2 = st.columns(2)
    with c1:
        if (choice=="Criminal"):
            id=st.selectbox("Enter Crime/Criminal ID", [i[0] for i in get_criminal_no()])
        elif(choice=="Cases"):
            id=st.selectbox("Enter Crime/Criminal ID", [i[0] for i in get_case_no()])
    with c2:
        if (choice=="Criminal"):
            status = st.selectbox("Status", ["Active", "Prison", "Dead", "Unknown"])
        elif(choice=="Cases"):
            status = st.selectbox("Status", ["Ongoing", "Archived", "Unknown"])
    if st.button("Update Record"):
            updateStatus(id, status, choice)
            st.success("Successfully updated record")
    result = viewTables(choice)
    df = pd.DataFrame(result)