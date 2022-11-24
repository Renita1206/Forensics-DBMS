import streamlit as st
import pandas as pd
from database import get_case_no
from database import get_criminal_no
from database import add_automobile
from database import add_ballistics
from database import add_drug
from database import add_paint
from database import add_criminal
from database import add_case
from database import add_criminalcase
from database import viewTables

def add():
    menu = ["Automobile", "Ballistics", "Cases", "Criminal", "Drugs","Paint", "CriminalCase"]
    choice = st.sidebar.selectbox("Menu", menu)
    
    #Automobile
    if choice==menu[0]:
        col1, col2 = st.columns(2)
        with col1:
            cid = st.selectbox("Case ID :", [i[0] for i in get_case_no()])
            name = st.text_input("Model Name: ")
            type = st.selectbox("Type: ", ["Hatchback","Sedan", "SUV", "Two Wheeler", "Bus", "Truck", "Other"])
        with col2:
            id = st.text_input("AID :")
            mfd = st.text_input("Manufacturer:")
            year = st.text_input("Year: ")
        if st.button("Add Evidence"):
            add_automobile(cid, id, name, year, mfd, type)
            st.success("Successfully added vehicle: {}".format(name))
    
    #Ballistics
    if choice==menu[1]:
        col1, col2 = st.columns(2)
        with col1:
            cid = st.selectbox("Case ID :", [i[0] for i in get_case_no()])
            name = st.text_input("Model: ")
            type = st.selectbox("Type: ", ["Pistol","Rifle", "Revolver", "Shotgun", "Other"])
            gauge = st.text_input("Gauge")
            caliber = st.text_input("Calibur")
        with col2:
            id = st.text_input("BID :")
            mfd = st.text_input("Manufacturer: ")
            year = st.text_input("Year:")
            orig = st.text_input("Country of Origin: ")
        if st.button("Add Evidence"):
            add_ballistics(cid, id, name, mfd, year, type, gauge, caliber, orig)
            st.success("Successfully added weapon: {}".format(name))

    #Cases
    if choice==menu[2]:
        col1, col2 = st.columns(2)
        with col1:
            id = st.text_input("Case ID")
            lo = st.text_input("Leading Officer")
            stat = st.selectbox("Status", ["Ongoing", "Archived"])
            loc = st.text_input("Location")
        with col2:
            name = st.text_input("Name of Case")
            ao = st.text_input("Assisting Officer")
            type = st.selectbox("Type of Case", ["Theft", "Cybercrime", "Murder", "Fraud", "Assault"])
        if st.button("Add Case"):
            add_case(id, type, name, lo, ao, loc, stat)
            st.success("Successfully added case: {}".format(name))

    #Criminal
    if choice==menu[3]:
        col1, col2 = st.columns(2)
        with col1:
            id = st.text_input("Criminal ID")
            name = st.text_input("Name")
            age = st.text_input("Age")
            stat = st.selectbox("Status", ["Active","Prison", "Dead", "Unknown"])
            dna = st.text_input("DNA ID")
        with col2:
            n = st.text_input("Number of Cases")
            alias = st.text_input("Alias")
            nationality = st.text_input("Nationality")
            h = st.selectbox("Dominant Hand", ["Right", "Left", "Unknown"])
            f = st.text_input("Fingerprint ID")
        if st.button("Add Criminal"):
            add_criminal(id, name, alias, age, n, h, stat, dna, f, nationality)
            st.success("Successfully added criminal: {}".format(name))

    #Drugs
    if choice==menu[4]:
        col1, col2 = st.columns(2)
        with col1:
            cid = st.selectbox("Case ID :", [i[0] for i in get_case_no()])
            name = st.text_input("Name: ")
            dclass = st.selectbox("Class:", [ "Anasthetics","Cannabis", "Depressants", "Hallucinogins","Inhalants", "Opioids", "Stimulants"])
        with col2:
            code = st.text_input("NDC# :")
            color = st.text_input("Color: ")
            narc = st.selectbox("Narcotic: ", ["yes","no"])
        if st.button("Add Drug"):
            add_drug(cid, code, name, color, dclass, narc)
            st.success("Successfully added Drug: {}".format(name))

    #Paint
    if choice==menu[5]:
        col1, col2 = st.columns(2)
        with col1:
            cid = st.selectbox("Case ID :", [i[0] for i in get_case_no()])
            col = st.text_input("Color: ")
            bind = st.text_input("Binder")
            add = st.text_input("Additive")
        with col2:
            id = st.text_input("Paint ID :")
            pigment = st.text_input("Pigment: ")
            sol = st.text_input("Solvent")
        if st.button("Add Evidence"):
            add_paint(cid, id, col, sol, bind, pigment, add)
            st.success("Successfully added paint instance")

    #Case Criminal
    if choice==menu[6]:
        with st.expander("View Criminals"):
            result = viewTables("Criminal")
            df = pd.DataFrame(result) 
            st.dataframe(df)
        with st.expander("View Cases"):
            r1 = viewTables("Cases")
            df2 = pd.DataFrame(r1)
            st.dataframe(df2)
        col1, col2 = st.columns(2)
        with col1:
            cid = st.selectbox("Case ID :", [i[0] for i in get_case_no()])
        with col2:
            id = st.selectbox("Criminal ID :", [i[0] for i in get_criminal_no()])
        if st.button("Add Record"):
            add_criminalcase(id, cid)
            st.success("Successfully added record")
    
    with st.expander("View Updated Table"):
        result = viewTables(choice)
        df = pd.DataFrame(result) 
        st.dataframe(df)