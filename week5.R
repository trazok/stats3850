library(dplyr)
Ver <- read.csv("http://www1.appstate.edu/~arnholta/Data/Verizon.csv")
TBL <- Ver %>%
  group_by(Group) %>%
  summarize(Mean = mean(Time), n())
TBL
obs_diff <- 16.50913 - 8.411611
obs_diff
set.seed(41)
sims <- 10^4 - 1
ans <- numeric(sims)
for(i in 1:sims){
  index <- sample(1664 + 23, 23)
  ans[i] <- mean(Ver$Time[index]) - mean(Ver$Time[-index])
}

hist(ans)
pvalue <- (sum(ans >= obs_diff)+1)/(sims + 1)
pvalue
obs_diff

#null hyp: CLEC - ILEC = 0     ()

#layers: data, aesthetics, geometry, 

library(openintro)   #smoker data
data(smoking)
glimpse(smoking)

DF <- data.frame(x = ans)
library(ggplot2)
ggplot(data = DF, aes(x=x)) + geom_histogram(fill = "salmon", color="black") + theme_bw() 

ggplot(data=Ver, aes(x=Group, y=log(Time + .001), fill=Group)) + geom_boxplot() + coord_flip()

