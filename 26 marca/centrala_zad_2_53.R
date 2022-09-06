centrala = load("Centrala.RData")
#estymator
(lambda_set <- mean(Centrala$Liczba))
#porównanie rozkładów:
probs <- dpois(sort(unique(Centrala$Liczba)), lambda = lambda_set)
sum(probs)
counts <- matrix(c(prop.table(table(Centrala$Liczba)), probs), nrow = 2, byrow = TRUE)
rownames(counts) <- c("empiryczny", "teoretyczny")
colnames(counts) <- sort(unique(Centrala$Liczba))
counts
barplot(counts, 
        xlab = "Liczba zgłoszeń", ylab = "Prawdopodobieństwo",
        main = "Rozkłady empiryczny i teorytyczny liczby zgłoszeń",
        col = c("red", "blue"), legend = rownames(counts), beside = TRUE)