setwd("D:/R/Datasets/")

a = read.csv("A.csv")
a

cars93 = read.csv("Cars93.csv")
cars93

colnames(a)
colnames(cars93)

dim(a)
dim(cars93)

cars93[3,4]
cars93[4,]
cars93[,1]
cars93[, c(1,2,3)]
cars93[c(1,2,3),]
ss_cars = subset(cars93, 'Price'>50)
ss_cars = subset(cars93, Price>50 & Type == 'Compact')
ss_cars = subset(cars93, 'Price'>50 | 'Type' == 'Compact')

ss_cars = subset(cars93, 'Price'>50 , select = c(Manufacturer, Model, Price))
###############################################
ss_cars1 = subset(cars93, Type == 'Small' & Origin == 'USA')

ss_cars2 = subset(cars93, Origin == 'non-USA' & Horsepower > 150)


str(a)
str(cars93)

diam = read.csv2("Diamonds.csv")
dim(diam)


boly1 = read.csv("Bollywood_2015.csv")
colnames(boly1)

boly2 = read.csv("Bollywood_2015_2.csv", header = F)
colnames(boly2) = c("Movie_Name","BO_Collection","Budget", "Box_Office_Verdict")
colnames(boly2)


#install.packages("openxlsx")
library(openxlsx)
#bnk = read.xlsx("bankruptcy.xlsx", sheet = 3) # sheet = "data"(either number or sheet name)
bnk = read.xlsx("bankruptcy.xlsx", sheet = "data")
bnk


###################################
data()
data(airquality)
data(CO2)
###################################
#saving any data frame to local drive in .csv format
data(Formaldehyde)
write.csv(Formaldehyde, 'Formaldehyde.csv')

###################################

v = c(10,20,30,40,50,60,70,80)
v>50 # [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
v[v>50] # [1] 60 70 80
v[1] # [1] 10
v[c(3,5,1)] # [1] 30 50 10

##################################

s= 23
if(s>20)
  print('Greater') else
  print('Lesser')

if (s<20){
  print('Greater')
} else{
  print('Lesser')
}

p = 750000
n = 4
r = 8
si = p*n*r/100
if (si > 100000)
  tax = si*0.1 else
    tax = 0
paste('Tax = ', tax)

#-------------------------------------#

for (i in 1:5)
  print(i*i)

#-------------------------------------#

v = c(1,4,9,16,25)
for (r in v)
  print(sqrt(r))
#OR
sqrt(v)

#-------------------------------------#
cnt = 1
while(cnt<=4){
  print(cnt)
  cnt = cnt + 1
}

#-------------------------------------#
#break statement
for(i in 1:6){
  if(i==4) break
  print(i)
}

#-------------------------------------#
#next statement similar to continue 
for(i in 1:6){
  if(i==4) next
  print(i)
}

#-------------------------------------#
diab = read.csv("diabetes.csv")
diab
str(diab)
#-------------------------------------#

v = c('a','a','b','c','d','c','b')
b = c('rahul','shrini','hitesh')

fv = factor(v)
fv
as.integer(fv)

unique(diab$location)
diab$location = factor(diab$location)
str(diab)

diab = read.csv("diabetes.csv", stringsAsFactors = T)
str(diab)


diab$location = factor(diab$location,levels = c("Louisa", "Buckingham"))
str(diab)

#------------------------------------------------------#

seq(1,5)
seq(1,10,2)
seq(10,1,-2)

#-----------------------------------------------------#

table(diab$location)
table(diab$gender)
#crosstab or contigency table
table(diab$gender,diab$location)
addmargins(table(diab$gender,diab$location))

#-----------------------------------------------------#
exp(1)
exp(2)
log(7.389056)
#-----------------------------------------------------#
marks = c(23,34,10,20,15,17,19,33,39)
result = ifelse(marks>16,'Pass','Fail')
result
#----------------------------------------------------#

mean(diab$age)

mean(diab$chol) #has one NA value so it gives NA as output
mean(diab$chol, na.rm = T) #ignores the NA values if any

var(diab$chol, na.rm = T)
var(diab$bp.1s, na.rm = T)

sd(diab$chol, na.rm = T)
sd(diab$bp.1s, na.rm = T)

summary(diab$chol)
summary(diab$location)
summary(diab)

#----------------------------------------------------#

attach(diab)
mean(chol) #has one NA value so it gives NA as output
mean(chol, na.rm = T) #ignores the NA values if any

var(chol, na.rm = T)
var(bp.1s, na.rm = T)

sd(chol, na.rm = T)
sd(bp.1s, na.rm = T)
detach(diab)
var(chol, na.rm = T)

#----------------------------------------------------#

simple_int = function(p,n,r){
  si = p*n*r/100
  si
}
simple_int(23000,5,7)

p = c(23000,34000,12000)
n = c(3,5,1)
r = c(7,8,9)
simple_int(p,n,r)



mean_sd = function(input){
  mu = mean(input, na.rm = T)
  sig = sd(input, na.rm = T)
  list(mean= mu, sd = sig)
}

mean_sd(diab$chol)


#------------------------------------------#

setwd("D:/R/Datasets/")
ord = read.csv('Orders.csv')
str(ord)

summary(ord)

temp = function(f){
  (f-32)*5/9
}
temp(c(100,60))

#--------------------------------------------#

impute_missing = function(input) {
  mu = mean(input, na.rm = T)
  ifelse(is.na(input), mu, input)
}
impute_missing(c(9,8,NA,7,6))

#to create the functions automatilally select the funtion defination code lines 
#and go the code tab in the menu bar then select extract function -> 
#give name to funtion
imputeMean <- function(input) {
  mu = mean(input, na.rm = T)
  ifelse(is.na(input), mu, input)
}








