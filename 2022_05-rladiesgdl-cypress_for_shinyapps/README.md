# Taller "Cypress para shinyapps" con Rladies Guadalajara, Mayo 2022.

# Nota importante antes de empezar
Es altamente recomendable que pruebes aplicaciones en un entorno 'local' u _offline_ para que no satures los servicios de alguien más, y que tampoco te vayan a bloquear. Lo ideal es que si vas a probar aplicaciones que ya están en línea, tengas la autorización de las personas correspondientes y que puedan trabajar en conjunto para no tener interrupciones inesperadas en el servicio.

# Introducción
Ventajas de cypress:
- Puedes probar shinyapps y cualquier otra aplicación web, independientemente de con qué fue escrita, pues todas terminan siendo archivos html, y con cypress buscamos elementos en el código html y verificamos si nuestros supuestos son ciertos.
- Podemos correr tests de manera interactiva
- Nos obligamos a tener un código más limpio y adoptar convenciones en la shiny app para que las pruebas sean menos complicadas.
- La escritura de las pruebas es declarativa: "Entra a A, haz click en X, escribe en Z", etc., lo cual las hace más fáciles de entender.
- Podemos administrar las versiones de cypress de manera independiente de la versión de R con la que estemos trabajando.


Desventajas:
- Nuestro código de esas pruebas no está escrito en R. Usamos javascript, promesas (asincronía). Esto puede ser una barrera para algunas personas.
- A veces es complicado encontrar el elemento html 'correcto' para probar una determinada acción. Esto se agrava con librerías como shiny que producen elementos muy anidados, pues a veces puede ser difícil distinguir cuál elemento es el que nos lleva a nuestro objetivo.
- Si nuestra app es complicada, y por ende el html también lo es, el testing se puede volver muy pesado. Sin embargo, hay herramientas para hacer pruebas visuales, ya sea que usemos comparaciones estrictas de screenshots o que trabajemos con tecnología de visión por computadora (hay open source y hay servicios de paga como Eyes de Applitools y Percy)


Ahora sí, van las instrucciones de instalación:
**Para correr cypress tenemos varias opciones**: 
- desde el ejecutable rápido (es la manera más sencilla, pero viene con características limitadas),
- desde una terminal con node o 
- desde un contenedor de docker (o con docker compose).

Podemos usar _cualquiera de esas opciones_ en el taller.

