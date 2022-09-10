ankieta <- read.table("http://ls.home.amu.edu.pl/data_sets/ankieta.txt", header = TRUE)

# jest to zmienna ilosciowa dyskretna

# rozklad empiryczny za pomoca szeregu rozdzielczego
data.frame(cbind(liczebnosc = table(ankieta$wynik),
      procent = prop.table(table(ankieta$wynik))))


# rozklad empiryczny za pomoca szeregu rozdzielczego tylko dla osob z wyksztalceniem p
ankieta_p <- subset(ankieta, szkola == "p")
ankieta_p <- ankieta[ankieta$szkola == "p", ]

data.frame(cbind(liczebnosc = table(ankieta_p$wynik),
                 procent = prop.table(table(ankieta_p$wynik))))

# wykres slupkowy
barplot(table(ankieta$wynik), 
        xlab = "Odpowiedzi", 
        ylab = "Liczebnosc", 
        main = "Rozklad empiryczny zmiennej wynik")

barplot(prop.table(table(ankieta$wynik)), 
        xlab = "Odpowiedzi", 
        ylab = "Prawdopodobienstwo", 
        main = "Rozklad empiryczny zmiennej wynik")

# wykres kolowy
pie(table(ankieta$wynik))

# wykres slupkowy dla kobiet i mezczyzn
ankieta_k <- subset(ankieta, plec == "k")
ankieta_m <- subset(ankieta, plec == "m")
m_k <- data.frame(c(ankieta_k$wynik), c(ankieta_m$wynik))
barplot(table(ankieta_k$wynik), 
        xlab = "Kobiety", 
        ylab = "Liczebnosc", 
        main = "Rozklad empiryczny zmiennej wynik",
        col = 1:5)

barplot(table(ankieta_m$wynik), 
        xlab = "Mezczyzni", 
        ylab = "Liczebnosc", 
        main = "Rozklad empiryczny zmiennej wynik")

barplot(table(ankieta$wynik, ankieta$plec),
        beside = TRUE,
        col = 1:5)

table(ankieta$wynik, ankieta$plec)

# Zadanie 2 Centrala telefoniczna

load("http://ls.home.amu.edu.pl/data_sets/Centrala.RData")
centrala <- load("Centrala.RData")

# szereg rozdzielczy
cbind(ilosc_polaczen = table(Centrala),
      procent = prop.table(table(Centrala)))

# wykres slupkowy
barplot(table(Centrala$Liczba),
        xlab = "Liczba zgloszen", ylab = "Liczebnosc",
        main = "Rozklad empiryczny liczby zgloszen",
        col = 1:5)

barplot(prop.table(table(Centrala$Liczba)),
        xlab = "Liczba zgloszen", ylab = "Prawdopodobienstwo",
        main = "Rozklad empiryczny liczby zgloszen",
        col = 1:5)

# wykres kolowy
pie(table(Centrala$Liczba))

# srednia
mean(Centrala$Liczba)
# mediana
median(Centrala$Liczba)
#odchylenie standardowe
sd(Centrala$Liczba)
#wspolczynnik zmiennosci
sd(Centrala$Liczba) / mean(Centrala$Liczba) * 100

# Zadanie 3 Awarie

# wyglada to na zmienna ilosciowa ciagla

awarie <- read.table("http://ls.home.amu.edu.pl/data_sets/awarie.txt")

# szereg rozdzielczy
(awarie_hist <- hist(awarie$V1, plot = FALSE)$breaks)

data.frame(cbind(liczebnosc = table(cut(awarie$V1, breaks = awarie_hist)),
                 procent = prop.table(table(cut(awarie$V1, breaks = awarie_hist)))))

#histogram

hist(awarie$V1,
     xlab = "Czas bezawaryjnej pracy",
     main = "Rozklad empiryczny czasu bezawaryjnej pracy") 
rug(jitter(awarie$V1))

boxplot(awarie$V1, ylab = "Czas bezawaryjnej pracy")

mean(awarie$V1)
median(awarie$V1)
sd(awarie$V1) / mean(awarie$V1) * 100
skewness(awarie$V1)
kurtosis(awarie$V1)

#Zadanie 4 Wspolczynnik zmiennosci

wspolczynnik_zmiennosci <- function(x, na.rm = FALSE){
  sd(x) / mean(x) * 100 
}

szescian_4 <- function(x){
  if(!is.numeric(x)){
    stop("non-numeric argument x")
  }
  x^3
}