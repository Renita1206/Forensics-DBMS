import streamlit as st
from database import delRec
from database import viewTables
import pandas as pd
from database import get_automobile_no
from database import get_ballistics_no
from database import get_drug_no
from database import get_paint_no
from database import get_case_no
from database import get_criminal_no

def delete():
    menu = ["Automobile", "Ballistics", "Cases", "Criminal", "Drugs", "Paint"]
    choice = st.sidebar.selectbox("Menu", menu)
    result = viewTables(choice)
    df = pd.DataFrame(result)
    if choice==menu[4]:
        df = pd.DataFrame(result, columns=("Case ID", "NDC Code", "Name","Color", "Class", "Narcotic")) 
    elif choice==menu[1]:
        df = pd.DataFrame(result, columns=("Case ID", "ID", "Make", "Manufacturer", "Year of Manufacture", "Type", "Caliber", "Gauge", "Country of Origin"))
    elif choice==menu[5]:
        df = pd.DataFrame(result, columns=("Case ID", "ID", "Color", "Solvent", "Binder", "Pigment", "Additive"))
    elif choice==menu[0]:
        df = pd.DataFrame(result, columns=("Case ID", "ID", "Model", "Year of Manufacture", "Manufacturer", "Type"))
    elif choice==menu[2]:
        df = pd.DataFrame(result, columns=("Case ID", "Type", "Name", "Leading Officer", "Assissting Officer", "Time of Report", "Location", "Status"))
    elif choice==menu[3]:
        df = pd.DataFrame(result, columns=("Criminal ID", "Name", "Alias", "Age", "Number of Cases", "Dominant Hand", "Status", "DNA", "Fingerprint", "Nationality")) 
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
    elif choice=="Cases":
          list_of_id = [i[0] for i in get_case_no()]
    elif choice=="Criminal":
          list_of_id = [i[0] for i in get_criminal_no()]
    id=st.selectbox("Enter Evidence ID", list_of_id)
    if st.button("Delete Record"):
            delRec(id, choice)
            st.success("Successfully deleted evidence record")
    