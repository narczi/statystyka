#Test Shapiro-Wilka sprawdza normalnosc (czy pochodzi z rozkladu normalnego)

#Test T-Studenta (ktorych jest kilka) wymaga aby proba pochodzila z rozkladu normalnego

x <- c(242.2, 243.8, 252.8, 245.4, 245.6, 253.6, 247.3, 238.7,
       241.6, 242.8, 251.1, 246.8, 247.0, 245.6, 242.2, 253.9)

shapiro.test(x)

# 1. sprawdzamy normalnosc
# h0 zaklada ze jest to rozklad normalny
# p-wartosc > 0,05
# brak podstaw do odrzucenia h0
# mamy normalnosc

# 2. sprawdzamy t-studenta
# h0: mu = 250g czy srednia waga jest rowna nominalnej wadze

mean(x)
#srednia = 246.275 wiec wybieramy hipoteze:
#H1: mu < 250

t.test(x, mu = 250, alternative = "less")
#p-value = 0.002595 < 0,05 - roznica jest statystycznie istotna
# odrzucamy h0, prawdziwa jest h1



# 2 Test t-Studenta dla dwoch prob niezaleznych

#h0: mu_1 = mu_2 hipoteza zerowa mowi ze srednie sa takie same, np. 
#srednia waga czekolady jest taka sama dla jednego automatu i dla drugiego

# Przyklad Homework

library(UsingR)
head(homework)

# 1.Czy nasz proby sa niezalezne? - Tak, bo to sa dwie rozne szkoly i rozni uczniowie.
# 2. Rysujemy sobie boxplota
boxplot(homework)