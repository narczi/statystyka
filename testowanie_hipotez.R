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

#Kroki: 
#1. niezaleznosc, 
#2. normalnosc, 
#3. rownosc wariancji, 
#4. glowny test t-studenta

# 1.Czy nasz proby sa niezalezne? - Tak, bo to sa dwie rozne szkoly i rozni uczniowie.
# 2. Rysujemy sobie boxplota
boxplot(homework)

shapiro.test(homework$Private)
#p-value jest wieksza niz 0,05 wiec mamy normalnosc

shapiro.test(homework$Public)
#p-value jest wieksza niz 0,05 wiec mamy normalnosc

#test F-Snedcora
var(homework$Private)
var(homework$Public)

var.test(homework$Private, homework$Public, alternative = "less")

#Hipoteza alternatywna w tescie F-Snedcora 
#h1: sigma_1^2 < sigma_2^2

#p-value = 0.35 czyli brak podstaw zeby odrzucic h0 (czyli mamy rownosc wariancji)

t.test(homework$Private, homework$Public,
       var.equal = TRUE, alternative = "greater") 

#odrzucamy h0, bo p-value jest mniejsze niz 0,05


# Test t-studenta dla prob zaleznych HIPNOZA

a <- c(6.6, 6.5, 9.0, 10.3, 11.3, 8.1, 6.3, 11.6)
b <- c(6.8, 2.5, 7.4, 8.5, 8.1, 6.1, 3.4, 2.0)
boxplot(a, b)

shapiro.test(a)
shapiro.test(b)

#hipoteza alternatywna
mean(a)
mean(b)
t.test(a,b, alternative = 'greater', paired = TRUE)