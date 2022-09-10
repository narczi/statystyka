# Testowanie hipotez statystycznych

# Zad.5.1 pomiary morza, cecha ci¹g³a iloœciowa

pomiary_morza <- c(862, 870, 876, 866, 871, 865, 861, 873, 871, 872)

# obliczenie estymatora mi (tutaj jest to œrednia)

morze_est <- mean(pomiary_morza)
morze_est

shapiro.test(pomiary_morza)

#powy¿ej wychodzi wartoœæ p wy¿sza od 0,05, brak podstaw do odrzucenia H0, mamy normalnoœæ, wymaga tego test
#t-Studenta

# poni¿ej wykres kwadryl-kwadryl

qqnorm(pomiary_morza)
qqline(pomiary_morza)

#test t-Studenta
# wybieramy less, bo estymator wyszed³ nam mniejszy ni¿ mi = 870

t.test(pomiary_morza, mu = 870, alternative = "less")

# w tescie wysz³a nam wartoœæ p wiêksza ni¿ poziom istotnoœci, czyli nie mo¿emy
#odrzuciæ tezy H0 o œredniej g³êbokoœci


# Zada. 5.2  dwie próby porównanie proszków

proszek_A <- c(78.2, 78.5, 75.6, 78.5, 78.5, 77.4, 76.6)
proszek_B <- c(76.1, 75.2, 75.8, 77.3, 77.3, 77.0, 74.4, 76.2, 73.5, 77.4)

#wykres pude³kowy
boxplot(proszek_A, proszek_B)
 
# H0 : mu_1 = mu_2
# H1 : mu_1 != > < mu_2

#test t-Studenta dla dwóch prób niezale¿nych

# 1. zalozenie: test na normalnoœæ

shapiro.test(proszek_A)
#wykresy
qqnorm(proszek_A)
qqline(proszek_A)

# p-value = 0.06833 > 0.05, nie ma podstaw do odrzucenia H0, mamy normalnoœæ

shapiro.test(proszek_B)

# p-value = 0.2559 > 0.05, nie ma podstaw do odrzucenia H0, mamy normalnoœæ

#mamy normalnoœæ dla A i dla B

# równoœæ wariancji; estymator dla wariancji (szacowanie parametrów)

var(proszek_A)
# [1] 1.304762

var(proszek_B)
# [1] 1.764

var(proszek_A)<var(proszek_B)

#test F-Snedecora

var.test(proszek_A, proszek_B, alternative = "less")
#p-value = 0.3684 - nie odrzucamy H0, mamy równoœæ wariancji

# test g³ówny

#obliczamy œredni¹ (szacowanie mi)
mean(proszek_A)
mean(proszek_B)

t.test(proszek_A, proszek_B, var.equal = TRUE, alternative = "greater")
# p-value = 0.01059 odrzucamy H0 na korzyœæ tezy alternatywnej H1: mu_1 > mu_2,
# proszek_A jest lepszy ni¿ proszek B



#Zadanie 5.3

#stosunek studentow do szkó³

a <- c(84, 87, 87, 90, 90, 90, 90, 93, 93, 96)
b <- c(89, 92, 98, 95, 95, 92, 95, 92, 98, 101)

#wykres pude³kowy
boxplot(a, b)

#test na normalnosc i wykresy
shapiro.test(a)
qqnorm(a)
qqline(a)
# p-value = 0.7026 > 0.05, nie ma podstaw odrzuciæ H0, mamy normalnoœæ

shapiro.test(b)
qqnorm(b)
qqline(b)
# p-value = 0.6915 > 0.05, nie ma podstaw, by odrzuciæ H0, mamy normalnoœæ, 
# w zwi¹zku z tym, test t-Studenta
# obliczamy œredni¹ (szacowanie mi)

mean(a)
#[1] 90
mean(b)
#[1] 94.7

#test g³ówny t-Studenta
t.test(a, b, alternative = "less", paired = TRUE)
# paired = TRUE: przy testach dla prób zale¿nych ustawiamy na TRUE, co oznacza, ¿e badamy parami,
#domyœlnie robi dla niezale¿nych, jest FALSE, dlatego musimy to podaæ

# odrzucamy H0, mówi o równoœci, o braku istotnych ró¿nic, 
# wyniki przed s¹ mniejsze ni¿ po, stosaunek nam wzrós³
# stosunek po obejrzeniu siê poprawi³, film spe³nia swoje zadanie



