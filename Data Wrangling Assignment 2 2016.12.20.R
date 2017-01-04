# finalized version to upload to Git for Data Wrangling Exercise # 2
#libraries
library(dplyr)
library(tidyr)
df<- read.csv("titanic_original.csv", header=TRUE)
summary(df)

#1 convert factor to character 
df$embarked <- as.character(df$embarked)
#make change to the characters 
df$embarked[df$embarked == ""] <- "S"
#3 turn character back to factor 
df$embarked <- as.factor(df$embarked)
#numbers checking
select(df, embarked) %>% 
  group_by(embarked) %>% 
  tally()

filter(df, df$embarked == C)
df[df$embarked == "C"]
df[embarked == C]
df = df[df$embarked == "C"]
df[df$embarked == C]

#calculate mean age
mean(df$age, na.rm = TRUE)
----
  Other variables to fill in the data in could be the median, minimum, maximum, percentiles, standard deviations above / below the mean. One benefit from using the mean is that
  the mean would continue to be preserved (similar with median) whereas using one of the other variables listed would skew the data descriptives. Ideally, I would use the other data points
  provided in order to provide an estimate for the missing age data. Alternatively, deleting the rows that have missing data is also an option. 
---- 
#29.88 is the mean age 
#replace missing values with mean 
df$age[is.na(df$age) == TRUE] <- "29.88"
df$age<-as.numeric(df$age)

#replace missing values with "NA"
df$boat[df$boat == ""] <- "NA"

#new column for presence of a cabin number 
df$has_cabin_number[df$cabin == ""] <- 0
df$has_cabin_number[df$cabin != ""] <- 1
---- 
  A cabin number associated with the passenger likely relates to whether or not they had their own cabin on the trip. For the majority of the passengers (~1000/1300) on the Titanic 
  a private cabin was likely not something they could afford so inputting a value other than null would not be the appropriate action.
--- 
