liczba_bledow <- c(1, 1, 2, 0, 1, 3, 1, 4, 4, 4, 0, 1, 0, 0, 0, 2, 3,
                   4, 0, 1, 5, 2, 3, 5, 3, 2, 2, 4, 0, 2, 2, 0, 2, 2,
                   3, 3, 1, 3, 2, 2, 0, 0, 5, 4, 2, 1, 5, 2, 2, 0)
data.frame(cbind(liczebnosc = table(liczba_bledow), 
                 procent = prop.table(table(liczba_bledow))))

barplot(table(liczba_bledow), xlab = "Liczba bledow", ylab = "Liczebnosc", 
        main ="rozklad empiryczny liczby bledów")


barplot(prop.table(table(liczba_bledow)), xlab = "Liczba bledow", ylab = "Prawdopodob", 
        main ="rozklad empiryczny liczby bledów")

pie(table(liczba_bledow))

mean(liczba_bledow)
median(liczba_bledow)
sd(liczba_bledow)

sd(liczba_bledow)/mean(liczba_bledow)* 100

hamulce<- read.table("hamulce.txt")
head(hamulce)
hamulce<- read.table("hamulce.txt", dec = ",")

data.frame(cbind(liczebnosc = table(cut(hamulce$V1, breaks = seq(17.6, 19, 0.2))), 
                 procent = prop.table(table(cut(hamulce$V1, breaks = seq(17.6, 19, 0.2))))))

breaks_hist <- hist(hamulce$V1, plot = FALSE)$breaks
breaks_hist

data.frame(cbind(lizcebnosc = table(cut(hamulce$V1, breaks = breaks_hist)),
                 procent = prop.table(table(cut(hamulce$V1, breaks = breaks_hist)))))

hist(hamulce$V1, xlab = "Dlugosc drogi hamowania",
     main = "Rozklad empiryczny drogi hamowania")
rug(jitter(hamulce$V1))