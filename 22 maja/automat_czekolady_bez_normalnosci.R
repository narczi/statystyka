x <- c(242.2, 243.8, 252.8, 245.4, 245.6, 253.6, 247.3, 238.7,
       241.6, 242.8, 251.1, 246.8, 247.0, 245.6, 242.2, 253.9)

#założmy że normalności nie ma (jest, ale zakładmy że jej nie ma)
#używamy test nieparametrycznego wilcoxona
#H0: mu = 250 

median(x) #wychodzi mniej niz 250 wieć alternatywa to less
wilcox.test(x, mu = 250, alternative = "less")

#komunikatem ostrzegawczym się nie przejmować

#p-value jest mniejsze od 0,05 więc odrzucamy H0 czyli automat produkuje za małe tabliczki czekolady