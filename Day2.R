#create a dataframe
DF1 <- data.frame(age = c(23, 21, 21, 21, 22),
                  height = c(72, 72, 67, 70, 67),
                  year_group = factor(rep("Senior", 5)))
#print dataframe
DF1

#count number of ages over 21
sum(DF1$age >= 22)

DF1[DF1$age >= 22, ]

#create matrix A by rows
A <- matrix(c(7,6,18,20),
            byrow = FALSE,
            nrow = 2)

#create matrix A2 by cols
A2 <- matrix(c(7,18,6,20),
             byrow = TRUE,
             ncol = 2)

#transpose A2
t(A2)

#print all
A
A2
t(A2)

