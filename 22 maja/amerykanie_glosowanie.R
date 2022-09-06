#Zadanie 10
#w tym zadaniu nie ma cechy ciągłej tylko zero-jedynkowa

#H0 : p_1 = p_2
#H1 : p_1 != p_2

944 / 1600
880 / 1600

#test mcnemara dla danych zależnych

matrix(c(794,86,150,570),2,2)
mcnemar.test(matrix(c(794,86,150,570),2,2))

#p-value jest < 0,05 więc H0 odrzucamy