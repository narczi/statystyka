#Zadanie 9
#Po porównaniu podobnych firm w dwóch różnych miastach 𝐴 i 𝐵 postawiono hipotezę, że odsetek
#firm korzystających z reklam w obu miastach jest znacząco różny. Aby sprawdzić tę hipotezę, wybrano 120
#firm w mieście 𝐴, z czego 20 wykorzystało reklamę, a spośród 150 firm w mieście 𝐵 45 firm skorzystało z
#reklamy. Ustal, czy różnica między odsetkami firm korzystających z reklam w miastach 𝐴 i 𝐵 jest statystycznie
#istotna.

#H0 : p_1 = p_2
#H1 : p_1 != p_2


#liczenie estymatora
city_A = 20 / 120
city_B = 45/ 150

prop.test(c(20,45), c(120,150))
#p-value jest mniejsze niż 0,05 więc H1 jest prawdą