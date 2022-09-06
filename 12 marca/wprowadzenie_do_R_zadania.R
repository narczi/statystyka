#Zadanie 2 Użyj funkcji rep(), aby utworzyć wektor logiczny, zaczynając od trzech wartości prawda, następnie czterech wartości fałsz, po których następują dwie wartości prawda i wreszcie pięć wartości fałsz. Przypisz ten wektor logiczny do zmiennej x. Na koniec przekonwertuj ten wektor na wektor numeryczny. Jak zmieniły się wartości prawda i fałsz?

x <- rep(c(TRUE,FALSE,TRUE,FALSE), c(3,4,2,5))
y <- as.numeric(x) # przekształć na liczby
napisy = as.character(x) # przekształć w stringi

a <- rep(c(TRUE, FALSE, TRUE), 3)
b <- rep(c(TRUE, FALSE, TRUE), each = 3)


#Zadanie 3 Utwórz taki wektor 100 liczb przy czym pierwsze 20 liczb to kolejne liczby naturalne, następnie występuje 10 zer, następnie 20 kolejnych liczb parzystych, a pozostałe elementy określone są przez palindromiczność (warunek symetrii).

first_half <- c(c(1:20), rep(0,10), seq(2, 40, by = 2))
palindrom <- c(first_half, rev(first_half))

#Zadanie 4 Z wektora letters wybierz litery na pozycjach 5, 10, 15, 20, 25.

letters[c(5,10,15,20,25)]
letters[seq(5,25, by = 5)]

#Zadanie 5. Utwórz wektor liczb naturalnych od 1 do 1000, a następnie zamień liczby parzyste na ich odwrotności.

x <- 1:1000
x[x %% 2 == 0] <- 1 / x[x %% 2 == 0]
x
#Zadanie 6. Uporządkuj elementy wektora (6,3,4,5,2,3) od największego do najmniejszego wykorzystując funkcję order().
nieposortowany = c(6,3,4,5,2,3)
order(nieposortowany, decreasing = TRUE)

#Zadanie 9
install.packages("schoolmath", dependencies = TRUE)
library(schoolmath)
data(primlist)


