module My-Julia-ML-Package

# Write your package code here.
export Linear_Regression
include("Linear_Regression.jl")   #it must be put before cat.jl and dog.jl, or there is error
include("Logistic_Regression.jl")