-----
**Tabla de contenido**
- [Taller "Cypress para shinyapps" con Rladies Guadalajara, Mayo 2022.](#taller-cypress-para-shinyapps-con-rladies-guadalajara-mayo-2022)
- [Nota importante antes de empezar](#nota-importante-antes-de-empezar)
- [Introducción](#introducción)
- [Cypress desde el ejecutable rápido (sólo windows y mac OS)](#cypress-desde-el-ejecutable-rápido-sólo-windows-y-mac-os)
- [Cypress desde node](#cypress-desde-node)
  - [Instalar node desde el ejecutable (todas las plataformas)](#instalar-node-desde-el-ejecutable-todas-las-plataformas)
  - [Instalar node en ubuntu desde línea de comandos](#instalar-node-en-ubuntu-desde-línea-de-comandos)
    - [Opción 1. Instalar la última versión disponible en los repositorios de ubuntu.](#opción-1-instalar-la-última-versión-disponible-en-los-repositorios-de-ubuntu)
    - [Opción 2. Instalar una versión específica de node en ubuntu (por ejemplo, la versión LTS)](#opción-2-instalar-una-versión-específica-de-node-en-ubuntu-por-ejemplo-la-versión-lts)
    - [Opción 3. Instalar node con nvm (node version manager) - También funciona en mac OS](#opción-3-instalar-node-con-nvm-node-version-manager---también-funciona-en-mac-os)
  - [Instalar cypress con node](#instalar-cypress-con-node)
- [Cypress desde docker](#cypress-desde-docker)
  - [Instrucciones para instalar Docker por Sistema Operativo](#instrucciones-para-instalar-docker-por-sistema-operativo)
    - [Ubuntu](#ubuntu)
    - [mac OS](#mac-os)
    - [Windows](#windows)
  - [Descargar una imagen de docker de cypress](#descargar-una-imagen-de-docker-de-cypress)
    - [Usar una imagen de docker con cypress y navegadores pre-instalados](#usar-una-imagen-de-docker-con-cypress-y-navegadores-pre-instalados)
  - [Instalar docker compose](#instalar-docker-compose)
    - [Ubuntu](#ubuntu-1)
    - [Otros sistemas operativos](#otros-sistemas-operativos)
  - [Usar docker compose para correr en paralelo cypress y la shiny app desde docker (headless)](#usar-docker-compose-para-correr-en-paralelo-cypress-y-la-shiny-app-desde-docker-headless)
  - [Usar docker compose para correr en paralelo cypress y la shiny app desde docker (modo interactivo)](#usar-docker-compose-para-correr-en-paralelo-cypress-y-la-shiny-app-desde-docker-modo-interactivo)
- [Notas generales sobre cypress](#notas-generales-sobre-cypress)
- [Recursos para aprender más (en inglés)](#recursos-para-aprender-más-en-inglés)
  - [Cómo encontrar elementos HTML](#cómo-encontrar-elementos-html)
    - [Browser developer tools](#browser-developer-tools)
    - [Otros, via TAU](#otros-via-tau)
    - [JQuery](#jquery)
  - [Notas sobre javascript](#notas-sobre-javascript)
    - [Tutorial de javascript](#tutorial-de-javascript)
    - [Funciones anónimas y funciones flecha](#funciones-anónimas-y-funciones-flecha)
    - [Introducción a objetos](#introducción-a-objetos)
    - [Introducción a async](#introducción-a-async)
    - [Callbacks](#callbacks)
  - [Mejores prácticas](#mejores-prácticas)
    - [Encadenar comandos](#encadenar-comandos)
  - [Otros detalles técnicos](#otros-detalles-técnicos)
    - [Chai framework](#chai-framework)
    - [Mocha framework](#mocha-framework)


# Cypress desde el ejecutable rápido (sólo windows y mac OS)
1. Descargar el ejecutable desde la página oficial de cypress. En cada descarga vamos a obtener siempre la versión más reciente. https://download.cypress.io/desktop 
2. Abrirlo con doble click


# Cypress desde node
Vamos a usar npm (node package manager) para instalar cypress y npx para ejecutarlo.

Tenemos **varias alternativas** para hacer la instalación. Podemos usar el ejecutable que podemos descargar de la página de node, o (para *nix) desde línea de comandos, ya sea directamente con un gestor de paquetes o con un gestor de versiones de node. En esta página podemos encontrar links a más documentación sobre la instalación https://nodejs.dev/learn/how-to-install-nodejs 

Nota: También se puede usar la imagen de docker para usar nodejs, pero si vamos a usar docker y cypress, nos conviene más la imagen de cypress en lugar de la imagen de node. 

## Instalar node desde el ejecutable (todas las plataformas)
1. Descargar el ejecutable para nuestro sistema operativo. Es recomendable elegir la versión de soporte largo o LTS (long-term support) https://nodejs.org/es/download/
2. Descomprimir la carpeta.
3. Abrir el ejecutable.

## Instalar node en ubuntu desde línea de comandos

### Opción 1. Instalar la última versión disponible en los repositorios de ubuntu.
1. Ejecutar los siguientes comandos en una terminal

    ```
    sudo apt update
    sudo apt install nodejs
    ```
2. Verificar la instalación con
    ```
    nodejs -v
    npm -v
    ```

### Opción 2. Instalar una versión específica de node en ubuntu (por ejemplo, la versión LTS)
1. Pre-requisitos: curl. Lo podemos instalar con
    ```
    sudo apt-get install curl
    ```

2. Instalar node. En este caso elegimos la versión 16.x, que es la versión LTS.

   ```
   curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
   sudo apt-get install -y nodejs
   ```

3. Verificar la instalación con
    ```
    nodejs -v
    npm -v
    ```

Puedes encontrar más documentación en https://github.com/nodesource/distributions/blob/master/README.md

### Opción 3. Instalar node con nvm (node version manager) - También funciona en mac OS

1. Pre-requisitos: curl. Lo podemos instalar con
    ```
    sudo apt-get install curl
    ```
2. Correr el script de instalación de nvm 
   
   ```
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
   ```

3. Reiniciar la terminal (cerrar y volver a abrir)
4. Instalar la versión de node que queremos
   - Para la última versión de node
    ```
    nvm install node
    ```
   - Para la versión LTS 
    ```
    nvm install --lts
    ```
5. Verificar la instalación
    ```
    node -v
    npm -v
    ```

Puedes encontrar más documentación de nvm en https://nodejs.dev/learn/how-to-install-nodejs


## Instalar cypress con node
Nota: es recomendable crear una carpeta de trabajo para cada proyecto en el que usemos paquetes de node. De esta manera podemos aislar las dependencias de cada proyecto. 
Al correr `npm install <paquete>` se va a crear (o actualizar si ya existe) un archivo de dependencias

0. Asegurarse de tener las siguientes dependencias e instalar las que falten
   ```sudo apt-get install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb```
1. Crear una carpeta de trabajo para el proyecto y navegar hacia ella
    ```
    mkdir taller_node
    cd taller_node
    ```
2. Dentro de la carpeta, llamar a `npm` para instalar cypress y guardar cypress en las dependencias de desarrollo. En este caso fijamos la versión a la 9.6, que es la más reciente al momento de creación de este taller.
   ```
   npm install cypress@9.6.1 --save-dev
   ```
3. ¡Listo! Ya podemos usar `npx` para ejecutar cypress:
   ```
   npx cypress run
   ```



# Cypress desde docker
Como pre-requisito, necesitas tener docker instalado, y, de preferencia, una terminal linux.

## Instrucciones para instalar Docker por Sistema Operativo

### Ubuntu
1. Instalar docker en Ubuntu. No necesitas nada más porque el sistema operativo ya incluye una terminal
https://docs.docker.com/engine/install/ubuntu/
1. (opcional) Puedes seguir las instrucciones post-instalación para no tener que usar `sudo` para cada comando de docker
https://docs.docker.com/engine/install/linux-postinstall/

Si no corres el paso 2, tendrás que poner **sudo** antes de todos los comandos de docker. Por practicidad yo voy a omitir el `sudo` en los comandos. Entonces, el comando `docker pull hello-world` sería equivalente a `sudo docker pull hello-world`


### mac OS
1. Instalar docker Desktop en mac. No necesitas nada más  porque el sistema operativo ya incluye una terminal
https://docs.docker.com/desktop/mac/install/

### Windows
1. Primero necesitas habilitar o instalar WSL2 para usar una terminal de linux y para que la configuración de docker aplique automáticamente a WSL2
- Habilitar WSL2 en windows 10 o windows 11: 
https://docs.microsoft.com/en-us/windows/wsl/install

- Instalar WSL2 en versiones anteriores de windows
https://docs.microsoft.com/en-us/windows/wsl/install-manual

2. Instalar docker Desktop en Windows. 
https://docs.docker.com/desktop/windows/install/



## Descargar una imagen de docker de cypress
Vamos a usar la terminal por conveniencia, pero también se puede hacer desde la interfaz gráfica de Docker desktop.

Podemos descargar distintas versiones de cypress, con o sin navegadores pre-instalados.

En **cypress/base** tenemos acceso únicamente a cypress, mientras que con **cypress/included** tenemos a cypress y a algunos navegadores (y sus dependencias del sistema).

**Nota** Para correr cypress con un usuario distinto al usuario _root_ puedes consultar los ejemplos disponibles en:
- https://github.com/cypress-io/cypress-docker-images/tree/master/examples/included-as-non-root
- https://github.com/cypress-io/cypress-docker-images/tree/master/examples/included-as-non-root
- https://github.com/cypress-io/cypress-docker-images/tree/master/examples/included-as-non-root-mapped

Sin embargo, en este taller no vamos a cubrir esa parte.


### Usar una imagen de docker con cypress y navegadores pre-instalados
Este ejemplo usa una app que está en la web (usa uno de los demos de cypress), así que no tendremos problema en encontrar la shiny app. 

1. Jalar la imagen
   ```
   docker pull cypress/included:9.6.1
   ```
2. Correr el contenedor y montar el volumen con los tests
   ```
   docker run --rm -it -v $PWD/taller-quickdefaultdemo/:/taller/ -w /taller cypress/included:9.6.1
   ```
   --rm: Borrar el contenedor en cuanto salgamos de ahí.

   -it: Para correr de manera interactiva.
   
   -v: Montar volumen origen_mi_maquina:destino_contenedor
   
   -w: Directorio de trabajo en el contenedor

Nota: si corremos la shiny app en local y cypress desde un contenedor de docker, habrá que usar docker compose.

## Instalar docker compose

### Ubuntu
```
sudo apt-get update
sudo apt-get install docker-compose-plugin
```

### Otros sistemas operativos
https://docs.docker.com/compose/install/


## Usar docker compose para correr en paralelo cypress y la shiny app desde docker (headless)
```
docker compose up --exit-code-from cypress
```

## Usar docker compose para correr en paralelo cypress y la shiny app desde docker (modo interactivo)
Si queremos correr cypress en modo interactivo, usamos dos archivos para el docker compose

```
xhost +local:
docker compose -f docker-compose.yml -f cypress-open.yml up --exit-code-from cypress
```

# Notas generales sobre cypress

- Hay dos modos de correr cypress: 
  1. *interactivo*: Se abre una ventana del navegador (y también una ventana del _runner_ de cypress). Vemos paso a paso lo que sucede, tanto si fallan como si son exitosos los tests. 
  2. *"headless"*: Sólo vemos el output en la consola/terminal. Una gran ventaja es que podemos tener un _exit code_ distinto a cero si alguno de los tests fallaron, lo cual es una bandera muy útil en ciertos casos de uso. Dependiendo de nuestra configuración podemos tener registro o no de los tests exitosos, o conservar los videos y screenshots únicamente de los tests fallidos.
    
- Podemos elegir con qué navegador o navegadores vamos a hacer las pruebas. Cabe señalar que necesitas tener los navegadores previamente instalados, ya sea en tu computadora o en un contenedor de docker, depende de cómo decidas correr cypress.
  ```
  cypress run --browser chrome
  cypress run --browser firefox
  cypress run --browser edge
  ```

- Además, podemos probar con distintos tamaños de dispositivos, como si realmente los tuviéramos. Esto se vuelve especialmente relevante para aplicaciones móviles.
  https://www.cypress.io/blog/2020/07/08/end-to-end-testing-mobile-apps-with-ionic-and-cypress/


# Recursos para aprender más (en inglés)
## Cómo encontrar elementos HTML
  ### Browser developer tools 
  https://javascript.info/debugging-chrome  

  ### Otros, via TAU 
  https://testautomationu.applitools.com/web-element-locator-strategies/ 

  ### JQuery 
  https://www.youtube.com/watch?v=8uOgDtTDebA 


## Notas sobre javascript
### Tutorial de javascript
  https://testautomationu.applitools.com/javascript-tutorial/  

### Funciones anónimas y funciones flecha 
https://javascript.info/arrow-functions-basics  

### Introducción a objetos
https://javascript.info/object-basics  

### Introducción a async
- https://javascript.info/async  
- https://eloquentjavascript.net/11_async.html  

### Callbacks 
http://jsforcats.com/#callbacks  

 
## Mejores prácticas
### Encadenar comandos
   - https://www.toolsqa.com/cypress/cypress-get-command/
   - https://filiphric.com/writing-better-command-chains-in-cypress
   - https://docs.cypress.io/api/commands/then#Change-subject

   - Succesful test strategies https://www.youtube.com/watch?v=Qeqk2M6j4-I  

   - Common testing pitfalls and how to avoid them https://www.youtube.com/watch?v=uvJwWQLaVqU  

   - Testing is a good investment https://www.youtube.com/watch?v=_mHy9U0jAG0  

   - Don’t forget accessibility testing https://applitools.com/event/ux-testing-in-agile-teams/  


## Otros detalles técnicos
  ### Chai framework 
  https://testautomationu.applitools.com/chai-test-assertions/  

  ### Mocha framework 
  https://testautomationu.applitools.com/mocha-javascript-tests/ 

