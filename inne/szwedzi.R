#Zadanie 2.
#Zmienn? jest tutaj czas snu leczonych pacjent?w. Jest to zmienna ilo?ciowa ci?g?a.

#Wektoryzacja danych

czas <- c(43, 53, 39, 45, 52, 48, 32, 43, 34)

#Przedstawienie rozk?adu empirycznego czasu snu za pomoc? szeregu rozdzielczego:

data.frame(cbind(liczebnosc = table(cut(czas, breaks = seq(30, 55, 5))),
                 procent = prop.table(table(cut(czas, breaks = seq(30, 55, 5))))))

#Zilustrowanie czasu snu za pomoc? histogramu:

hist(czas,
     xlab = "Liczba minut snu",
     main = "Rozk?ad empiryczny liczby minut snu")
rug(jitter(czas))

# Histogram z estymatorem j?drowym g?sto?ci

hist(czas,
     xlab = "Liczba minut snu",
     main = "Rozk?ad empiryczny liczby minut snu",
     probability = TRUE,
     col = "lightblue")
lines(density(czas), col = "green", lwd = 2)

#Zilustrowanie czasu snu za pomoc? wykresu pude?kowego:


boxplot(czas,
        ylab = "Liczba minut czasu snu",
        main = "Rozk?ad empiryczny liczby minut czasu snu")

#Obliczenie ?redniej 
mean(czas)

#Obliczenie mediany
median(czas)

#Obliczenie odchylenia standardowego
sd(czas)

#Obliczenie wsp??czynnika zmienno?ci
sd(czas) / mean(czas) * 100

#obliczenie wsp??czynnika symetrii
library(e1071)
skewness(czas)
#wynik jest ujemny, co oznacza, ?e dane odznaczaja si? lewostronn? asymetri?

# olbiczenie kurtozy
kurtosis(czas)



#Zadanie 3.

#Aby udzieli? odpowiedzi na pytanie, czy wyk?ad wp?yn?? na rodzaj udzielanych odpowiedzi, 
#przeprowadzimy test McNemary dla pr?b zale?nych, poniewa? s? to pary wynik?w dla tych samych os?b.

#Wczytanie danych:

matrix(c(20, 0, 47, 33), 2, 2)

#Test McNemary
mcnemar.test(matrix(c(20, 0, 47, 33), 2, 2))

#hipoteza H0: wyk?ad nie wp?yn?? na rodzaj udzielanych odpowiedzi
#hipoteza H1: wyk?ad wp?yn?? znacz?co na rodzaj udzielanych odpowiedzi

#Warto?? p w przeprowadzonym te?cie wynosi: 1.949e-11, czyli jest bardzo ma?a, dlatego odrzucamy
#hipotez? H0 na rzecz hipotezy alternatywnej H1, czyli przeprowadzony wyk?ad znacz?co wp?yn?? 
#na rodzaj udzielanych opdowiedzi.

#obliczamy proporcje
p_1 = 67/100
p_2 = 20/100

#Po obliczeniu proporcji widzimy, ?e liczba twierdz?cych odpowiedzi znacznie si? zmniejszy?a 
#po przeprowadzonym wyk?adzie.


#Zadanie 4.
#Wpisujemy dane
dane_w <-c(8.8, 9.1, 6.7, 5.6, 8.8, 1.5, 8.9, 6.2, 6.1, 2.2, 3.8, 7.6, 4.7, 5.0, 1.5, 4.6, 1.2, 2.3, 5.2, 3.6)
DF <- data.frame(V1=dane_w,
                 V2=c('A','A','A','A','A', 'B', 'B', 'B', 'B', 'C','C', 'C', 'C', 'C', 'D','D','D','D','D','D'))

DF

#obliczamy ?redni? dla danych szampon?w

aggregate(DF$V1, list(szampony = DF$V2), FUN = mean)

#wykres pude?kowy
boxplot(V1 ~ V2, data = DF)

#test analizy wariancji w celu sprawdzenia, czy wyst?puja istotne r??nice w ?redniej badanej cechy
#dla poszczeg?lnych szampon?w

summary(aov(V1 ~ V2, data = DF))
 #warto?? p jest mniejsza od poziomu istotno?ci p= 0.0121, dlatego odrzucamy H0: ?e nie wyst?puj?
#istotne r??nice w ?redniej badanej cechy


#Za?o?enia modelu jednoczynnikowej analizy wariancji

#test ba normalno?? Shapiro-Wilk

shapiro.test(lm(V1 ~ V2, data = DF)$residuals)

#Warto?c p wynosi p= 0.9424, bark podstaw by odrzuci? hipotez? H0: normalno?c wyst?puje.

#Wykres
qqnorm(lm(V1 ~ V2, data = DF)$residuals)
qqline(lm(V1 ~ V2, data =DF)$residuals)
 #test Bartletta
bartlett.test(V1 ~ V2, data = DF)

