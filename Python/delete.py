import streamlit as st
from database import delRec
from database import viewTables
import pandas as pd
from database import get_automobile_no
from database import get_ballistics_no
from database import get_drug_no
from database import get_paint_no


def delete():
    menu = ["Drugs", "Ballistics", "Paint", "Automobile"]
    choice = st.sidebar.selectbox("Menu", menu)
    result = viewTables(choice)
    df = pd.DataFrame(result) 
    st.dataframe(df)
    list_of_id=[]
    if choice=="Drugs":
        list_of_id = [i[0] for i in get_drug_no()]
    elif choice=="Automobile":
        list_of_id = [i[0] for i in get_automobile_no()]
    elif choice=="Paint":
        list_of_id = [i[0] for i in get_paint_no()]
    elif choice=="Ballistics":
        list_of_id = [i[0] for i in get_ballistics_no()]   
    id=st.selectbox("Enter Evidence ID", list_of_id)
    if st.button("Delete Record"):
            delRec(id, choice)
            st.success("Successfully deleted evidence record")
    