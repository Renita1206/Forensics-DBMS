import streamlit as st
from database import add_drug
from database import add_car

def add():
    menu = ["Automobile", "Ballistics", "Cases", "Criminal", "Drugs", "Evidence","Paint", "User"]
    choice = st.sidebar.selectbox("Menu", menu)
    col1, col2 = st.columns(2)
    
    #Automobile
    if choice==menu[0]:
        with col1:
            id = st.text_input("AID :")
            year = st.text_input("Year: ")
            type = st.selectbox("Type: ", ["Hatchback","Sedan", "SUV", "Two Wheeler", "Bus", "Truck", "Other"])
        with col2:
            name = st.text_input("Model Name: ")
            mfd = st.text_input("Manufacturer:")
        if st.button("Add Vehicle"):
            add_car(id, name, year, mfd, type)
            st.success("Successfully added vehicle: {}".format(name))
    
    #Ballistics


    #Cases

    #Criminal

    #Drugs
    if choice==menu[4]:
        with col1:
            code = st.text_input("NDC# :")
            color = st.text_input("Color: ")
            narc = st.selectbox("Narcotic: ", ["yes","no"])
        with col2:
            name = st.text_input("Name: ")
            dclass = st.text_input("Class:")
        if st.button("Add Drug"):
            add_drug(code, name, color, dclass, narc)
            st.success("Successfully added Drug: {}".format(name))
    
    #Evidence 

    #Paint

    #User