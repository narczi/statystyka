hamulce <- read.table("http://ls.home.amu.edu.pl/data_sets/hamulce.txt", dec = ",")

# estymatory
(mu_est <- mean(hamulce$V1))
(sigma_est <- sd(hamulce$V1))

# przedzialy ufnosci
library(EnvStats)
enorm(hamulce$V1, 
      method = "mvue",
      ci = TRUE, ci.type = "two-sided", conf.level = 0.95, ci.param = "mean")

enorm(hamulce$V1, 
      method = "mvue",
      ci = TRUE, ci.type = "two-sided", conf.level = 0.95, ci.param = "variance")

# przedial ufnosci dla samego sigma (sd) to trzeba z LCL i UCL policzyc pierwiastek

# jednostronne przedzialy ufnosci
enorm(hamulce$V1, 
      method = "mvue",
      ci = TRUE, ci.type = "lower", conf.level = 0.95, ci.param = "mean")
#$limits
#LCL          UCL (lower confidence limit, upper confidence limit)
#18.29636     Inf 

enorm(hamulce$V1, 
      method = "mvue",
      ci = TRUE, ci.type = "upper", conf.level = 0.95, ci.param = "mean")
#$limits
#LCL      UCL 
#-Inf     18.46724 