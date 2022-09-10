#Zadanie 4.2
# 200 losowo wybranych zg³oszeñ

#Pkt.1. Cecha iloœciowa dyskretna, model Poissona

getwd()
setwd("J:/Statystyka")

(Centrala <- read.table("Centrala.RData")) #Ÿle, z tym rozszerzeniem przez load('nazwa z rozsz")


load("Centrala.RData")

head(Centrala)
View(Centrala)

dane <- c(Centrala[[1]])

est <- mean(dane)
est

probs <- dpois(sort(unique(dane)), est)

sum(probs)

#empiryczny to s¹ procentowo, ile danych wyników by³o, a teoretyczny wynika z rozk³adu Poissona

counts <- matrix(c(prop.table(table(dane)), probs), nrow = 2, byrow = TRUE)
rownames(counts) <- c("empiryczny", "teoretyczny")
colnames(counts) <- sort(unique(dane))
counts

# porównanie dwóch wykresów rozk³adóW empirycznego i teoretycznego

barplot(counts,
        xlab = "Liczba zg³oszeñ", ylab = "Prawdopodobieñstwo",
        main = "Rozk³ady empiryczny i teoretyczny liczby zg³oszeñ",
        col = c("red", "blue"), legend = rownames(counts), beside = TRUE)

# wykres kwantyl-kwantyl

qqplot(rpois(length(dane), est), dane)
qqline(dane, distribution = function(probs) { qpois(probs, est) })



#przedzia³y ufnoœci (trzema metodami) dla parametru rozkladu teoretycznego

install.packages("EnvStats")
library(EnvStats)


#ci.method = "exact"
epois(Centrala$Liczba,
      method = "mle/mme/mvue",
      ci = TRUE, ci.type = "two-sided", conf.level = 0.95,
      ci.method = "exact")$interval$limits

#ci.method = "pearson.hartley.approx"

epois(Centrala$Liczba,
      method = "mle/mme/mvue",
      ci = TRUE, ci.type = "two-sided", conf.level = 0.95,
      ci.method = "pearson.hartley.approx")$interval$limits

# ci.method = "normal.approx"

epois(Centrala$Liczba,
      method = "mle/mme/mvue",
      ci = TRUE, ci.type = "two-sided", conf.level = 0.95,
      ci.method = "normal.approx")$interval$limits




# Zadanie 4.3

awarie <- read.table("awarie.txt")

View(awarie)

czas_pracy <- c(awarie[[1]])

# oblicz ENW parametr rozk³adu teoretycznego

estym <- (1 / mean(czas_pracy)) #odrotnoæ redniej przy rozkl.wykadniczym
estym


#Porównaj rozk³ad empiryczny wyst¹pienia poszczególnych wartoœci
#czasu bezawaryjnej pracy w próbie z wartoœciami teoretycznymi uzyskanymi na podstawie rozk³adu teoretycznego

hist(czas_pracy,
     xlab = "Bezawaryjny czas pracy",
     main = "Rozk³ady empiryczny i teoretyczny bezawaryjnego czasu pracy",
     probability = TRUE,
     col = "lightgreen")
lines(density(czas_pracy), col = "red", lwd = 2)
curve(dexp(x, rate = estym),
      add = TRUE, col = "blue", lwd = 2)
legend("topright", legend = c("empiryczny", "teoretyczny"), col = c("red", "blue"), lwd = 2)


# wykresy kwantyl-kwantyl

qqplot(czas_pracy)
qqline(czas_pracy)

#lub

library(EnvStats)
qqPlot(czas_pracy,
       distribution = "exp",
       param.list = list(rate = estym),
       add.line = TRUE)

?qqPlot
?qqexp
??qqexp
?qqnorm
