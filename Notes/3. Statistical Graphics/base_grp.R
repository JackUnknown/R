a <- c(90, 34, 12, 25, 190)
barplot(a)

b <- c(99, 45, 21, 45, 170)
ab <- rbind(a,b)
ab
barplot(ab)
barplot(ab, beside = T)

setwd("D:/Training/Academy/R Course (C-DAC)/Datasets")
cars93 <- read.csv("Cars93.csv")
barplot( table(cars93$Type) )
barplot( table(cars93$Type), horiz = T )

barplot( table(cars93$Type) , col = "lightsalmon1")
colors()

barplot( table(cars93$Type) ,
         col = c("lightsalmon1","wheat2","yellow1",
                 "thistle","tan3","seashell4") )
###################################################
hist(cars93$Price)
hist(cars93$Price, col="thistle",
     main="Histogram of Price",
     xlab = "Price", ylab = "Count")

hist(cars93$Price, col="thistle",breaks = 20,
     main="Histogram of Price",
     xlab = "Price", ylab = "Count")

#################################################

boxplot(cars93$Price)
boxplot(cars93$Price ~ cars93$Origin)
boxplot(cars93$Price ~ cars93$Type,
        col = c("lightsalmon1","wheat2","yellow1",
                "thistle","tan3","seashell4"))

################################################
pie(table(cars93$Type))
pie(table(cars93$Cylinders))
pie(table(cars93$Price.Category))
###############################################

plot(cars93$EngineSize, cars93$Price,
     xlab = "Engine Size", ylab = "Price")

plot(cars93$EngineSize, cars93$Price,
     xlab = "Engine Size", ylab = "Price",
     pch=17, col="lightsalmon1")

#### Time series
coal <- read.csv("Coal Consumption.csv")
plot(coal$Month, coal$Amount, type = "l",
     xlab = "Month", ylab = "Amount",
     main="Line Graph")
plot(coal$Month, coal$Amount, type = "b",
     xlab = "Month", ylab = "Amount",
     main="Line Graph")
##############################################

plot(density(cars93$Price))

####################################################
sing_auto <- read.csv("SingaporeAuto.csv")
boxplot(sing_auto$Exp_weights, col="pink",
        main="Weights")

boxplot(sing_auto$Exp_weights ~ sing_auto$VehicleType,
        col=c(2,5,7,90,670, 349,455, 600,500))

cars2 <- read.csv("cars2.csv")
plot(cars2$speed, cars2$dist, pch=17,col="purple",
     xlab = "Speed", ylab = "Distance",
     main = "Speed by Distance")
