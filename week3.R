#omega = set of possible outcomes


m <- 60
p <-numeric(60)

#if E and F are 2 events in omega, P(E) != {}, conditional probability of F given E =


#Suppose we see 16 heads out of 20 flips, which would normally be strong evidence that the coin is biased. 
#However, suppose we had set a prior probability of a 99% chance that the coin is fair (50% chance of heads), 
#and only a 1% chance that the coin is biased (80% chance of heads). Find the posterior probability that the coin is
#fair, given that there is a 99% prior probability that the coin is fair.


p16_fair <- dbinom(16, 20, 0.5)
p16_biased <- dbinom(16, 20, 0.80)
p_fair <- 0.99
p_biased <- 0.01
pfair_16 <- (p16_fair * p_fair) / (p16_fair * p_fair + p16_biased * p_biased)
pfair_16

#fair <- rbinom(99000, 20, 0.5)
#biased <- rbinom(1000, 20, 0.80)
#DF <- data.frame(number = c(fair, biased), coin = c(rep("fair", 99000), rep("biased", 1000)))
#library(ggplot2)
#ggplot(data = DF, aes(x = number, fill = coin)) + 
#  geom_bar() +
#  facet_grid(coin ~ .) + 
#  theme_bw()



