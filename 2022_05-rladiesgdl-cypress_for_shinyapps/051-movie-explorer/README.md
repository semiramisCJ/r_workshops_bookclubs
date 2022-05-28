# Notes
The original code comes from RStudio shiny demos https://github.com/rstudio/shiny-examples/tree/main/051-movie-explorer

You can know more about the app in README_original.md


# How to run the movie-explorer shiny app
To run this shinyapp, you can install the packages in your local environment, either via conda, with packrat, etc, or you can build the Docker image and run the app inside a docker container.

## Local mode
### Install R dependencies
```
install.packages(c('shiny', 'ggvis', 'dplyr', 'dbplyr', 'RSQLite'))
```

### Launch app
a. Click Run in RStudio or

b. Inside an R console, run
```
options(shiny.port = 8080, shiny.host='0.0.0.0')

shiny::runApp()
```

## With docker
### Build docker image
a. If you are inside the `051-movie-explorer` directory

```
docker build . -t movieexplorer
```

b. If you are in another directory and prefer not to change directories, you would need to provide the path to the Dockerfile
```
docker build --file otro_path/051-movie-explorer/ -t movieexplorer
```

### Run container
```
docker run --rm -it -p 8080:8080 movieexplorer
```

## Visit your app in the browser
Open your favorite web browser and go to `http://localhost:8080/`