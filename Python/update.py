import streamlit as st
from database import updateEvidence
from database import viewTables
import pandas as pd

def update():
    result = viewTables("Evidence")
    #print(result)
    df = pd.DataFrame(result) 
    st.dataframe(df)
    c1, c2 = st.columns(2)
    with c1:
        id=st.text_input("Evidence ID (EID)")
    with c2:
        status = st.selectbox("Status", ["Waitlist", "Active", "Archived"])
    if st.button("Update Record"):
            updateEvidence(id, status)
            st.success("Successfully updated evidence record")
