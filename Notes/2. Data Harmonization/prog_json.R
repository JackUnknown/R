setwd("D:/Training/Academy/R Course (C-DAC)/Datasets")
library(jsonlite)
jsonData <- fromJSON("contacts.txt")
class(jsonData)
names(jsonData)

#nested objects
jsonData$phoneNumber
class(jsonData$phoneNumber)
jsonData$phoneNumber$number

##Converting data frames into JSON
mt_JSON <- toJSON(mtcars)
mt_JSON

## Import JSON into Data Frame
mt_DS <- fromJSON(mt_JSON)

### reading any other json file
it_json <- fromJSON("Items.json")
names(it_json)

items_df <- data.frame(id = it_json$Item.ID,
                       name = it_json$Item.Name,
                       type = it_json$Item.Type,
                       brand = it_json$Brand)

it_df <- read_json("Items.json", simplifyVector = T)
names(it_df)
it_df$Item.ID
