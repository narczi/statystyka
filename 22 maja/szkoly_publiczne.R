#Zad 3 / str 81
#na wykładzie był przykład z hipnozą
#mamy dwie próby: przed i po:
przed <- c(84, 87, 87, 90, 90, 90, 90, 93, 93, 96)
po <- c(89, 92, 98, 95, 95, 92, 95, 92, 98, 101)
#próby są zależne wobec siebie bo dotyczą tych samych osób, np. dla osoby pierwszej przed było 84, a dla drugiej 89

boxplot(przed,po)
#1. Założenia
shapiro.test(przed)
shapiro.test(po)

#jeśli p-value testu shapiro-wilka jest większe niż 0,05 to nie ma podstaw do odrzucenia H0
#jeśli p-value testu shapiro-wilka jest mniejsza niż 0,05 to odrzucamy H0 i wybieramy inne testy

#nie trzeba wariancji
#var(a)
#var(b)
#var(a) > var(b)

#2. Główny test:
mean(przed)
mean(po)
t.test(przed, po, alternative = "less", paired = TRUE)
#jeśli p-value testu t-studenta jest większe niż 0,05 to nie ma podstaw do odrzucenia H0
#jeśli p-value testu t-studenta jest mniejsza niż 0,05 to odrzucamy H0