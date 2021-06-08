# Preparaos

Vamos a tener que instalar varias cosas para empezar. Esta instalación está pensada para windows, pero las cosas que usamos tienen su contraparte en Ubuntu y la instalación es hasta más fácil. Los titulos son links

## 1. [Git](https://git-scm.com/download/win)

Cuando se trabaja con código, es muy común y útil manejar varias versiones del mismo. Una versión del código puede ser la que están usando los usuarios en sus celulares (llamada versión en producción) y otra para uso interno y testeo antes de efectivamente largarla. Para organizar el trabajo de versionar código sin tener que tener varios cientos de archivos existe Git. En este tutorial hay un documento con comandos de git y una guía de cómo se suele usar (git flow) para cuando quieras profundizar un poco más en esto.

Existe una interfaz gráfica (programa tradicional con ventanas) que facilita el uso de Git, aunque se suele usar por la consola de comandos.


### 1.1. (Opcional) Instalar un editor de texto

Podríamos escribir el código en cualquier herramienta que permita ingresar texto (como Microsoft Word o LibreOffice), pero hay herramientas diseñadas específicamente para esta función que nos facilitan muchas cosas.

Recomendado por todos: [visual studio code](https://code.visualstudio.com/download), yo no lo conozco mucho pero me lo baje para hacer este tutorial y vamos a ir conociendolo, tengo entendido que está bueno

### 1.2. Instalar Git

En windows la descarga trae un .exe con una guía de instalación y casi siempre dale a la opción que trae por defecto, salvo en [select additional tasks](https://i.imgur.com/Dsid9Rs.png) y en el [terminal emulator](https://i.imgur.com/luOx65o.png).

---

## 2. Ruby y Rails

### 2.1 Instalar ruby

Ruby es el lenguaje de programación que vamos a usar. Cuando digo instalar ruby, en realidad estamos instalando el compilador de ruby, es decir un programita que agarra la porquería que nosotros escribamos en un archivo .rb y lo convierta en un programa que la computadora pueda ejecutar.

La versión de ruby de un proyecto se deja escrito en el archivo .ruby-version que está en la carpeta raiz del proyecto, te dejo un link para instalar esa versión ([2.6.7 para windows 64 bits (x64)](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.7-1/rubyinstaller-devkit-2.6.7-1-x64.exe)). Ese link salió de [acá](https://rubyinstaller.org/downloads/) que encontré esa página en google buscando `install ruby windows`, todo este texto extra es para que te vayas haciendo amigo con googlear TODO.

La instalación no tiene mucho misterio. Dale todo lo por defecto. Levanta una consola que tira unos poderes cuando apretas enter ni idea que hizo.

### 2.2 Instalar Rails

Más adelante vamos a hablar sobre qué es y cómo sacarle provecho a Rails, pero por ahora vamos a limitarnos a instalarlo.

Para instalar Rails, lo vamos a hacer usando Ruby. Suena extraño pero Rails no es más que una librería (de las más grandes que hay en Rails) del lenguaje de programación Ruby. Lo primero hay que hacer es levantar una terminal 😱.

```

### Empezando a amigarse con la terminal: ###

En Windows, podés levantar una terminar haciendo `Ctrl + R`, que abre el ejecutador de programas de Windows, y ahí escribimos `cmd`. Más adelante cuando bajemos el proyecto voy a instruirte un poco en comandos útiles, y cómo movernos en la terminal, pero por ahora vamos limitarnos a la instalación.

``` 

Ejecutamos entonces:

```
  gem install rails
```

Y listo, podes comprobar que quedó instalado imprimiendo la versión escribiendo en la consola `rails -v`

---

## 3. Base de datos - [Instalar PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

Como no vamos a hacer un back de jugete, vamos a precisar tener una base de datos que persista la información cuando apaguemos la compu! Para eso, vamos a instalar un programa que gestiona bases de datos: postgreSQL. Yo baje la `13.3` por ser la última, probemos con esa y si se rompe actualizo esto.

El instalador no tiene mucho misterio. Dale todo el por defecto y en un momento te pide una contraseña, yo usé `12345678`, no es importante que sea polenta porque es para uso interno del programa en tu compu. A su vez, cuando creamos una base de datos vamos a tener que ponerle una contraseña para que, si la hiciéramos pública no cualquiera pueda leerla. La contraseña que utilices para la base de datos del proyecto, la vas a tener que escribir en el archivo `config/database.yml` para que Rails pueda usarla con tu Postgres.

En otro momento te abre un segundo wizard  `stack_builder`, cerralo nomas.

Para no llenarte la cabeza desde ahora, y queriendo empezar a separar un poco la información, dejo un breve repaso de base de datos en un archivo `database.md` en la carpeta `documentation`.

---

---

# Listos

Una vez tenemos todo instalado, ya estamos en condiciones de bajar y correr el proyecto.

Vamos a empezar por levantar una terminal (instrucciónes más arriba)

```

### Un par de comandos utiles para la terminal ###

Llego momento de hacernos amigos de la terminal, dejo un par de comandos útiles:

| windows | ubuntu     | descripcion                                                           | 
| ------- | ---------- | --------------------------------------------------------------------- |
| dir     | ls         | Lista los archivos que existen en la carpeta actual                   |
| cd      | cd         | Se usa para moverte a una carpeta (change directory) que este dentro  |
|         |            | de la carpeta actual. Ej: `cd imagenes`.                              |
| cd ..   | cd ..      | Salimos de la carpeta (vamos a la anterior)                           |
| mkdir   | mkdir      | Crea una carpeta. ej: `mkdir nueva_carpeta`                           |
| start . | xdg-open . | Abre la carpeta actual en el explorador de carpetas que conocemos     |

```
Notar que `..` representa el directorio padre del que estoy parado y `.` el directorio actual.
Una vez que levantas la terminal, vas a estar en la carpeta raíz de tu usuario, supongo vas a ver:

```
  C:\Users\Bruno>
```

Nuestro proposito es crear una carpeta `Development` en el escritorio de la compu y adentro crear una carpeta para este proyecto. Te dejo como ejercicio que intentes hacerlo con los comandos que puse arriba

** SPOILER ejercicio crear Development: **

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

## 1. Bajar el proyecto

Una vez que tengamos la carpeta del proyecto creada (en este ejemplo 'AnimeApp') empecemos por bajar el repo del backend. Para esto voy a usar el comando por HTTPs (más informacion de HTTPS contra SSH después)

  `C:\Users\Bruno\Desktop\Development\AnimeApp> git clone https://github.com/ggarciak/rails-api.git`

> Nota1: Para poder hacer paste en la terminal, tenés que entrar a properties, y marcar la cajita de `Use Ctrl+Shif+C/V as Copy/Paste`

> Nota2: Para más info de los comandos de git hay un archivo `git.md` en la carpeta `documentation`.

Si ejecutamos un `dir` vamos a ver que apareció una carpeta nueva (`rails-api`), movámonos adentro de esa carpeta.

---

## 2. Instalar el proyecto

Rails tiene "gemas" (paquetes) en sus aplicaciones, para levantar un proyecto es importante instalar las gemas del proyecto antes de levantarlo

> Info extra: La información de que gemas tiene la app y en que versión están se encuentra en el `Gemfile` en la carpeta raíz del proyecto

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> bundle install
```

---

## 3. Crear la base de datos
Para mas información sobre base de datos, ver `documentation/database.md`

Para poder guardar nuestros datos, la app tiene que crear la base de datos en postgres, la configuración la saca de `config/database.yml`

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> rails db:create
```

La base que creamos está absolutamente en blanco. Vamos a ver más adelante el concepto de migración, pero por ahora pensémoslas como instrucciones para modificar la base de datos (agregar un atributo, crear una tabla, etc). Es importante correr las migraciones para crear las tablas de `Anime` y `Character`.

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> rails db:migrate
```

Y por último yo generé un par de animes y personajes para que la base no empiece vacia, lo podes encontrar en `db/seeds.rb`. Para correr el seed ejecutamos

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> rails db:seed
```

En general, cuando trabajen varias personas en un proyecto, los demás van a hacer sus modificaciones a la base (migraciones) y rails te va a putear cuando intentes levantar un proyecto sin correrlas, vamos a ir a esto después

---

---

# Ya!

Ahora podemos levantar el server!

```
  C:\Users\Bruno\Desktop\Development\AnimeApp\rails-api> rails s
```

Si abrís un browser y vas a `localhost:3000` te va a tirar la página de bienvenido a rails 🥳

¿Qué esperarías encontrar en la web `localhost:3000/characters/1`? (para responder esto leer el archivo `documentation/rails.md`)

¿Y en `localhost:3000/animes`? 

* ¿Qué otras rutas se te ocurren que nos devuelvan datos?

* ¿Qué rutas creés nos pueden devolver un error?

  Ojo que en windows cuando una ruta devuelve error EXPLOTA el servidor y tenes que matarlo, voy a ver de emprolijar eso.

```
### Otro tip para la terminal: ###
  Para matar el server vas a la terminal donde está corriendo y apretas CTRL+C (esto es para matar procesos en general desde la terminal).
```

  Para volver el server levantarlo solo precisas de `rails s`. Todo lo relacionado a la base persiste (no hay que correr migraciones, ni seeds ni crear nada cada vez).

---

## Proximos pasos:

  * Hay una carpeta que NO es parte de la estructura de RoR, `documentation`.
  
    Ahí dejé guias de distintas tematicas, te recomendaría empieces por la de rails pero la idea es un poco que sean independientes?, no sé todavía, probá y contame
  