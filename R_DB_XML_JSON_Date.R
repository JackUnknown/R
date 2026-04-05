setwd("D:/R/Datasets/")

library(RMySQL)

mydb = dbConnect(MySQL(), user = 'root', password = 'bda123',
                 dbname = 'Sakila', host = 'localhost')

dbListTables(mydb)
dbListFields(mydb, 'actor')

rs = dbSendQuery(mydb, "select * from actor")
data = fetch(rs, n = -1)
dbClearResult(rs)
dbDisconnect(mydb)


#-----------------------------------------------------#

library(XML)

document = xmlTreeParse("foods.xml", useInternalNodes = TRUE)
rootNode = xmlRoot(document)
xmlName(rootNode)

names(rootNode)
class(rootNode)

rootNode[[1]]
names(rootNode[[1]])
rootNode[[1]][["price"]]


foods = xmlToDataFrame(document)


#-----------------------------------------------------#

setwd("D:/R/Datasets/")
library(jsonlite)
jsonData = fromJSON("contacts.txt")
class(jsonData)
names(jsonData)

#nested object
jsonData$phoneNumber
class(jsonData$phoneNumber)
jsonData$phoneNumber$number

# converting data frames into JSON  
mt_JSON = toJSON(mtcars)
mt_JSON

#Import JSON into data frame
mt_DS = fromJSON(mt_JSON)

## rading any othre json file
it_json = fromJSON('Items.json')
names(it_json)

items_df = data.frame(id = it_json$Item.ID,
                      name = it_json$Item.Name,
                      type = it_json$Item.Type,
                      brand = it_json$Brand)


#-----------------------------------------------------#


# Dates Class

dt = "2026-03-26"
class(dt)

dt = as.Date("2026-03-26")
class(dt)
unclass(dt) #it gives serial number of date

dt1 = as.Date("1970-01-01")
class(dt1)
unclass(dt1)

dt2 = as.Date("2026-01-16")
dt2+18

seq(from  = as.Date("2025-10-09"), to = as.Date("2025-12-31"))

seq(from  = as.Date("2025-10-09"), length= 12)

seq(from  = as.Date("2026-03-26"), length= 4, by = "week")

seq(from  = as.Date("2026-03-26"), length= 4, by = "month")

seq(from  = as.Date("2026-03-26"), length= 4, by = "year")

#---------------------------------------------------------------#

#Gives error
dt4 = as.Date("26-Mar-2026")

dt5 = as.Date("26-Mar-2026", format = "%d-%b-%Y")
dt5

#-----------------------------------------------------------#

library(lubridate)

dt6 = dmy("26-Mar-2026")
class(dt6)

dt6 = dmy("26/3/26")
dt6

dt6 = mdy("3/26/26")
dt6

month(dt6)
day(dt6)
year(dt6)

month(dt6) = 11
dt6

#-------------------------------------------------------#

orders = read.csv("Orders.csv")
str(orders)

orders$Order.Date = dmy(orders$Order.Date)
str(orders)

#------------------------------------------------------#



