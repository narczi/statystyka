#Zadanie 3.1

#3.1.1  zmienna jako�ciowa
getwd()
setwd("J:/Statystyka")
(ankieta <- read.table("ankieta.txt", header = TRUE))

head(ankieta) #6 pierwszych wierszy
View(ankieta)

#3.1.2
#rozklad empiryczny za pomoc� szeregu rozdzielczego
wynik_1 <- c(ankieta[[3]])
wynik_1
data.frame(cbind(liczebnosc = table(wynik_1),
                 procent = prop.table(table(wynik_1))))


#3.1.3
#rozk�ad empiryczny zmiennej wynik tylko dla os�b z wykszta�ceniem podstawowym za pomoc�
#szeregu rozdzielczego
wynik_2 <- c(ankieta$szkola == "p")
wynik_2
data.frame(cbind(liczebnosc = table(wynik_1[wynik_2]),
                 procent = prop.table(table(wynik_1[wynik_2]))))

#3.1.4
#s�upkowy
barplot(table(wynik_1),
        xlab = "Odpowiedzi", ylab = "Liczeba",
        main = "Rozk�ad empiryczny udzielonych odpowiedzi", col = c("black", "pink", "green", "blue", 'lightblue'))

barplot(prop.table(table(wynik_1)),
        xlab = "Odpowiedzi", ylab = "Prawdopodobie�stwo",
        main = "Rozk�ad empiryczny udzielonych odpowiedzi", col = c("black", "pink", "green", "blue", 'lightblue'))
#ko�owy
pie(table(wynik_1))

#3.1.5 rozbicie wykresu na dwie grupy

barplot(table(ankieta$wynik, ankieta$plec), beside = TRUE, col = 1:5)

#Zadanie 3.2  zmienna ilo�ciowa dyskretna, model z rozk�ad�w dyskretnych

#Zadanie 3.3, zmienna ilo�ciowa ci�g�a

(awarie <- read.table("awarie.txt"))
head(awarie)

#3.3.2
praca <- c(awarie)
data.frame(cbind(liczebnosc = table(cut(praca$V1, breaks = seq(0, 3500, 500))),
                 procent = prop.table(table(cut(praca$V1, breaks = seq(0, 3500, 500))))))

#3.3.3
(breaks_hist <- hist(praca$V1, plot = FALSE)$breaks)

data.frame(cbind(liczebnosc = table(cut(praca$V1, breaks = breaks_hist)),
                 procent = prop.table(table(cut(praca$V1, breaks = breaks_hist)))))

# histogram

hist(praca$V1,
     xlab = "Liczba przepracowanych godzin",
     main = "Rozk�ad empiryczny liczby przepracowanych godzin")
rug(jitter(praca$V1))



# histogram z estymatorem j�drowym g�sto�ci

hist(praca$V1,
     xlab = "Liczba przepracowanych godzin",
     main = "Rozk�ad empiryczny liczby przepracowanych godzin",
     probability = TRUE,
     col = "lightblue")
lines(density(praca$V1), col = "green", lwd = 2)


# wykres pude�kowy (ramkowy)


boxplot(praca$V1,
        ylab = "Liczba przepracowanych godzin",
        main = "Rozk�ad empiryczny liczby przepracowanych godzin")


#3.3.4

#oblicz �redni�

mean(praca$V1)


#oblicz median�

median(praca$V1)


#oblicz odchylenie standardowe

sd(praca$V1)

#wsp�czynnik zmienno�ci

sd(praca$V1) / mean(praca$V1) * 100

#wsp�czynnik asymetrii

library(e1071)
skewness(praca$V1)

#kurtoza czasu bezawaryjnej pracy

kurtosis(praca$V1)




