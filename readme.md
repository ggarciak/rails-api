# Bienvenido al maravilloso mundo del back.

## Preparaos

Vamos a tener que instalar varias cosas para empezar, esta instalación está pensada para windows pero las cosas que usamos tienen su contraparte en ubuntu y la instalación es hasta más fácil. Los titulos son links

### 1. [Git](https://git-scm.com/download/win)

Tengo entendido más o menos sabes de que va git con sus ramas y eso pero es importante lo manejes mejor (no ahora, a futuro). Voy a subir un documento con comandos de git y una guia de como se suele usar (git flow) para cuando quieras profundizar un poco más en esto

#### 1.1. (Opcional) Instalar un editor de texto

GIT te permite integrarse con un editor de texto, en algunos escenarios (por ahora lejanos para nosotros) git a veces precisa que le escribas algo.

> Info extra: Windows es piola y te recomienda lo hagas con un editor de texto de verdad y no la terminal, en ubuntu vamos a usar la terminal y el editor no tiene mucho misterio pero vayamos sumando de a poco.

Recomendado por todos: [visual studio code](https://code.visualstudio.com/download), yo no lo conozco mucho pero me lo baje para hacer este tutorial y vamos a ir conociendolo, tengo entendido que está bueno

#### 1.2. Instalar Git

En windows la descarga trae un exe con una guia de instalación y casi siempre dale a la opción que trae por defecto, salvo en [select additional tasks](https://i.imgur.com/Dsid9Rs.png) y en el [terminal emulator](https://i.imgur.com/luOx65o.png).

### 2. Ruby y Rails

#### 2.1 Instalar ruby

Ruby es el lenguaje de programación que vamos a usar, cuando digo instalar ruby en realidad estamos instalando el compilador de ruby, es decir un programita que agarra la porquería que nosotros escribamos en .rb y lo convierta en un programa

La versión de ruby de un proyecto se deja escrito en el archivo .ruby-version que está en la carpeta raiz del proyecto, te dejo un link para instalar esa versión ([2.6.7 para windows 64 bits (x64)](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.7-1/rubyinstaller-devkit-2.6.7-1-x64.exe)). Ese link salió de [acá](https://rubyinstaller.org/downloads/) que encontré esa página en google buscando `install ruby windows`, todo este texto extra es para que te vayas haciendo amigo con googlear TODO.

La instalación no tiene mucho misterio dale todo lo por defecto. Levanta una consola que tira unos poderes cuando apretas enter ni idea que hizo.

#### 2.2 Instalar Rails

Rails es el framework que vamos a usar para trabajar sobre ruby, es lo todo el tema de mvc y eso. Profundizo teoricamente más adelante en la sección de rails, ahora vamos a limitarnos a instalarlo.

Para instalar rails lo vamos a hacer mismo sobre ruby, por eso no tiene link, pero primero hay que levantar una terminal 😱.

---

### Empezando a amigarse con la terminal:

En windows, podes levantar una terminar haciendo `Ctrl + R`, que abre el ejecutador de programas de Windows, y ahi escribimos `cmd`. Más adelante cuando bajemos el proyecto voy a instruirte un poco en comandos utiles, y como movernos en la terminal pero por ahora vamos limitarnos a la instalación

--- 

``` gem install rails ```

Y listo, podes comprobar que quedó instalado imprimiendo la versión `rails -v`

### 3. Base de datos - [Instalar PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

Como no vamos a hacer un back de jugete vamos a precisar tener una base de datos!. Para eso vamos a instalar postgreSQL. Yo baje la `13.3` por ser la última, probemos con esa y si se rompe actualizo esto.

El instalador no tiene mucho miterio, dale todo el por defecto y en un momento te pide una contraseña, yo use `12345678`, no es importante que sea polenta porque es para tu base local. Es importante que no importa que contraseña utilices, modifiques el `config/database.yml` con esa contraseña para que rails pueda usar tu postgres.

En otro momento te abre un segundo wizard  `stack_builder`, cerralo nomas.

Para no llenarte la cabeza desde ahora, y queriendo empezar a separar un poco la información, dejo un breve repaso de base de datos en un archivo `database.md` en la carpeta `documentation`.

## Listos

Una vez tenemos todo instalado, ya estamos en condiciones de bajar y correr el proyecto.

Vamos a empezar por levantar una terminal (instrucciónes más arriba)

---

### Un par de comandos utiles para la terminal

Llego momento de hacernos amigos de la terminal, dejo un par de comandos útiles:

| windows | ubuntu | descripcion | 
| ------- | ------ | ----------- |
| dir     | ls     | Lista los archivos que existen en la carpeta actual |
| cd      | cd     | Se usa para moverte a una carpeta (change directory) que este dentro de la carpeta actual. Ej: `cd imagenes`. Para salir de la carpeta actual podemos hacer `cd ..`|
| mkdir    | mkdir | Crea una carpeta. ej: `mkdir nueva_carpeta` |
| start . | xdg-open . | Abre la carpeta actual en el explorador de carpetas que conocemos |

---

Una vez que levantas la terminal, vas a estar en la carpeta raiz de tu usuario, supongo vas a ver:

``` C:\Users\Bruno> ```

Nuestro proposito es crear una carpeta `Development` en el escritorio de la compu y adentro crear una carpeta para este proyecto. Te dejo como ejercicio que intentes hacerlo con los comandos que puse arriba

** SPOILER ejercicio crear Development ***

```
C:\Users\Bruno> dir
C:\Users\Bruno> cd Desktop
C:\Users\Bruno\Desktop> mkdir Development
C:\Users\Bruno\Desktop> cd Development
C:\Users\Bruno\Desktop\Development>
```

Voila!. En esta carpeta development vamos a trabajar, nos resta crear una carpeta para este proyecto, podes ponerle el nombre que quieras

```
C:\Users\Bruno\Desktop> mkdir AnimeApp
C:\Users\Bruno\Desktop> cd AnimeApp
C:\Users\Bruno\Desktop\AnimeApp>
```

### 1. Bajar el proyecto

Una vez que tengamos la carpeta del proyecto creada (en este ejemplo 'AnimeApp') empecemos por bajar el repo del backend. Para esto voy a usar el comando por HTTPs (más informacion de HTTPS contra SSH después)

```
  C:\Users\Bruno\Desktop\Development\AnimeApp> git clone https://github.com/ggarciak/rails-api.git
```

> Nota1: Para poder hacer paste en la terminal, tenés que entrar a properties, y marcar la cajita de `Use Ctrl+Shif+C/V as Copy/Paste`

> Nota2: Para más info de los comandos de git hay un archivo `git.md` en la carpeta `documentation`.

Si ejecutamos un dir vamos a ver que apareció una carpeta nueva (`rails-api`), movamos nos adentro de esa carpeta.

### 2. Instalar el proyecto

Rails tiene "gemas" (paquetes) en sus aplicaciones, para levantar un proyecto es importante instalar las gemas del proyecto antes de levantarlo

> Info extra: La información de que gemas tiene la app y en que versión están se encuentra en el `Gemfile` en la carpeta raíz del proyecto

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> bundle install
```

### 3. Crear la base de datos

Para poder guardar nuestros datos, la app tiene que crear la base de datos en postgres, la configuración la saca de `config/database.yml`

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> rails db:create
```

La base que creamos está absolutamente en blanco, es importante correr las migraciones para crear las tablas de `Anime` y `Character`.

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> rails db:migrate
```

Y por último yo genere un par de animes y personajes para que la base no empiece vacia, lo podes encontrar en `db/seeds.rb`. Para correr el seed ejecutamos

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> rails db:seed
```

En general, cuando trabajen varias personas en un proyecto, los demas van a hacer sus modificaciones a la base (migraciones) y rails te va a putear cuando intentes levantar un proyecto sin correrlas, vamos a ir a esto después

## Ya!

Ahora podemos levantar el server!

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> rails s
```

Si abris un browser y vas a `localhost:3000` te va a tirar la página de bienvenido a rails 🥳

Que esperas que te tire `localhost:3000/characters/1`? (ayuda: ver el archivo de seeds)

Y `localhost:3000/animes`? 

* Que otras rutas se te ocurren? que nos devuelven datos?

* Que rutas crees nos pueden devolver un error?

  Ojo que en windows cuando una ruta devuelve error EXPLOTA el servidor y tenes que matarlo, voy a ver de emprolijar eso.

---

## Otro tip para la terminal:
  Para matar el server vas a la terminal donde está corriendo y apretas CTRL+C (esto es para matar procesos en general desde la terminal, para  continuar tu vinculo de amistad con ella).

---

  Para volver el server levantarlo solo precisas de `rails s`. Todo lo relacionado a la base persiste (no hay que correr migraciones, ni seeds ni crear nada cada vez).


## Proximos pasos:

  * Hay una carpeta que no es parte de la estructura de RoR, `documentation`.
  
  Ahí dejé guias de distintas tematicas, te recomendaría empieces por la de rails pero la idea es un poco que sean independientes?, no sé todavía, proba y contame
  