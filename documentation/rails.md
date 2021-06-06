# Rails!

El back nace porque queremos tener una forma segura de persistir datos, es nuestra comunicación con la base de datos (por eso más temprano tuvimos que instalar PostgreSQL y crear una base) y es quien se encarga de proteger y administrar estos datos.

Cuando "levantamos" el back, lo que estamos haciendo es asignarle un puerto en la compu donde el programa está "escuchando". Es como asignarle un id a nivel local, rails usa el puerto `3000`. La compu toma esa ida y todos los pedidos HTTP que lleguen al puerto 3000 de nuestra compu los pasa al programa nuestro de rails.

* Un poco de info: Rails es convención sobre configuración, o en criollo, te da un monton de cosas siempre y cuando vos te ajustes a sus reglas (forma de escribir las cosas) que te pide. Empezando por las carpetas y que cosas se ponen en cada lugar, hasta el detalle de cuando algo va en singular o plural. 

  * Más sobre singular/plural:

    Para que no te complique esto, podes pensarlo como si fuese lenguaje hablado. La tabla en base de datos y el controlador trata con todos las instancias de un modelo, por eso hablamos de la `characters_table` o `characters_controller`. Cuando tratas con el modelo usamos singular ya que nos muestra como es 1 personaje cualquiera (`character.rb`).

    Si ya entendiste relaciones en base de datos, cuando una relacion es 1-N (ej: personajes-anime) podemos hacer cosas del tipo `Anime.where(name: 'Naruto').characters`. Hago hincapié en el plural character**s** porque un anime tiene muchos personajes. Esa linea nos devuelve un arreglo de personajes `[<Character1>, <Character2>, ..., <CharacterN>]`.

    Por el otro lado de la relación 1-N, podemos hacer algo así: `Character.where(name: 'Alphonse Elric').anime`. Usamos singular porque 1 personaje tiene 1 anime. Esta linea nos devuelve un objeto de anime `<Anime>`

  * Fun fact, si tuvieses un modelo `person`, rails va a esperar un `people_controller`, y tiene algunos otros plurales no regulares del ingles definidos.

Para comunicarnos con él, nos ofrece los **controladores**.

Los controladores tienen acciones que exponemos en rutas, podemos pensarlo como el punto de entrada a la app desde afuera.

Se encargan de los pedidos HTTP que llegan y generan una respuesta en distintos formatos.

En este caso vamos a generar una aplicación que sus respuestas sean `JSON` (creo que ya conoces este formato) y por eso decimos que es una [API](https://en.wikipedia.org/wiki/API).

Los controladores los organizamos para que suelan corresponderse con un **modelo** de nuestra aplicación (ej: si tenemos una aplicación con usuarios vamos a tener un controlador para usuarios).

Los modelos son las entidades que vamos a manejar en la app y suelen representar las cosas que guardamos en la base de datos. Ejemplos de un modelo pueden ser usuarios, articulos, comentarios, etc. En este repo existen dos modelos, `Character` y `Anime`.


## Carpetas que nos importan (por ahora) de esta estructura:

* `app/controllers`
  Aca van los controladores que hablamos hace un rato.

  Cree dos controladores, te recomiendo que empieces por el de anime que está todo comentado, mientras que el de characters es para que tengas una versión sin comentarios para que te vayas haciendo amigo.

  Las acciones que exponen estos controladores siguen las acciones generales que hay sobre un modelo que es **CRUD** y utilizan los códigos de HTTP para indicar si la ejecución fue exitosa o no. Más info de esto en `routes.md`

> Nota: Los controladores, modelos y demases terminan en `.rb` porque son archivos de ruby

* `app/models`
  Los modelos de la app, son los que venimos hablando. En un archivo de un modelo (dejo de ejemplo `anime.rb` y `character.rb`) se escriben todas las particularidades que tenga. Ejemplo de estas particularidades son las posibles relaciones que pueda tener (ver `database.md`), acciones que queremos que se ejecuten automaticamente cuando se crean, acciones que queremos se ejecuten cuando se actualizan (tipo algún control o calculo de datos), etc.

  En `anime.rb` se hace una validación para que el nombre del anime sea único.

  En `character.rb` vas a ver que se crea una biografía para los personajes que ingresan una biografía vacia

  En ninguno de los dos permite tener un `name` vacio


* `app/views`

  Acá van las vistas de la aplicación (cerrando el MVC), como nuestra aplicación es sólo una api las vistas van a ser el formato que le demos al JSON que queremos devolver

* `db/migrate`

  Acá van los archivos que modifican la base de datos (Round 2 del `database.md`)

## Archivos extras que nos interesan

* `config/routes.rb`

  Es quien nos dice que controladores existen y expone sus acciones. Más info de esto en `routes.md`

* `config/database.yml`

  Es quien tiene la info de la base de datos (nombre, usuario, password para la base).

  > Info extra: Este archivo no suele dejarse en el proyecto si no que se espera que cada desarrollador lo cree al momento de levantar el proyecto, esto es para no dejar datos sensibles del lado del repo. Al ser una app de juguete, yo voy a dejarlo creado para no complicarte.

## Comandos Utiles

* ### Consola de rails

  Levanta el backend (hacer que quede escuchando en el puerto 3000 de nuestra compu)

  ```
    rails s
  ```

* ### La base de datos

  Rails nos brinda comandos para manejar la base de datos:

  * rake db:create / rake db:drop
  * rake db:migrate
  * rake db:seed

  *WIP: Completar con el round 2 DB*

* ### Rutas

  Podemos listar las rutas de las que hablamos en `routes.md` y definimos en `config/routes.rb`

  ```
    rails routes
  ```

* ### Consola de rails

  Para probar cosas

  ```
    rails c
  ```

* ### Generadores

  No vamos a usar los comandos generadores, cuando aprendí creaba los archivos a mano y vamos a mantenernos un poco en la misma porque va a ser todo pequeño

## Info extra para ir sumando

- Una aplicación **no API** podría manejar como respuesta de un controlador un html entero, esto va de la mano de lo que te comenté en wpp de poder tener la aplicación de angular del lado de RoR pero no importa de momento, sólo que manejes que esta respuesta puede ser distintas cosas.
