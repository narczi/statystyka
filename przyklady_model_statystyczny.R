# Rozklady:

## Dyskretne:
# 1. dwumianowy
# 2. Poissona

# 3. jednostajny
# 4. normalny
# 5. wykladniczy
# 6. Rayleigha

# Przyklad 1 Egzamin

# 1. Okreslic czy cecha jest typu dyskretnego ilosciowego / ciaglego, etc.
# - w tym przypadku jest to zmienna ilosciowa dyskretna
# 2. Jaka jest mozliwa liczba bledow (teoretycznie)? W przypadku egzaminu = 18
# 3. Punkt drugi pasuje idealnie pod rozklad dwumianowy z m = 18

liczba_bledow <- c(1, 1, 2, 0, 1, 3, 1, 4, 4, 4, 0, 1, 0, 0, 0, 2, 3,
                   4, 0, 1, 5, 2, 3, 5, 3, 2, 2, 4, 0, 2, 2, 0, 2, 2,
                   3, 3, 1, 3, 2, 2, 0, 0, 5, 4, 2, 1, 5, 2, 2, 0)

# wykres slupkowy

barplot(prop.table(table(liczba_bledow)),
        xlab = "Liczba bledow",
        ylab = "Prawdopodobienstwo",
        main = "Rozklad empiryczny liczby bledow")

# Przyklad 2 Hamulce

# 1. Okreslic czy cecha jest typu dyskretnego ilosciowego / ciaglego, etc.
# - jest to zmienna ilosciowa ciagla
# 2. Jakie sa mozliwe teoretyczne wartosci naszej cechy tj. drogi hamowania? [0, inf)
# 3. Na tej podstawie wiemy ze nalezy wybrac jakis rozklad ciagly
# 4. Rozklad jednostajny nie, bo nieskonczony pzedzial sie nie nadaje
# 5. W rozkladach wykladniczym i Rayleigha moga pojawic sie wartosci dodatnie
# wiec bierzemy je pod uwage
# 6. ostatecznie wybieramy rozklad normalny mimo tego ze pozwala on na wartosci 
# dowolne rzeczywiste 

# Szacowanie parametrow mi i sigma na podstawie danych (estymacja)

hamulce <- read.table("http://ls.home.amu.edu.pl/data_sets/hamulce.txt", dec = ",")

hist(hamulce$V1, 
     xlab = "Dlugosc drogi hamowania",
     main = "Rozklad empiryczny dlugosci drogi hamowania",
     probability = TRUE,
     col = "lightgreen")
lines(density(hamulce$V1), col="red", lwd = 2)