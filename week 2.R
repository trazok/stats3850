
str(mtcars)


summary(mtcars)


hist(mtcars$qsec)
mean(mtcars$qsec)
#standard deviation for standard shape
sd(mtcars$qsec)

hist(mtcars$mpg)
median(mtcars$mpg)
#inner quartile range for nonstandard 
IQR(mtcars$mpg)

#parameter -- numerical summary from a population
#statistic -- numerical summary from a sample
#n = sample number, N = population number
#var() = sample variance


#1. hypothesis; null is about population. mean = value. no difference hypothesis //  alt is mean < > != value
#2. test statistic; 
#3. rejection region(s); 
#4. statistical conclusion; if test statistic is in rejection region, reject null hypothesis
#5. english conclusion; 

#z score -- (statistic - mean) / SD   // how far from the mean in standard units
#t score -- (statistic - mean) / ~SD  // 


set.seed(123)
x <- runif(20, 0, 20)
t.test(x, mu=10)

set.seed(231)
X <- rnorm(1000, 10, 2) + runif(1000, 7, 13)
hist(X)
set.seed(893)
Y <- rexp(1000, 0.1)*(-1) + 100
hist(Y)
t.test(X, mu=20)



S <- c(1,2,3,4,5)
S

##find sample mean, Xbar
xbar <- sum(S) / sum(!is.na(S))
xbar

##find sample  variance, S^2
var(S)

#find SD
sd(S)

#dice shit
#variance? V[X] = E[(X - Mu of x)^2]
#sigma from 1 to n (X - Mu of x) ^2 * probably of happening
#substituted d for x
D <- 1:6
pd <- rep(1/6, 6)
ED <- sum(D * pd)
ED

VD <- sum((D-ED)^2 * pd)
VD

#english conclusion always deals with alternative hypothese
#if no value stated, use .05 as p value gauge
