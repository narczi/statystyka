#Zadanie 9
#Po por贸wnaniu podobnych firm w dw贸ch r贸偶nych miastach 饾惔 i 饾惖 postawiono hipotez臋, 偶e odsetek
#firm korzystaj膮cych z reklam w obu miastach jest znacz膮co r贸偶ny. Aby sprawdzi膰 t臋 hipotez臋, wybrano 120
#firm w mie艣cie 饾惔, z czego 20 wykorzysta艂o reklam臋, a spo艣r贸d 150 firm w mie艣cie 饾惖 45 firm skorzysta艂o z
#reklamy. Ustal, czy r贸偶nica mi臋dzy odsetkami firm korzystaj膮cych z reklam w miastach 饾惔 i 饾惖 jest statystycznie
#istotna.

#H0 : p_1 = p_2
#H1 : p_1 != p_2


#liczenie estymatora
city_A = 20 / 120
city_B = 45/ 150

prop.test(c(20,45), c(120,150))
#p-value jest mniejsze ni偶 0,05 wi臋c H1 jest prawd膮