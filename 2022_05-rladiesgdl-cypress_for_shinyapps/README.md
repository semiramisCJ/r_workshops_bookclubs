Instrucciones de instalación de software para el taller "Cypress para shinyapps" con Rladies Guadalajara, Mayo 2022.

**Para correr cypress tenemos varias opciones**: 
- desde el ejecutable rápido (es la manera más sencilla, pero viene con características limitadas),
- desde una terminal con node o 
- desde un contenedor de docker.

Podemos usar _cualquiera de las 3 opciones_ en el taller.

-----
**Tabla de contenido**
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
    - [Jalar la imagen de la versión que queremos](#jalar-la-imagen-de-la-versión-que-queremos)


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


### Jalar la imagen de la versión que queremos

 