#Zadanie 2.
#Zmienn¹ jest tutaj czas snu leczonych pacjentów. Jest to zmienna iloœciowa ci¹g³a.

#Wektoryzacja danych

czas <- c(43, 53, 39, 45, 52, 48, 32, 43, 34)

#Przedstawienie rozk³adu empirycznego czasu snu za pomoc¹ szeregu rozdzielczego:

data.frame(cbind(liczebnosc = table(cut(czas, breaks = seq(30, 55, 5))),
                 procent = prop.table(table(cut(czas, breaks = seq(30, 55, 5))))))

#Zilustrowanie czasu snu za pomoc¹ histogramu:

hist(czas,
     xlab = "Liczba minut snu",
     main = "Rozk³ad empiryczny liczby minut snu")
rug(jitter(czas))

# Histogram z estymatorem j¹drowym gêstoœci

hist(czas,
     xlab = "Liczba minut snu",
     main = "Rozk³ad empiryczny liczby minut snu",
     probability = TRUE,
     col = "lightblue")
lines(density(czas), col = "green", lwd = 2)

#Zilustrowanie czasu snu za pomoc¹ wykresu pude³kowego:


boxplot(czas,
        ylab = "Liczba minut czasu snu",
        main = "Rozk³ad empiryczny liczby minut czasu snu")

#Obliczenie œredniej 
mean(czas)

#Obliczenie mediany
median(czas)

#Obliczenie odchylenia standardowego
sd(czas)

#Obliczenie wspó³czynnika zmiennoœci
sd(czas) / mean(czas) * 100

#obliczenie wspó³czynnika symetrii
library(e1071)
skewness(czas)
#wynik jest ujemny, co oznacza, ¿e dane odznaczaja siê lewostronn¹ asymetri¹

# olbiczenie kurtozy
kurtosis(czas)



#Zadanie 3.

#Aby udzieliæ odpowiedzi na pytanie, czy wyk³ad wp³yn¹³ na rodzaj udzielanych odpowiedzi, 
#przeprowadzimy test McNemary dla prób zale¿nych, poniewa¿ s¹ to pary wyników dla tych samych osób.

#Wczytanie danych:

matrix(c(20, 0, 47, 33), 2, 2)

#Test McNemary
mcnemar.test(matrix(c(20, 0, 47, 33), 2, 2))

#hipoteza H0: wyk³ad nie wp³yn¹³ na rodzaj udzielanych odpowiedzi
#hipoteza H1: wyk³ad wp³yn¹³ znacz¹co na rodzaj udzielanych odpowiedzi

#Wartoœæ p w przeprowadzonym teœcie wynosi: 1.949e-11, czyli jest bardzo ma³a, dlatego odrzucamy
#hipotezê H0 na rzecz hipotezy alternatywnej H1, czyli przeprowadzony wyk³ad znacz¹co wp³yn¹³ 
#na rodzaj udzielanych opdowiedzi.

#obliczamy proporcje
p_1 = 67/100
p_2 = 20/100

#Po obliczeniu proporcji widzimy, ¿e liczba twierdz¹cych odpowiedzi znacznie siê zmniejszy³a 
#po przeprowadzonym wyk³adzie.


#Zadanie 4.
#Wpisujemy dane
dane_w <-c(8.8, 9.1, 6.7, 5.6, 8.8, 1.5, 8.9, 6.2, 6.1, 2.2, 3.8, 7.6, 4.7, 5.0, 1.5, 4.6, 1.2, 2.3, 5.2, 3.6)
DF <- data.frame(V1=dane_w,
                 V2=c('A','A','A','A','A', 'B', 'B', 'B', 'B', 'C','C', 'C', 'C', 'C', 'D','D','D','D','D','D'))

DF

#obliczamy œredni¹ dla danych szamponów

aggregate(DF$V1, list(szampony = DF$V2), FUN = mean)

#wykres pude³kowy
boxplot(V1 ~ V2, data = DF)

#test analizy wariancji w celu sprawdzenia, czy wystêpuja istotne ró¿nice w œredniej badanej cechy
#dla poszczególnych szamponów

summary(aov(V1 ~ V2, data = DF))
 #wartoœæ p jest mniejsza od poziomu istotnoœci p= 0.0121, dlatego odrzucamy H0: ¿e nie wystêpuj¹
#istotne ró¿nice w œredniej badanej cechy


#Za³o¿enia modelu jednoczynnikowej analizy wariancji

#test ba normalnoœæ Shapiro-Wilk

shapiro.test(lm(V1 ~ V2, data = DF)$residuals)

#Wartoœc p wynosi p= 0.9424, bark podstaw by odrzuciæ hipotezê H0: normalnoœc wystêpuje.

#Wykres
qqnorm(lm(V1 ~ V2, data = DF)$residuals)
qqline(lm(V1 ~ V2, data =DF)$residuals)
 #test Bartletta
bartlett.test(V1 ~ V2, data = DF)

