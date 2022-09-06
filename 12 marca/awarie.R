awarie <- read.table("awarie.txt")
head(awarie)

awarie_emp <- data.frame(
  cbind(liczebnosc = table(awarie), procent = prop.table(table(awarie))))

awarie_emp

ramka <- data.frame(
  plec = c("K", "K", "M", "M", "K"),
  wyksztalcenie = c("s", "w", "w", "p", "s"),
  waga = c(60, 55, 80, 75, 62)
)