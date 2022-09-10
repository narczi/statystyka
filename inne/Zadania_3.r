#Zadanie 3.1

#3.1.1  zmienna jakoœciowa
getwd()
setwd("J:/Statystyka")
(ankieta <- read.table("ankieta.txt", header = TRUE))

head(ankieta) #6 pierwszych wierszy
View(ankieta)

#3.1.2
#rozklad empiryczny za pomoc¹ szeregu rozdzielczego
wynik_1 <- c(ankieta[[3]])
wynik_1
data.frame(cbind(liczebnosc = table(wynik_1),
                 procent = prop.table(table(wynik_1))))


#3.1.3
#rozk³ad empiryczny zmiennej wynik tylko dla osób z wykszta³ceniem podstawowym za pomoc¹
#szeregu rozdzielczego
wynik_2 <- c(ankieta$szkola == "p")
wynik_2
data.frame(cbind(liczebnosc = table(wynik_1[wynik_2]),
                 procent = prop.table(table(wynik_1[wynik_2]))))

#3.1.4
#s³upkowy
barplot(table(wynik_1),
        xlab = "Odpowiedzi", ylab = "Liczeba",
        main = "Rozk³ad empiryczny udzielonych odpowiedzi", col = c("black", "pink", "green", "blue", 'lightblue'))

barplot(prop.table(table(wynik_1)),
        xlab = "Odpowiedzi", ylab = "Prawdopodobieñstwo",
        main = "Rozk³ad empiryczny udzielonych odpowiedzi", col = c("black", "pink", "green", "blue", 'lightblue'))
#ko³owy
pie(table(wynik_1))

#3.1.5 rozbicie wykresu na dwie grupy

barplot(table(ankieta$wynik, ankieta$plec), beside = TRUE, col = 1:5)

#Zadanie 3.2  zmienna iloœciowa dyskretna, model z rozk³adów dyskretnych

#Zadanie 3.3, zmienna iloœciowa ci¹g³a

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
     main = "Rozk³ad empiryczny liczby przepracowanych godzin")
rug(jitter(praca$V1))



# histogram z estymatorem j¹drowym gêstoœci

hist(praca$V1,
     xlab = "Liczba przepracowanych godzin",
     main = "Rozk³ad empiryczny liczby przepracowanych godzin",
     probability = TRUE,
     col = "lightblue")
lines(density(praca$V1), col = "green", lwd = 2)


# wykres pude³kowy (ramkowy)


boxplot(praca$V1,
        ylab = "Liczba przepracowanych godzin",
        main = "Rozk³ad empiryczny liczby przepracowanych godzin")


#3.3.4

#oblicz œredni¹

mean(praca$V1)


#oblicz medianê

median(praca$V1)


#oblicz odchylenie standardowe

sd(praca$V1)

#wspó³czynnik zmiennoœci

sd(praca$V1) / mean(praca$V1) * 100

#wspó³czynnik asymetrii

library(e1071)
skewness(praca$V1)

#kurtoza czasu bezawaryjnej pracy

kurtosis(praca$V1)




