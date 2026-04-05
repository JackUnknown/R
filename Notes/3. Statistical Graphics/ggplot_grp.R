library(tidyverse)
setwd("D:/Training/Academy/R Course (C-DAC)/Datasets")
cars93 <- read.csv("Cars93.csv")
ggplot(data = cars93, aes(x=EngineSize, y=Price))+
  geom_point()

ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,color=Origin))+
  geom_point()

ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,color=AirBags))+
  geom_point()

ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,color=MPG.city))+
  geom_point()

# Bubbles plot
ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,size=MPG.city))+
  geom_point(color="blue", alpha=0.3)
# alpha is transparency parameter

ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,size=MPG.city,
           shape=AirBags))+
  geom_point(color="blue", alpha=0.3)

ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,size=MPG.city,
           shape=AirBags, color=Origin))+
  geom_point(alpha=0.5)

ggplot(data = cars93, 
       aes(x=EngineSize, y=Price)) +
  geom_point()+geom_smooth(method="lm",se=F)
# plotting linear regression line

################################################
ggplot(data = cars93, aes(x=Price))+
  geom_histogram(bins=15, color="red", fill="pink")

ggplot(data = cars93, aes(x=Price))+
  geom_histogram(binwidth = 5, color="red", fill="pink")

#################################################
ggplot(data = cars93, aes(x=Price))+
  geom_density(color="red", fill="pink")
#################################################

ggplot(data = cars93, aes(x=Type))+
  geom_bar(color="red", fill="pink")

ggplot(data = cars93, 
       aes(x=Type, group = Origin, fill=Origin))+
  geom_bar(position = 'dodge')

ggplot(data = cars93, 
       aes(x=Type, fill=AirBags))+
  geom_bar(position = 'dodge')

ggplot(data = cars93, 
       aes(x=Type, fill=AirBags))+
  geom_bar(position = 'dodge')+
  coord_flip()

ggplot(data = cars93,
       aes(x=Type))+
  geom_bar()

mean_price <- cars93 %>% 
                group_by(Type) %>% 
                summarise(mu_price=mean(Price))

ggplot(data = mean_price, 
       aes(x=Type,y=mu_price, fill=Type))+
  geom_bar(stat = 'identity')+
  labs(y="Mean Price", x="Car Type")

####################################################
ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,color=Origin))+
  geom_point()

ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,color=Origin))+
  geom_point()+facet_grid(. ~ Origin)

ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,color=Origin))+
  geom_point()+facet_grid(Origin ~ .)

ggplot(data = cars93, 
       aes(x=EngineSize, y=Price,color=Origin))+
  geom_point()+facet_grid(Type ~ Origin)

######################################
ggplot(data = cars93, 
       aes(x=Type, y=Price, fill = Type))+
  geom_boxplot()

##########################################

orns <- read.csv("Ornstein.csv")
ggplot(data=orns, 
       aes(x=assets, y=interlocks,color=sector))+
  geom_point()+
  facet_grid(.~nation)

########################################
mtcars$gear <- factor(mtcars$gear)
ggplot(data=mtcars, aes(x=disp, y=mpg,color=gear))+
  geom_point()
