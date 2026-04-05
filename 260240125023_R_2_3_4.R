# Assignments 2,3,4
# Name: Digvijay Vikas Sawant
# PRN: 260240125023


setwd("D:/PGCP_BDA/R/Datasets")

#--------Assignment 2-----------#
# Q 1.
# a. Import and display meta-data 
orders = read.csv("Orders.csv")
str(orders) 

# b. Descriptive Statistics
summary(orders)

# Q 2.
cars = read.csv("cars2018.csv")

table(cars$Aspiration)
table(cars$Transmission)

table(cars$Aspiration, cars$Transmission)

# Q 3.
fahrenhiet_to_celcius = function(f) {
  celcius = (f - 32) * (5/9)
  return(celcius)
}

fahrenhiet_to_celcius(50)

# Q 4.
# 1. Define the function 
calc_cv = function(x) {
  cv = (sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)) * 100
  return(cv)
}
data = c(10, 20, 15, 25, 30)
calc_cv(data)

# Q 5.
imputeMean = function(x) {
  x[is.na(x)] = mean(x, na.rm = TRUE)
  return(x)
}
g = c(9.34, 8.24, NA, 1.345, 0.56, 0, NA, 7.89)
imputeMean(g)

#-------Assignment 3-------#

# Q 1.
library(dplyr)

survey = read.csv("survey.csv")

# Males who are have never smoked 
MaleNonSmokers = filter(survey,Sex == "Male", Smoke == "Never")

# Students whose pulse rate is greater than 80
PulseGT80 = filter(survey, Pulse > 80) %>%  select(Sex, Exer, Smoke, Pulse)

# Create a variable of ratio of variables Wr.Hnd / NW.Hnd as Ratio_Hnd
RtHand = survey %>%  mutate(Ratio_Hnd = Wr.Hnd / NW.Hnd) %>%  
  select(Ratio_Hnd, Clap, Age) 

# Calculate the mean and standard deviation for the variable Age
DescStats = survey %>%  summarise(Mean_Age = mean(Age, na.rm = T), 
                                  SD_Age = sd(Age, na.rm = T))
# Calculate the mean and standard deviation for the variable 
# Age grouped by Sex
DescGrp = survey %>%  group_by(Sex) %>%  
  summarise(Mean_Age = mean(Age, na.rm = T), SD_Age = sd(Age, na.rm = T))


# Q 2.

# Given the files Items.csv, Orders.csv and Ord_Details.csv in the 
# folder datasets, merge them with appropriate keys to form a combined data.

orders = read.csv("Orders.csv")
ord_details = read.csv("Ord_Details.csv") 
items = read.csv("Items.csv") 

combined_step1 = merge(orders, ord_details, by = "Order.ID")
combined_data = merge(combined_step1, items, by = "Item.ID")
head(combined_data)

# Q 3. 3. Combine the data in the files Courses.csv and CourseSchedule.csv 
# with appropriate keys

courses = read.csv("Courses.csv")
course_sch = read.csv("CourseSchedule.csv")
course_data = inner_join(courses, course_sch, by = c("CourseID"="CourseCode"))

# Q 4. Consider a dataset comb1 in the datasets folder. Reshape the dataset to the following:

library(tidyverse)
comb1 = read.csv("comb1.csv")

comb1_long = comb1 %>% pivot_longer( cols = -District, names_to = "ItemType", values_to = "qty")

# Q 5. Consider the dataset comb2 in the datasets folder. 
# PatientID in the data is to be broken up into the format
# projectID-SiteID/PatientNumber. Create the dataset with the following:
  
comb2 = read.csv("comb2.csv")

comb2_split = comb2 %>% 
  separate(PatientID, into = c("projectID", "temp"), sep = "-") %>% 
  separate(temp, into = c("SiteID", "PatientNumber"), sep = "/")


#-------Assignment 4-------#

#1]
library(ggplot2)
library(insuranceData)
library(car)

data("AutoCollision")

  ggplot(AutoCollision, aes(x = Severity, y = Claim_Count, color = Vehicle_Use)) +
    geom_point() +
    labs(title = "Severity by Claim Count", x = "Severity", y = "Claim Count")

# Q 2. Consider the dataset AutoCollision in the package insuranceData. 
# Generate the following plot using function
ggplot(AutoCollision, aes(x = Vehicle_Use, y = Claim_Count, fill = Vehicle_Use)) +
  geom_boxplot() +
  labs(title = "Claim Count by Vehicle type", x = "Vehicle Type", y = "Claim Count") +
  theme(legend.position = "none")

#3]
data("Ornstein")

ggplot(Ornstein, aes(x = nation, fill = sector)) +
  geom_bar() +
  labs(title = "Firms by Nation across Sectors", x = "Nation", y = "Count", fill = "Sector")

#4]
ggplot(Ornstein, aes(x = assets, y = interlocks, color = sector)) +
  geom_point() +
  facet_wrap(~nation, ncol =4 ) +
  labs(title = "Assets by Interlocks", x = "Assets", y = "Interlocks")

#5]
data("mtcars")

ggplot(mtcars, aes(x = disp, y = mpg, color = as.factor(gear))) +
  geom_point() +
  labs(title = "Displacement by MPG", x = "Displacement", y = "Miles Per Gallon", color = "Gear")