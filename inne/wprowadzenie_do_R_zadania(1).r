# Zadanie 1.2
(x <- rep(c(TRUE, FALSE, TRUE, FALSE), c(3, 4, 2, 5)))
as.numeric(x)

# Zadanie 1.3
c((y <- c(c(1:20), (rep(c(0), 10)), c(seq(2, 40, by = 2)))), rev(y))
#lub
temp <- c(1:20, numeric(10), seq(2, 40, 2))
#numeric(10) - generuje 10 zer
#lub
c(1:20, rep(0,10), seq(2, 40, 2), seq(40,2,-2), numeric(10), 20:1)


# Zadanie 1.4
letters[seq(5, 25, by = 5)]

# Zadanie 1.5

z <- 1:1000
z[z %% 2 == 0] <- 1 / z[z %% 2 == 0]
z

#Zadanie 1.9

install.packages("schoolmath")
library(schoolmath)
data("primlist")
