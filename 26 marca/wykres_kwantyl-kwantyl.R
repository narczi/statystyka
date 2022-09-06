qqplot(rpois(length(Centrala$Liczba), lambda = lambda_est), Centrala$Liczba,
       xlab = "Kwantyle teoretyczne", ylab = "Kwantyle empiryczne",
       main = "Wykres kwantyl-kwantyl dla liczby zgłoszeń")
qqline(Centrala$Liczba,
       distribution = function(probs) {qpois(probs, lambda = lambda_est)})
library(EnvStats)
qqPlot(Centrala$Liczba,
       distribution = "pois",
       param.list = list(lambda = lambda_est),
       add.line = TRUE,
       xlab = "Kwantyle teoretyczne", ylab = "Kwantyle empiryczne",
       main = "Wykres kwantyl-kwantyl dla liczby zgłoszeń")
#Przedziały ufności
library(EnvStats)
epois(Centrala$Liczba,
      method = "mle/mme/mvue",
      ci = TRUE, ci.type = "two-sided", conf.level = 0.95,
      ci.method = "exact")$interval$limits