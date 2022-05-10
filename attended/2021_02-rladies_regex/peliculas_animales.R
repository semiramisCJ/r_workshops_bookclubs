peliculas <- read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2020/2020-02-19/ranking_imdb.csv")
pinguinos <- datos::pinguinos 
animales <- read_csv("https://raw.githubusercontent.com/rivaquiroga/latinr-taller-regex/master/datos/animales.csv") 

pinguinos_longer <- pinguinos %>% 
  pivot_longer(cols = largo_pico_mm:masa_corporal_g,
               names_to = c("variable", "unidad"),
               names_pattern = "(\\w+_\\w+)_(\\w+)",
               values_to = "valor")
