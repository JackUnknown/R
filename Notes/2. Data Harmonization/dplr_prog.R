setwd("D:/Training/Academy/R Course (C-DAC)/Datasets")
library(tidyverse)

cars93 <- read.csv("Cars93.csv")

ar_cars <- arrange(cars93, Price)
ar_cars <- arrange(cars93, desc(Price))

ar_cars <- arrange(cars93, Type, Price)
############################################
sl <- select(cars93, Manufacturer, Price, RPM)
sl <- select(cars93, Manufacturer:Max.Price)

sl_cars <- select(cars93, starts_with("MPG"))
sl_cars <- select(cars93, starts_with("M"))

sl_cars <- select(cars93, ends_with("Price"))
sl_cars <- select(cars93, contains("in"))
#############################################
ss_cars <- filter(cars93, Type=="Small")
ss_cars <- filter(cars93, Type=="Small" & Price>10)

ss_cars <- filter(cars93, Type %in% c("Small","Compact"))
##########################################################

ren_cars <- rename(cars93, Maximum=Max.Price, 
                   Minimum=Min.Price)

########################################################
## Creating any new column in existing data frame
data(cars)
cars$ratio <- cars$speed/cars$dist
# or
data(cars)
cars <- mutate(cars, ratio=speed/dist)
######################################################
summarise(cars93, mu_price = mean(Price))
summarise(cars93, mu_price = mean(Price),
          mu_rpm=mean(RPM), mu_hp=mean(Horsepower))
# Equivalent SQL stmt:
# select avg(Price) as mu_price, avg(RPM) as mu_RPM,
# avg(Horsepower) as mu_hp from cars93


grp_typ <- group_by(cars93,Type)
summarise(grp_typ, mu_price = mean(Price),
          mu_rpm=mean(RPM), mu_hp=mean(Horsepower))
# Equivalent SQL stmt:
# select avg(Price) as mu_price, avg(RPM) as mu_RPM,
# avg(Horsepower) as mu_hp from cars93
# group by Type
#######################################################
a <- read.csv("A.csv")
b <- read.csv("B.csv")
ab <- inner_join(a,b,by="IdNum")
lj <- left_join(a,b,by="IdNum")
rj <- right_join(a,b,by="IdNum")
fj <- full_join(a,b,by="IdNum")

####################################################


ss <- filter( select(cars93, Manufacturer, Price, RPM),
        Price>10 )
# Equivalent SQL stmt:
# select Manufacturer, Price, RPM from cars93
# where Price>10

##################################################
ss <- cars93 %>% 
          select(Manufacturer, Price, RPM) %>% 
          filter(Price>10)



