library(tidyverse)
data(table4a)
gather(table4a, `1999`,`2000`, key='year', value='cases')


marks <- data.frame(name=c("A","B","C","D"),
                    maths=c(75, 89, 86, 90),
                    physics=c(90, 95, 92, 85),
                    chem=c(90, 94, 98, 99))
gather(marks, physics, chem, maths,
       key="subject", value="marks")
# or
marks %>% 
  gather(physics, chem, maths, key="subject", value="marks")
# or
marks |> # also a pipeline operator
  gather(physics, chem, maths, key="subject", value="marks")

#############
# pivot_longer()
table4a
pivot_longer(table4a, cols = c(`1999`,`2000`), 
             names_to = "year", values_to = "cases")
# or
table4a %>% 
  pivot_longer(cols = c(`1999`,`2000`), 
               names_to = "year", values_to = "cases")
# or
table4a %>% 
  pivot_longer(cols = -c(country), 
               names_to = "year", values_to = "cases")

marks %>% 
  pivot_longer(cols = -c(name), 
               names_to = "subject", values_to = "marks")
marks %>% 
  pivot_longer(cols = c(physics,chem,maths), 
            
                  names_to = "subject", values_to = "marks")
##################
data(table2)
spread(table2, key = "type", value = "count")
# or
pivot_wider(table2, names_from = "type", 
            values_from = "count")
#######################
table3
separate(table3, col = rate, 
         into = c('cases','pop'), convert = T)
############################
table5
unite(table5, col = whole_year, century, year, sep="")



