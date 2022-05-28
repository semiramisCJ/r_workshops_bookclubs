# Shinyapp from https://github.com/rstudio/shiny-examples/tree/main/051-movie-explorer
FROM rocker/rstudio:3.6.3

RUN R -e "install.packages(c('shiny', 'ggvis', 'dplyr', 'dbplyr', 'RSQLite'))"

COPY . /051-movie-explorer/
WORKDIR /051-movie-explorer/

EXPOSE 8080

CMD ["R", "-e", "options(shiny.port = 8080, shiny.host='0.0.0.0'); shiny::runApp()"]
