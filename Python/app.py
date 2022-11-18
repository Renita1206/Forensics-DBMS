import streamlit as st
from add import add
from read import read
from queries import predef_queries
from queries import query_cmd
from update import update
from delete import delete

def main():
    st.title("Forensics Database")
    menu = ["Add", "View", "Edit", "Remove", "Run Predefined Queries", "CMD"]
    choice = st.sidebar.selectbox("Menu", menu)
    if choice == "Add":
        add()
    elif choice == "View":
        read()
    elif choice == "Edit":
        update()
    elif choice == "Remove":
        delete()
    elif choice=="Run Predefined Queries":
        predef_queries()
    elif choice=="CMD":
        query_cmd()

if __name__ == '__main__':
 main()