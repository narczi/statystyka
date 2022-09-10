#Zadanie 1 Hamulce
#ENW - Estymator Najwiekszej Wiarygodnosci
#EN - Estymator Nieobciazony
#ENMW - Estymator Nieobciazaony o Minimalnej Wariancji
hamulce <- read.table("http://ls.home.amu.edu.pl/data_sets/hamulce.txt", dec = ",")

hist(hamulce$V1,
     xlab = "Dlugosc drogi hamowania",
     main = "Rozklady empiryczny i teoretyczny dlugosci drogi hamowania",
     probability = TRUE,
     col = "lightgreen")

#przyjety rozklad teoretyczny to rozklad normalny

mu_est = mean(hamulce$V1)

#1 S
sigma_est = sd(hamulce$V1)
#2 
sigma_est_kwadrat = sd(hamulce$V1) * 1/length(hamulce$V1)
#3 
ENMW <- (sqrt(49/2))*((gamma(49/2))/(gamma(50/2)))*sigma_est

#lines(density(hamulce$V1), col = "red", lwd = 2) # empiryczny
curve(dnorm(x, mu_est, sigma_est), add = TRUE, col = "blue", lwd = 2) # teoretyczny S
curve(dnorm(x, mu_est, ENMW), add = TRUE, col = "red", lwd = 2) # teoretyczny ENMW

legend("topleft", legend = c("empiryczny", "teoretyczny"), col = c("red", "blue"), lwd = 2)