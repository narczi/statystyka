#Zad 7 / str 84: Rozwiąż Przykład dla testu t-Studenta dla prób zależnych i Zadania 2-4 powyżej stosując odpowiedni
#test nieparametryczny
#hipnoza

#przed i po hipnozą
przed <- c(6.6, 6.5, 9.0, 10.3, 11.3, 8.1, 6.3, 11.6)
po <- c(6.8, 2.5, 7.4, 8.5, 8.1, 6.1, 3.4, 2.0)
boxplot(a, b)
#zakładamy że nie ma normalności żeby wykonać testy nieparametryczne

#paired = TRUE dla prób zależnych
wilcox.test(przed, po, paired = TRUE, alternative = "greater")
#na podstawie mediany decydujemy o wartości alternative
#przy testach nieparametrycznych używamy mediany
#przy testach parametrycznych liczymy średnią (mean)
median(przed)
median(po)

#zadanie z proszkami, test dla prób niezależnych:
a <- c(78.2,78.5,75.6,78.5,78.5,77.4,76.6)
b <- c(76.1,75.2,75.8,77.3,77.3,77.0,74.4,76.2,73.5,77.4)
median(a)
median(b)
#na podstawie mediany decydujemy o wartości alternative
wilcox.test(a,b, alternative = "greater")

#zadanie ze szkołami publicznymi, test dla prób niezależnych:
przed <- c(84, 87, 87, 90, 90, 90, 90, 93, 93, 96)
po <- c(89, 92, 98, 95, 95, 92, 95, 92, 98, 101)
median(przed)
median(po)
#na podstawie mediany decydujemy o wartości alternative
wilcox.test(przed,po, paired = TRUE, alternative = "less")


#zadanie z wzrostem
m <- c(171, 176, 179, 189, 176, 182, 173, 179, 184, 186, 189, 167, 177)
k <- c(161, 162, 163, 162, 166, 164, 168, 165, 168, 157, 161, 172)
median(m)
median(k)
wilcox.test(m,k, alternative = "greater")