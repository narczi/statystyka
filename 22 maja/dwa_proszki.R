#Zad 2 / str 80

a <- c(78.2,78.5,75.6,78.5,78.5,77.4,76.6)
b <- c(76.1,75.2,75.8,77.3,77.3,77.0,74.4,76.2,73.5,77.4)

boxplot(a,b)

#H0 : mu_1 = mu_2
#H1 : mu_1 != > < mu_2

#test t-Studenta dla dwóch prób niezależny

#1. Sprawdzenie założeń:

#a) sprawdzenie normalności za pomocą shapiro-wilka - jest OK

shapiro.test(a)
qqnorm(a) #wykres kwantyl-kwantyl
qqline(a) #wykres kwantyl-kwantyl
shapiro.test(b)

#b) sprawdzenie równości wariancji 
#F-Snedecora

#var = variance (wariancja)
var(a)
var(b) 
var(a) < var(b)
var.test(a,b, alternative ="less") #tutaj szukamy p-wartości

#3. Test główny 
mean(a)
mean(b)
t.test(a, b, var.equal = TRUE, alternative = "greater") #znowu szukamy p-value

#Wnioski:
#odrzucamy H0
#H1 : mu_1 > mu_2