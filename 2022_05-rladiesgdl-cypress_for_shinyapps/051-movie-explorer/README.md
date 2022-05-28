# Notas
El código original proviene de los demos de shiny de RStudio https://github.com/rstudio/shiny-examples/tree/main/051-movie-explorer

Para mayor información sobre la app, puedes consultar el README_original


# Cómo correr la app de shiny movie-explorer
Para correr esta shinyapp, puedes instalar los paquetes en tu ambiente local, ya sea con conda, packrat, etc; o puedes construir la imagen de Docker y correr la aplicación desde un contenedor.

## Modo local
### Instalar las dependencias de R
```
install.packages(c('shiny', 'ggvis', 'dplyr', 'dbplyr', 'RSQLite'))
```

### Lanzar la app
a. Haz click en Correr/Run en RStudio o

b. En una consola de R corre
```
options(shiny.port = 8080, shiny.host='0.0.0.0')

shiny::runApp()
```

## Con docker
### Construir la imagen de docker
a. Si ya estás dentro del directorio `051-movie-explorer`

```
docker build . -t movieexplorer
```

b. Si estás en otra carpeta y prefieres no moverte, necesitarías proporcionar el path hacia el Dockerfile
```
docker build --file otro_path/051-movie-explorer/ -t movieexplorer
```

### Correr contenedor
```
docker run --rm -it -p 8080:8080 movieexplorer
```

## Visita la app desde el navegador
Abre tu navegador web preferido y ve a `http://localhost:8080/`
