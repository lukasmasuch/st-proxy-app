import streamlit as st
import pandas as pd
def page_app1():
    st.title("App 1")
    st.write("This is the first example Streamlit app running on port 8501.")

def page_app2():
    st.title("App 2")
    df = pd.DataFrame({
        "first column": [1, 2, 3, 4],
        "second column": [10, 20, 30, 40]
    })

    st.dataframe(df)


page = st.navigation([st.Page(page_app1), st.Page(page_app2)])

page.run()
