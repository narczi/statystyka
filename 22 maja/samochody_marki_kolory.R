#Zadanie 11. Samochody określonej marki są produkowane w kolorze białym, niebieskim i czerwonym, a
#wielkość produkcji w poszczególnych kolorach jest ustalana w stosunku 2 ∶ 5 ∶ 3. Sprawdź, czy proporcje odpowiadają
#preferencjom klientów, jeśli spośród 150 wylosowanych potencjalnych nabywców: 38 osób wybrało
#biały, 72 osoby wybrało niebieski, 40 wybrało czerwony.

#2:5:3
#białe 38
#niebieskie 72
#czerwone 40

#H0 - nie ma istotnych różnic proporcji
#H0 : p = p_0

#Prawdopodbieństwa: podzielić przez sumę wartości 2,5,3

2/10
5/10
3/10

p0 <- c(2,5,3) / sum(c(2,5,3))

chisq.test(c(38,72,40), p = p0)