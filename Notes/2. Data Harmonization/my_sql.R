library(RMySQL)
con <- dbConnect(MySQL(),
                 user = 'root',
                 password = 'root',
                 host = 'localhost',
                 dbname = 'sakila')
dbListTables(con)

film <- dbReadTable(con, "film")
#OR
query <- dbSendQuery(con, "SELECT * FROM film;")
data <- dbFetch(query,n = -1)

dbDisconnect(con)
