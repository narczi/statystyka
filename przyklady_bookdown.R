#3.3 Przyklady 3 
#Przyklad 1 ilosciowa dyskretna

liczba_bledow <- c(1, 1, 2, 0, 1, 3, 1, 4, 4, 4, 0, 1, 0, 0, 0, 2, 3,
                   4, 0, 1, 5, 2, 3, 5, 3, 2, 2, 4, 0, 2, 2, 0, 2, 2,
                   3, 3, 1, 3, 2, 2, 0, 0, 5, 4, 2, 1, 5, 2, 2, 0)

#szereg rozdzielczy
cbind(liczebnosc = table(liczba_bledow), 
      procent = prop.table(table(liczba_bledow)))

#wykres slupkowy
barplot(table(liczba_bledow), xlab = "Liczba bledow", ylab = "Liczebnosc", 
        main = "Rozklad empiryczny liczby bledow")

barplot(prop.table(table(liczba_bledow)), xlab = "Liczba bledow", ylab = "Prawdopodobienstwo", 
        main = "Rozklad empiryczny liczby bledow")

#wykres kolowy
pie(table(liczba_bledow))

#srednia
mean(liczba_bledow)

#mediana
median(liczba_bledow)

#odchylenie standardowe (standard deviation)
sd(liczba_bledow)

#wspolczynnik zmiennosci
sd(liczba_bledow) / mean(liczba_bledow) * 100


#Przyklad 2 ilosciowa ciagla
hamulce <- read.table("http://ls.home.amu.edu.pl/data_sets/hamulce.txt", dec = ",")

(breaks_hist <- hist(hamulce$V1, plot = FALSE)$breaks)

data.frame(cbind(liczebnosc = table(cut(hamulce$V1, breaks = breaks_hist)),
                 procent = prop.table(table(cut(hamulce$V1, breaks = breaks_hist)))))

#histogram
hist(hamulce$V1,
     xlab="Dlugosc drogi hamowania",
     main="Rozklad empiryczny dlugosci drogi hamowania")
rug(jitter(hamulce$V1))