#Zadanie 5.4

M <- c(171, 176, 179, 189, 176, 182, 173, 179, 184, 186, 189, 167, 177)
K <- c(161, 162, 163, 162, 166, 164, 168, 165, 168, 157, 161, 172)

boxplot(M, K)

# normalnoœæ
shapiro.test(M)
shapiro.test(K)
#oba spe³niaj¹ normalnoœæ

#równoœc wariancji
var(M)
var(K)

var.test(M, K, alternative = "greater")

# p-value = 0.04689 < 0.05, odrzucamy H0, nie ma równoœci wariancji

#mamy normalnoœc, a nie ma równoœci wariancji, to mamy test Welcha
mean(M)
mean(K)

t.test(M, K, var.equal = FALSE, alternative = "greater")
# p-value bardzo ma³a, odrzucamy H0, na korzyœæ hipotezy alternatywnej mu_1 > mu_2,
# wzrost mê¿czyzn jest istotnie wiêkszy od kobiet




# Zadanie 5.6

#z tabliczk¹ czekolady

x <- c(242.2, 243.8, 252.8, 245.4, 245.6, 253.6, 247.3, 238.7,
       241.6, 242.8, 251.1, 246.8, 247.0, 245.6, 242.2, 253.9)

# nie ma normalnoœci

# H0 : mu = 250
 
median(x)

wilcox.test(x, mu = 250, alternative = "less")

# z danymi z morza

# H0 : mu = 870

m <- c(862, 870, 876, 866, 871, 865, 861, 873, 871, 872)

median(m)

wilcox.test(m, mu = 870, alternative = "greater")




#Zadanie 5.7

# przyk³ad z hipnoz¹, proby zale¿ne
# zak³adamy, ¿e nie ma normalnoœci, test nieparametryczny
przed <- c(6.6, 6.5, 9.0, 10.3, 11.3, 8.1, 6.3, 11.6)
po <- c(6.8, 2.5, 7.4, 8.5, 8.1, 6.1, 3.4, 2.0)

#do alternatywy liczymy medianê, ¿eby podkreœliæ, ¿e jest nieparametryczny test

median(przed)
median(po)

wilcox.test(przed, po, paired = TRUE, alternative = "greater")

#proszki A i B, test nieparametryczny, proby niezalezne
median(proszek_A)
median(proszek_B)

wilcox.test(proszek_A, proszek_B, paired = FALSE, alternative = "greater")

# z podejœciem do szkó³

median(a)
median(b)

wilcox.test(a, b, paired = TRUE, alternative = "less")


# wzrost mê¿czyzn i kobiet

median(M)
median(K)

wilcox.test(M, K, paired = FALSE, alternative = "greater")


#Zadanie 5.8

#rozk³ad dwumianowy 0-1, jedna próba jednego RNA
# H0 : p = 0.7
# H1 : p != < > 0.7

# proporcja
18/22

# test wskaŸnika struktury w jednej próbie
prop.test(x = 18, n = 22, p = 0.7, alternative = "greater")

#p-value = 0.1643 nie odrzucamy H0, procent puryn jest bliski zak³adanemu 0.7

# test dwumianowy

binom.test(x = 18, n = 22, p = 0.7, alternative = "greater")



# Zadanie 5.9 próby niezale¿ne

#H0 : p_1 = p_2
#H1 : p_1 != p_2
# wskaŸnik struktury 

prop.test(c(20, 45), c(120, 150))
# p mniejsze od 0.05, odrzucamy H0, procent firm korzystaj¹cych z reklamy jest ró¿ny w obu miastach



# Zadanie 5.10 próby zalezne

# 2 próby zale¿ne, bo na tych samych osobach, 0-1
# H0 : p-1 = p_2 procent pozytywnych jest taki sam po miesiacu
# H1 : p_1 != p_2

matrix(c(794, 86, 150, 570), 2, 2)

mcnemar.test(matrix(c(794, 86, 150, 570), 2, 2))

p_1 : 944/1600
p_2 : 880/1600

# Zadanie 5.11

# prawdopodobieñstwo teoretyczne
# 2:5:3

p0 <- c(2, 5, 3)/ sum(c(2, 5, 3))
chisq.test(c(38, 72, 40), p = p0)

#H0 : p = p0
# p = (prawd_b, prawd_n, prawd_c)

# nie odrzucamy H0, proporcje s¹ takie same, nie zmieniamy proporcji produkcji