library(XML)
setwd("D:/Training/Academy/R Course (C-DAC)/Datasets")
document <- xmlTreeParse("foods.xml",
                         useInternalNodes = TRUE)

rootNode <- xmlRoot(document)
xmlName(rootNode)

names(rootNode)
class(rootNode)

rootNode[[2]]
names(rootNode[[2]])
rootNode[[2]][["price"]]

# XML to dataframe
foods <- xmlToDataFrame(document)

######## Books.xml
document <- xmlTreeParse("books.xml", 
                         useInternalNodes = TRUE)
books <- xmlToDataFrame(document)

