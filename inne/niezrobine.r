#Zadanie 3.2

#200 losowo wybranych okresów pracy centrali, liczba zgoszeñ
#dyskretna zmienna ilosciowa

load("Centrala.RData")
head(Centrala)
data.frame(cbind(liczebnosc = table(Centrala$Liczba)), 
                 procent = prop.table(table(Centrala$Liczba)))

pie(table(Centrala))

barplot(table(Centrala), xlab = "Liczba zgloszen", ylab = "Liczebnosc", 
        main ="rozklad empiryczny liczby bledów", col = 1:6)

barplot(prop.table(table(Centrala)), xlab = "Liczba zgloszen", ylab = "Pradopod", 
        main ="rozklad empiryczny liczby bledów", col = 1:6)

?data.frame
?cbind
View(Centrala)

dane <- c(Centrala[[1]])

data.frame(cbind(liczebnosc = table(dane)), 
           procent = prop.table(table(dane)))

pie(table(dane))


mean(dane)
median(dane)

#¿le:
mean(Cenrala$Liczba)
mean(table(Centrala$Liczba))

data.frame(procent = prop.table(table(dane)))


sd(dane)

sd(dane)/mean(dane)*100      


#wczytanie pliku Dane1.txt

dane1 <- read.table("Dane1.txt", header =TRUE)
head(dane1)
data.frame(rbind(liczebnosc = table(dane1)))

barplot(table(dane1$Pytanie1))
data.frame(cbind(liczebnosc = table(dane1$Pytanie1)))
table(dane1)
pie(table(dane1))
ZZZ <- data.frame(n=c(1,2,NA),m=c(6,NA,NA),o=c(7,8,8))

zzz <- data.frame(cbind(liczebnosc = table(dane1)))
zzz2<- data.frame(A =c(0,0,0), B=c(0,1,0))
zzz2
as.data.frame(table(dane1))
c(table(dane1))
summary(dane1)

sum((dane1$Pytanie1 == '1' & dane1$Pytanie2 == '1' & dane1$Pytanie3 == '0') 
    | (dane1$Pytanie1 == '1' & dane1$Pytanie3 == '1'& dane1$Pytanie2 == '0') 
    | (dane1$Pytanie3 == '1' & dane1$Pytanie2 == '1' & dane1$Pytanie1 == '0'))

sum((dane1$Pytanie1 == '1' & dane1$Pytanie2 == '0' & dane1$Pytanie3 == '0') 
    | (dane1$Pytanie1 == '0' & dane1$Pytanie2 == '1'& dane1$Pytanie3 == '0') 
    | (dane1$Pytanie1 == '0' & dane1$Pytanie2 == '0' & dane1$Pytanie3 == '1'))



#Zadanie 4.1
#dlugosæ drogi hamowania

hamulce <- read.table("hamulce.txt", dec = ",")
sd(hamulce$V1)
var(hamulce$V1)
var(hamulce)
mean(hamulce$V1)
sqrt(var(hamulce$V1))
S <- sd(hamulce$V1)
ENMW <- (sqrt(49/2))*((gamma(49/2))/(gamma(50/2)))*S

ENM
