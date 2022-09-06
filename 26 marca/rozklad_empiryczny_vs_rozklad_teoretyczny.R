awarie <- read.table("awarie.txt")

estymator = (1/mean(awarie$V1))

print(estymator)