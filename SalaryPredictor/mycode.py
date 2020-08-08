#!/usr/bin/python3

print("")
import subprocess
import pandas as pd 
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

dataset = pd.read_csv("/MachineLearning/SalaryData.csv")

X = dataset[['YearsExperience']]
y = dataset[['Salary']]

X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.2,random_state=42)

model = LinearRegression()
model.fit(X_train,y_train)

pred = model.predict([[5]])[0][0]

print("The Predicted Salary is : ", pred)




