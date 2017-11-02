library(readxl)
library(dplyr)
library(ggplot2)

DF <- read_excel("TMP.xlsx")

DFtable(DF$Age_Cohort)
DF$Age_Cohort <- ifelse(DF$Age_Cohort == "42898", "6-12", DF$Age_Cohort)
table(DF$Age_Cohort)

#Gender
DF1 <- DF %>%
  group_by(Gender) %>%
  summarize(meanExp = mean(Expenditures), median = median(Expenditures), n = n())
DF1
ggplot(data = DF1, aes(x = Gender, y = meanExp, fill = Gender)) + geom_bar(stat = "identity")

#Ethnicity
DF2 <- DF %>%
  group_by(Ethnicity) %>%
  summarize(meanExp = mean(Expenditures), median = median(Expenditures), n = n())
DF2
ggplot(data = DF2, aes(x = Ethnicity, y = meanExp, fill = Ethnicity)) + geom_bar(stat = "identity")

#Age_Cohort
DF3 <- DF %>%
  group_by(Age_Cohort) %>%
  summarize(meanExp = mean(Expenditures), median = median(Expenditures), n = n())
DF3
ggplot(data = DF3, aes(x = Age_Cohort, y = meanExp, fill = Age_Cohort)) + geom_bar(stat = "identity")

#Gender & Ethnicity
DF4 <- DF %>%
  group_by(Gender, Ethnicity) %>%
  summarize(meanExp = mean(Expenditures), median = median(Expenditures), n = n())
DF4
ggplot(data = DF4, aes(x = Ethnicity, y = meanExp, fill = Gender)) + geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = c("pink", "blue"))

#Ethnicity & Age_Cohort
DF5 <- DF %>%
  group_by(Ethnicity, Age_Cohort) %>%
  summarize(meanExp = mean(Expenditures), median = median(Expenditures), n = n())
DF5
ggplot(data = DF5, aes(x = Age_Cohort, y = meanExp, fill = Ethnicity)) + geom_bar(stat = "identity", position = "dodge")

