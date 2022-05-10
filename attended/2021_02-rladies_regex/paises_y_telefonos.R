library(tidyverse)
library(datos)

# * Países --------------------------------------------
# Encontramos patrones simples con stringr::str_detect()
paises %>% 
  filter(str_detect(pais, "Corea"))

# Encontramos el patrón aunque esté en minúsculas
# pasándole el parámetro ignore_case=TRUE
paises %>% 
  filter(str_detect(pais, 
          regex("corea", ignore_case = TRUE)))

# Podemos usar expresiones regulares dentro de str_detect()
paises %>% 
  filter(str_detect(pais, "Per[u|ú]"))


# * Teléfonos --------------------------------------------
telefonos <- read_csv("datos/telefonos.csv")

# Vemos que nuestro dataset está muy sucio
telefonos %>% 
  count(ciudad)

# Podemos reemplazar patrón por patrón con stringr::str_replace()
telefonos %>% 
  mutate(ciudad = 
           str_replace(ciudad,
                       pattern="[v|V]alpara[i|í]so",
                       replacement = "Valparaíso")
         )

# Otra forma de hacerlo es con dplyr::case_when()
# (y nos ahorramos un montón de if-else)
telefonos <- telefonos %>% 
  mutate(ciudad = case_when(
    str_detect(ciudad, regex("valpara[i|í]so",
                             ignore_case = TRUE)) ~ "Valparaíso",
  
    str_detect(ciudad, regex("quilpu[e|é]",
                             ignore_case = TRUE)) ~ "Quilpué",
    
    str_detect(ciudad, regex("^Serena",
                             ignore_case = TRUE)) ~ "La Serena",
    TRUE ~ as.character(ciudad)
    ))

# Ya podemos contar bien cuántas personas tenemos de cada ciudad :)
telefonos %>% 
  count(ciudad)

# Ahora vamos a arreglar los nombres

# Digamos que queremos Apellido, Nombre
# Hay algunos casos que están bien
telefonos %>% filter(str_detect(nombre, ','))

# Pero para los casos sin coma nos conviene usar grupos
telefonos %>% filter(!str_detect(nombre, ','))

# Con stringr::str_match() y \\numerito podemos arreglarlo
nombre <- "Juan González"
str_match(nombre, "(\\w+) (\\w+)")

telefonos <- telefonos %>% 
  mutate(nombre = str_replace(nombre, 
                              pattern = "(\\w+) (\\w+)",
                              replacement = "\\2, \\1"))

# ¡Y ya quedó!
telefonos
