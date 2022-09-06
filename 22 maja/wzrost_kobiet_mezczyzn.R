#Zad 4 / str 82 

#Czy dane są zależne? Nie, bo dotyczą innych osób.

m <- c(171, 176, 179, 189, 176, 182, 173, 179, 184, 186, 189, 167, 177)
k <- c(161, 162, 163, 162, 166, 164, 168, 165, 168, 157, 161, 172)

boxplot(m,k)

#Sprawdzamy normalność

shapiro.test(m)
shapiro.test(k)

#Jest normalność dla m i k, bo p-value jest większe niż 0,05

var(m)
var(k)


var.test(m,k, alternative = "greater")
#p-value jest mniejsze niż 0,05 więc nie ma równości wariancji
#dlatego nie mogę skorzystać z testu t-studenta

#Jeśli jest normalność ale nie ma równości wariancji to robimy test Welcha
mean(m)
mean(k)
t.test(m,k, var.equal = FALSE, alternative = "greater")
#6.929e-07 = 6.929 * 10^(-7)
format(6.929e-07, scientific = FALSE)