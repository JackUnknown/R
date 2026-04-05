setwd("D:/R/Datasets/")
library(tidyverse)

cars93 = read.csv("cars93.csv")
ar_cars = arrange(cars93, Price)
ar_cars = arrange(cars93, desc(Price))
ar_cars = arrange(cars93, Type, Price)

####################################################

s1 = select(cars93, Manufacturer, Price, RPM)
s1 = select(cars93, Manufacturer:Max.Price)

s1_cars = select(cars93, starts_with("Max"))
s1_cars = select(cars93, starts_with("MPG"))
s1_cars = select(cars93, starts_with("M"))
s1_cars = select(cars93, ends_with("Price"))
s1_cars = select(cars93, contains("in"))

####################################################

ss_cars = filter(cars93, Type == "Small")
ss_cars = filter(cars93, Type == "Small" & Price > 10)

ss_cars = filter(cars93, Type %in%  c("Small", "Compact"))

###########################################################

ren_cars = rename(cars93, Maximum = Max.Price, Minimum = Min.Price)

###################################################################

## Crating new columns in existing dataframes

data(cars)
cars$ratio =cars$speed/cars$dist
#OR 
data(cars)
cars = mutate(cars, ratio = speed/dist)

############################################

##summarize function
summarise(cars93, mu_price = mean(Price))
summarise(cars93, mu_price = mean(Price) , mu_rpm = mean(RPM), mu_hp = mean(Horsepower))

#group by function with summarize function
grp_typ = group_by(cars93, Type)
summarise(grp_typ, mu_price = mean(Price) , mu_rpm = mean(RPM),  mu_hp = mean(Horsepower))

##########################################################################################

## Joins in R
a = read.csv("A.csv")
b = read.csv("B.csv")

ab = inner_join(a,b, by = "IdNum")
lj = left_join(a,b, by = "IdNum")
rj = right_join(a,b, by = "IdNum")
fj = full_join(a,b, by = "IdNum")

##########################################

#filter function
# select Manufacturer, Price, RPM from cars93
# where Price > 10
ss = filter(select(cars93, Manufacturer, Price, RPM), Price > 10)
#OR
ss = cars93 %>% select(Manufacturer, Price, RPM) %>% filter( Price > 10)


grp_typ = group_by(cars93, Type)
summarise(grp_typ, mu_price = mean(Price) , mu_rpm = mean(RPM),  mu_hp = mean(Horsepower))
#OR
cars93 %>% 
  group_by(Type) %>% 
  summarise(mu_price = mean(Price),
            mu_rpm = mean(RPM), mu_hp = mean(Horsepower), mu_hp = mean(Horsepower))







