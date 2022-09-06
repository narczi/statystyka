ankieta = read.table("ankieta.txt", header = TRUE)
head(ankieta)
data.frame(cbind(liczebnosc = table(ankieta$wynik),
                 procent = prop.table(table(ankieta$wynik))))

ankieta_p <- ankieta[ankieta$szkola == "p", ] #Przed przecinkiem odwołuję się do wierszy. Po przecinku nie wpisuje nic bo kolumny zostawiam w spokoju.

rozklad_empiryczny = data.frame(cbind(liczebnosc = table(ankieta_p$wynik),
                 procent = prop.table(table(ankieta_p$wynik))))

barplot(table(ankieta$wynik),
        xlab = "Odpowiedzi", ylab = "Liczebność",
        main = "Rozkład empiryczny zmiennej wynik",
        col = 1:5)
barplot(prop.table(table(ankieta$wynik)),
        xlab = "Odpowiedzi", ylab = "Prawdopodobieństwo",
        main = "Rozkład empiryczny zmiennej wynik",
        col = 1:5)
pie(table(ankieta$wynik))
barplot(table(ankieta$wynik, ankieta$plec),
        beside = TRUE,
        col = 1:5)