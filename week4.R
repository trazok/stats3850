library(dplyr)
ChickWeight
str(ChickWeight)
glimpse(ChickWeight)



ChickWeight %>% 
  group_by(Diet) %>%
  summarize(Mean = mean(weight),
            SD = sd(weight),
            Median = median(weight),
            iqr = IQR(weight))
#count number of diets with 3 or 4
filter(ChickWeight, Diet==3 | Diet==4)

#dplyr functions
#head
#summary
#glimpse
#tbl_df

#5 verbs: 
#select(tbl, selectcolumn1, selectcolumn2) //returns subset of columns 
#filter() //returns subset of rows
#arrange(tbl, columntoarrange, tiebreaker) //reorder rows based on variables 
#mutate(tbl, newvariable = calculate new variable) //add columns from existing data
#summarize() //reduce each group to a single row
#group_by(tbl, columntogroupby)