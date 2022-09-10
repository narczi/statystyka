# 1. Rozklad dwumianowy   = 1/m * srednia
# 2. Rozklad Possiona     = srednia
# 3. Rozklad jednostajny  = maximum z obserwacji
# 4. Rozklad normalny:
#   mi - wartosc oczekiwana = srednia
#   sigma - odchylenie standardowe = 
#   Estymator Najwiekszej Wiarygodnosci = sigma^2 - wariancja = S^2 z falka
#   Estymator Nieobciazaony o Minimalnej Wariancji - S^2
#   sigma^2 - wariancja = sigma^2 z falka

# Rozklad teoretyczny i empiryczny liczby bledow

# Przyklad 1 Liczba bledow na tescie

liczba_bledow <- c(1, 1, 2, 0, 1, 3, 1, 4, 4, 4, 0, 1, 0, 0, 0, 2, 3,
                   4, 0, 1, 5, 2, 3, 5, 3, 2, 2, 4, 0, 2, 2, 0, 2, 2,
                   3, 3, 1, 3, 2, 2, 0, 0, 5, 4, 2, 1, 5, 2, 2, 0)

m = 18
p_est <- 1/m * mean(liczba_bledow)

probs <- dbinom(sort(unique(liczba_bledow)), size = m, prob = p_est)

counts <- matrix(c(prop.table(table(liczba_bledow)), probs), nrow = 2, byrow = TRUE)
rownames(counts) <- c("empiryczny", "teoretyczny")
colnames(counts) <- sort(unique(liczba_bledow))

barplot(counts, 
        xlab = "Liczba bledow", ylab = "Prawdopodobienstwo",
        main = "Rozklady empiryczny i teoretyczny liczby bledow",
        col = c("red", "blue"), legend = rownames(counts), beside = TRUE)

# wykres Kwantyl-Kwantyl

qqplot(rbinom(length(liczba_bledow), size = m, prob = p_est), liczba_bledow)
qqline(liczba_bledow, distribution = function(probs) {qbinom(probs, size = m, prob = p_est)})


# Przyklad 2 Hamulce

hamulce <- read.table("http://ls.home.amu.edu.pl/data_sets/hamulce.txt", dec = ",")
# estymatory
(mu_est <- mean(hamulce$V1))
(sigma_est <- sd(hamulce$V1))

hist(hamulce$V1,
     xlab = "Dlugosc drogi hamowania",
     main = "Rozklady empiryczny i teoretyczny dlugosci drogi hamowania",
     probability = TRUE,
     col = "lightgreen")
lines(density(hamulce$V1), col = "red", lwd = 2)
curve(dnorm(x, mu_est, sigma_est),
      add = TRUE, col = "blue", lwd = 2)
legend("topleft", legend = c("empiryczny", "teoretyczny"), col = c("red", "blue"), lwd = 2)

# wykres kwantyl-kwantyl
qqnorm(hamulce$V1)
qqline(hamulce$V1)