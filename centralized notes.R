library(dplyr)


DF <- ChickWeight %>%
  filter(Diet %in% c(3,4))

DF

DF %>%
  group_by(Diet) %>%
  summarise(mean(weight), var(weight), n())



t.test(weight~Diet, data=DF)
#if p < alpha (defaul to 0.05), reject the null hypo
#reject null, or fail to reject. no confirming
#conclusion always in terms of alt hypo

#type 1 error: reject h0 when h0 is true
#type 2 error: fail to reject h0 when h0 is false


#GGPLOT ----------------------------------------------

#boxplot
#bargraph
#jitter/point



#BINOM --------------------------------------------------
// Generate 100 occurrences of flipping 10 coins, each with 30% probability
  rbinom(100, 10, .3)
  rbinom(# of repeats, # of flips, % chance)

// Calculate the probability that 2 are heads using dbinom
    dbinom(2, 10, .3)  
    dbinom(# equal to heads, # of flips, % chance)  
    
      equivalent to:
      # Confirm your answer with a simulation using rbinom
      mean(rbinom(10000, 10, .3) == 2)
  
// Calculate the probability that at least five coins are heads
  1 - pbinom(4, 10, .3)
  pbinom(# <= heads, # of flips, % chance)
         
      equivalent to:
      # Confirm your answer with a simulation of 10,000 trials
      mean(rbinom(10000, 10, .3) >= 5)
      
//# Simulate 100,000 flips of a coin with a 40% chance of heads
  A <- rbinom(100000, 1, .4) 

  # Simulate 100,000 flips of a coin with a 20% chance of heads
  B <- rbinom(100000, 1, .2)

  # Estimate the probability both A and B are heads
  mean(A & B)      
  
  
  
  
      
#PVALUE ---------------------------------------------------
  the probability that you observe a value as extreme as ___ based on the null hypothesis being true
#RANDOM NOTES-----------------------------------------------
funadmental question of inference -- how does what you actually observe compare to what would happen if the null
  hypothesis were true, and you repeat the process many times?