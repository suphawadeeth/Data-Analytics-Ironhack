import streamlit as st
import pickle
import pandas as pd
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression, LogisticRegression
from sklearn.svm import SVC


iris = datasets.load_iris()

# X-y split
X = iris["data"]
y = iris["target"]

# train-test split
X_train, X_test, y_train, y_test = train_test_split(X,y)

# modeling
lin_reg = LinearRegression()
log_reg = LogisticRegression()
svc_ = SVC()

lin_reg_fit = lin_reg.fit(X_train, y_train)
log_reg_fit = log_reg.fit(X_train, y_train)
svc_fit = svc_.fit(X_train, y_train)


st.title("Iris Spicies Identifier")

# creating pickle files
with open("lin_reg.pkl", "wb") as li:  # wb: mode write
    pickle.dump(lin_reg_fit, li)
with open("log_reg.pkl", "wb") as lo:
    pickle.dump(log_reg_fit, lo)
with open("svc_.pkl", "wb") as sv:
    pickle.dump(svc_fit, sv)

# read pickle files
with open("lin_reg.pkl", "rb") as li:  # rb: mode read
    linear_regression = pickle.load(li)
with open("log_reg.pkl", "rb") as lo:
    logistic_regression = pickle.load(lo)
with open("svc_.pkl", "rb") as sv:
    support_vector_classifier = pickle.load(sv)


# Function to classify the plants--> 0=setosa, 1=versicolor, 2=virginica
def classify(num):
    if num==0: return ("Iris setosa")
    elif num==1: return ("Iris versicolor")
    else: return ("Iris virginica")


# Define main function
def main():
    # title
    st.title("Modeling Iris by the Ironhacker Suphawadee")
    st.sidebar.header("User Input Parameters")
    st.subheader("User Input Parameters")

    # function for the User to put parameters in sidebar
    def user_input_parameters():
        sepal_length = st.sidebar.slider("Sepal Length", 4.3, 7.9, 6.0)
        sepal_width = st.sidebar.slider("Sepal Width", 2.0, 4.4, 3.0)
        petal_length = st.sidebar.slider("Petal Length", 1.0, 6.9, 4.0)
        petal_width = st.sidebar.slider("Petal Width", 0.1, 2.5, 1.0)
        data = {"sepal_length":sepal_length,
                "sepal_width":sepal_width,
                "petal_length":petal_length,
                "petal_width":petal_width
        }
        features_df = pd.DataFrame(data, index=[0])
        return features_df

    df = user_input_parameters()

    # the User will also choose the model
    option = ["Linear Regression", "Logistic Regression", "SVM Classifier"]
    model = st.sidebar.selectbox("Which model do you want to use", option)


    #
    st.subheader(model)
    st.write(df)

    if st.button("RUN"):
        if model == "Linear Regression": st.success(classify(round(linear_regression.predict(df)[0],0)))
    elif model == "Logistic Regression": st.success(classify(logistic_regression.predict(df)))
    else: st.success(classify(support_vector_classifier.predict(df)))

if __name__ == '__main__':
    main()