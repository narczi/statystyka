#Zadanie 2
czas_snu = c(43,53,39,45,52,48,32,43,34)

#zmienna ilosciowa ciagla

data.frame(cbind(liczebnosc = table(czas_snu)), 
           procent = prop.table(table(czas_snu)))
