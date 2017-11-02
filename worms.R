group <- rep(c("Treatment", "Control"), each=5)
worms <- c(10,2,1,2,7,10,17,7,16,10)

library(dplyr)
DF <- data.frame(group, worms)
str(DF)
DF %>% 
  group_by(group) %>%
  summarize(Mean = mean(worms),
            SD = sd(worms),
            Median = median(worms),
            iqr = IQR(worms))




left1 <- mean(c(10,10,10,1,2))
right1 <- mean(c(16,7,2,7,17))
dif1 <- left1-right1
dif1
left2 <- mean(c(2,1,10,2,7))
right2 <- mean(c(16,10,17,10,7))
dif2 <- left2-right2

left3 <- mean(c(2,1,10,17,7))
right3 <- mean(c(16,10,2,10,7))
dif3 <- left3-right3

left4 <- mean(c(1,10,10,7,7))
right4 <- mean(c(16,2,2,17,10))
dif4 <- left4-right4

left5 <- mean(c(10,7,7,2,10))
right5 <- mean(c(10,16,2,1,17))
dif5 <- left5-right5

left6 <- mean(c(7,10,2,17,10))
right6 <- mean(c(10,16,1,7,2))
dif6 <- left6-right6

left7 <- mean(c(7,17,16,1,2))
right7 <- mean(c(10,10,2,10,7))
dif7 <- left7-right7

left8 <- mean(c(17,16,10,10,10))
right8 <- mean(c(1,7,2,2,7))
dif8 <- left8-right8

left9 <- mean(c(17,2,10,1,10))
right9 <- mean(c(7,7,2,16,10))
dif9 <- left9-right9

left10 <- mean(c(2,10,17,7,10))
right10 <- mean(c(1,2,10,16,7))
dif10 <- left10-right10

dif <- c(dif1,dif2,dif3,dif4,dif5,dif6,dif7,dif8,dif9,dif10)
dif
dif <- mean(dif)
dif

#random shuffling of worms
ans <- numeric(10000)
for(i in 1:10000)
{
  index <- sample(10, 5, replace=FALSE)
  ans[i] <- mean(worms[index])-mean(worms[-index])
}


#if p < alpha (assume 5%), reject null hypo
t.test(ans, mu=7.6)
pvalue <- (sum(ans >= 7.6) +1)/(10000 + 1)
hist(ans)
mean(ans)
pvalue


#writing a function
test <- function(x)
{
  x^2
}
test(1:10)
#fundamental question for inference -- how does what you actually observe compare to if the null hypothesis
#were actually true and the process were repeated many times

#random shuffling of worms with replicate function
reptest <- function(x)
{
  index <- sample(10,5,replace=FALSE)
  MeanDiff <- mean(x[index]-mean(x[-index]))
  MeanDiff
}
reptest(worms)
#replicate(100, reptest(worms))

n <- 5
m <- 5

ncb <- choose(n + m, m)
ncb
CB <- t(combn(n+m, m))
head(CB)
nn <- dim(CB)[1]
nn

DF$worms

diffmeans <- numeric(nn)
for (i in 1:nn)
{
  diffmeans[i] <- mean(DF$worms[CB[i, ]] - mean(DF$worms[-CB[i, ]]))
}
sort(diffmeans)
sum(diffmeans >= 7.6)
#theoretical p value then = 7/252