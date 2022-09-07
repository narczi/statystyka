#Literówki Wikipedia

literowki <- c(0, 0, 1, 1, 0, 1, 2, 4, 1, 0, 2, 1, 0, 1, 2, 1, 2, 2, 1, 5)

cbind(table(literowki), prop.table(table(literowki)))