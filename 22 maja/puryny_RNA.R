#Zadanie 8 W przypadku pewnego mikro RNA badacz chce przetestować hipotezę, że prawdopodobieństwo
#wystąpienia puryn wynosi 0,7. W przeprowadzonym eksperymencie mikro RNA o długości 22 zawierało 18
#puryn. Zweryfikuj hipotezę badacza.
#18 na 22 miało puryny

#jedna próba bo jest jedna sekwencja
#H0 : p = 0.7
#H0 : p != < > 0.7

#liczenie estymatora p (z proporcji):
18 / 22



#x = liczba sukcesów która pojawiła się w próbie
#n = wszystkie próby
#greater, bo estymator > 0.7
#test dla wskaźnika struktury w jednej próbie (albo test dla jednego wskaźnika struktury)
#taki test jest używany gdy coś jest albo czegoś nie ma (binarne dane)
prop.test(x = 18, n = 22, p = 0.7, alternative = "greater")
#p-value > 0,05 więc nie odrzucamy

#test dwumianowy dla jednej próby z rozkładu zero-jedynkowego
binom.test(x = 18, n = 22, p = 0.7, alternative = "greater")