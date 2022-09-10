odczyt_1 <- read.table("odczyt_1.txt")
oodczyt_1
odczyt_1
odczyt_1 <- read.table("odczyt_1.txt", header= TRUE)
odczyt_1
View(odczyt_1)
odczyt_2 <- read.table("odczyt_2.txt", header = TRUE, sep = ";", dec = ",")
odczyt_2


zyto <- c(1630, 1660, 1680, 1680, 1740, 1640, 1595, 1490, 1700, 1720)
library(EnvStats)
head(zyto)
enorm(zyto, method="mvue", ci = TRUE, ci.type="two-sided", conf.level=0.95, ci.param="mean")
enorm(zyto, method="mvue", ci = TRUE, ci.type="two-sided", conf.level=0.95, ci.param="variance")

temp <- c(15.3, 15.7, 13.3, 18.5, 16.6, 14.9, 15.1, 14.3, 15.0, 13.8, 13.7, 13.9, 17.6)
mean(temp)
var(temp)
enorm(temp, method="mvue", ci = TRUE, ci.type="two-sided", conf.level=0.95, ci.param="mean")
enorm(temp, method="mvue", ci = TRUE, ci.type="two-sided", conf.level=0.95, ci.param="variance")

var(zyto)

enorm(temp, method="mvue", ci = TRUE, ci.type="two-sided", conf.level=0.90, ci.param="variance")
