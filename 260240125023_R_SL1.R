# Assignemt SL 1
# Name: Digvijay Vikas Sawant
# PRN: 260240125023

setwd("D:/PGCP_BDA/R/Datasets")


#1. Subset the dataset Orders in the folder datasets to create a dataset with only “Online” payment.
orders = read.csv('Orders.csv')
online_orders = subset(orders, Payment.Terms == "Online")

#2. Consider the dataset mtcars. Output (write) the data in this data set into a csv file 
#   and name the csv file as mtcars.csv.
data("mtcars")
write.csv(mtcars, "mtcars.csv", row.names = TRUE)

# 3. Consider the dataset diamonds in the folder datasets. Subset the dataset with criteria 
# as cut=Premium and color=J
diamonds = read.csv('Diamonds.csv', sep = ';')
diamonds_cut_color = subset(diamonds, cut == 'Premium' & color == 'J')

# 4. Consider the dataset diamonds in the folder datasets. Create a data frame object which 
# stores just variables carat, color, depth and price
diamonds_subset = diamonds[, c("carat", "color", "depth", "price")]
#OR
library(dplyr)
diamonds_subset = diamonds %>% select(carat, color, depth, price)

# 5. Consider the dataset mtcars. Choose the 2nd, 18th, 30th and 12th rows
data("mtcars")
selected_rows = mtcars[c(2, 18, 30, 12), ]
