import streamlit as st
import pandas as pd

st.title("App 1")
st.write("This is the first example Streamlit app running on port 8501.")

df = pd.DataFrame({
    "first column": [1, 2, 3, 4],
    "second column": [10, 20, 30, 40]
})

st.dataframe(df)
