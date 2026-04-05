#Assignment 1
#PRN: 260240125023

setwd("D:/R/Datasets/")

cars93 = read.csv("Cars93.csv")
colnames(cars93)
dim(cars93)

#Subset car93 to get only Small cars with USA origin
ss_cars1 = subset(cars93, Type == 'Small' & Origin == 'USA')

# Subset cars93 to get only non-USA origin cars with horeseposer > 150
ss_cars2 = subset(cars93, Origin == 'non-USA' & Horsepower > 150)