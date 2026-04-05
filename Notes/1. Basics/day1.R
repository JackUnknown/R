p <- 45000
n <- 3
r <- 6
si <- p*n*r/100
si

###############################################
x <- c(3.56, 4.56, 2.99, 1.56, 9.45, 0.34)
class(x)
g <- c("r","k","g","k","r","r")
class(g)

x+3
x*2

p <- c(45000, 67000, 100000, 50000)
n <- c(3, 5, 3, 4.5)
r <- c(7.7, 6.7, 5, 8.9)
si <- p*n*r/100
si


a <- c(7, 4, 5, 2)
b <- c(0.2, 0.3)
a+b


v <- c(4.56, 9, "lo")
v
#############################################
k <- list(a=2, b=3.45, c="hi", d=3, e=T)
names(k)

k['a']
k$a
k$c

k <- list(a=2, b=c(3.45, 56, 89, 8), c="hi", d=3, e=T)
k$b
k[2]

########################################################
m <- matrix(c(5,4,2,12,14,20), 3, 2)
m

m <- matrix(c(5,4,2,12,14,20), 3, 2, byrow = T)
m

v1 <- c(9,3,5,6)
v2 <- c(7,3,1,2)
rbind(v1, v2)
cbind(v1, v2)



v1 <- c(9,3,5,6, 90)
v2 <- c(7,3,1)
rbind(v1, v2)

#######################################################

d <- array(dim = c(5))
d[2] = 9
d[4] = 40
d

g <- array(dim=c(4,6))
g[2,3] = 90
g[1,2] = 5
g

a <- array(dim=c(3,5,2))
a

############################################################

a <- c("Atul","Pravin","Shweta","Rekha")
b <- c(23, 34, 32, 29)
p <- c("A","C","A","B")
df <- data.frame(a,b,p)
df

##########################################################

a <- read.csv("D:/Training/Academy/R Course (C-DAC)/Datasets/A.csv")
cars93 <- read.csv("D:/Training/Academy/R Course (C-DAC)/Datasets/Cars93.csv") 

setwd("D:/Training/Academy/R Course (C-DAC)/Datasets")
a <- read.csv("A.csv")
cars93 <- read.csv("Cars93.csv") 

colnames(a)
colnames(cars93)

dim(a)
dim(cars93)

str(a)
str(cars93)

## for reading ; separated file
diam <- read.csv2("Diamonds.csv")
dim(diam)

bolyw <- read.csv("Bollywood_2015.csv")
bolyw

bolyw2 <- read.csv("Bollywood_2015_2.csv", header = F)
colnames(bolyw2) <- c("Movie", "BO", "Budget", "Verdict")

library(openxlsx)
bnk <- read.xlsx("bankruptcy.xlsx", sheet = 3)
bnk <- read.xlsx("bankruptcy.xlsx", sheet = "data")

#################################################################
data() # resident datasets in R
data(airquality)
data(CO2)
data(Formaldehyde)
#################################################################
# Saving any data frame to hard drive in .csv

write.csv(Formaldehyde, "framldehy.csv")

###############################################################
v <- c(34, 56, 76, 89, 12, 14, 90, 35)
v>50
v[v>50]
###############################################################
v[c(3,5,1)]
###############################################################
m <- matrix(c(5,4,2,12,14,20,5,23,50,10,34, 19), 3, 4)
m

m[2,2]
m[2,3]
m[2,] # getting entire 2nd row
m[,3] # getting entire 3rd column
##############################################################
cars93 <- read.csv("Cars93.csv") 
cars93[3,4]
cars93[4,]
cars93[,5]
cars93[,c(5,9,7,8)]
cars93[c(5,9,7,8),]

ss_cars <- subset(cars93, Price>25 & Type=="Compact")
ss_cars <- subset(cars93, Price>25 | Type=="Compact")

ss_cars <- subset(cars93, Price>25 & Type=="Compact",
                  select = c(Manufacturer, Model, Type, Price))

## SQL : select Manufacturer, Model, Type, Price from
###         cars93 where Price>25 & Type="Compact"

################################################################
##1. Subset cars93 to get only Small cars with USA origin
ss <- subset(cars93, Type=="Small" & Origin=="USA")

##2. Subset cars93 to get only non-USA origin cars 
###  with horsepower>150
ss2 <- subset(cars93, Origin=="non-USA" & Horsepower>150)


