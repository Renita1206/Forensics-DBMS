import streamlit as st
from database import delRec
from database import viewTables
import pandas as pd


def delete():
    result = viewTables("Evidence")
    #print(result)
    df = pd.DataFrame(result) 
    st.dataframe(df)
    id=st.text_input("Evidence ID (EID)")
    if st.button("Delete Record"):
            delRec(id)
            st.success("Successfully deleted evidence record")
    