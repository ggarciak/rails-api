# Bases de datos!

Una base de datos tiene una tabla por modelo (generalmente), ya que son los modelos son las entidades que usamos para modelar el mundo real y es la información que queremos persistir, dejo dos ejemplos de la tabla de character y de la tabla de anime:

---

## Tabla anime

| nombre del campo | tipo del campo |
| ---------------- | -------------- |
| id               | int            |
| name             | string         |
| created_at       | date           |
| updated_at       | date           |

---

## Tabla character

| nombre del campo | tipo del campo |
| ---------------- | -------------- |
| id               | int            |
| name             | string         |
| biography        | text           |
| anime_id         | int            |
| created_at       | date           |
| updated_at       | date           |

---

## Analizando un poco estas tablas:

En el 99% de las tablas existe un campo `id`, de tipo `int` (integer = numero entero) que es el identificador interno, pensalo como una forma unica de referirnos a un personaje especifico, no importa que tenga en cualquier otro campo, dado un id sólo vamos a obtener 1 resultado para esa tabla.

Ambas tienen un campo con el nombre ya que son dos cosas que tienen nombre en la vida real, un ejemplo de un modelo que no tendría nombre sería por ejemplo una tabla de autos. Nombre es un `string` (máximo 255 caracteres).

```
  Ejercicio: Que campos se te ocurre que tendría una tabla de autos?
```

> Un poco de información extra: Podemos pedir restricciones sobre los campos, como que sea único (no haya dos personajes con el mismo nombre), no sea vacio (no exista un personaje sin nombre), que tenga un valor por defecto, etc.

Character tiene un campo de texto que es la biografía del personaje (hasta 65536 caracteres), lo puse a modo de ejemplo sólo para que conozcas la diferencia entre el tipo `string` (texto corto) y `text` (texto largo), nada muy importante por ahora.

En ambos modelos (y en el 99% de los modelos) también tenemos dos campos de cuando fue creado, y cuando fue la última vez que fue modificado (a veces pueden ser útiles y no cuesta mucho espacio agregarselo al modelo)

En la tabla de personajes me interesa el campo `anime_id`, como te podes imaginar tiene el `id` del anime al que pertenece. Este campo es el que nos permite tener una **relación** entre el modelo personaje y el modelo anime.

## Migraciones

Para modificar la base de datos, usamos migraciones. Son quienes crean, modifican y eliminan tablas y sus valores. Las migraciones son también un paso a paso de como se construyó el esquema de la base, y como tal es importante que esten correctamente ordenados en fechas. Este orden se suele dar normalmente porque cuando creas una migración le pones la fecha en la que la creas.

Las migraciones tienen un nombre de archivo de la forma

```
  YYYYMMDDHHmmss_breve_descripcion.rb
```

Una vez ejecutada una migración se guarda la como última fecha en la que se corrieron las migraciones, por lo que agregar migraciones con un nombre de archivo con fecha previa a la última migración creada no es válido.

- Info extra:

  Hablo del camino para llegar al esquema porque durante el desarrollo las tablas van ganando y perdiendo columnas por errores en la etapa de analisis, puede pasar que tengas una migración que cree una tabla con ciertos campos, te diste cuenta que un campo no tenía útilidad y lo borras después en otra migración

  Por que no borrar el campo en la creación de la tabla y que las migraciones no sean todas "create_table" y listo?. Cuando ejecutas una migración en una base de datos haces el cambio que la migración indica, y si después ese archivo se modifica no importa porque la migración ya se corrió sobre la base.

  Si borras toda tu base y corres las migraciones no habría problema porque no estás modificando migraciones ya corridas, pero borrar toda la base de datos cada vez que quieras modificar algo no es un camino razonable.

  Podes pensar en escribir con una migración como analogo de escribir con lapicera (Y acá el lado azul de la goma tampoco funciona), una vez subiste una migración al repo esa migración quedó escrita con lapicera, y para cambiarla no basta con modificar el archivo, tenés que crear un rayón nuevo para taparlo (otra migración)

En rails, las migraciones son una clase con una funcion change que indican que van a modificar

- Más info extra:

  Una migración suele tener un `up` que son las cosas que va a modificar la migración, y un `down` que es las acciones que hay que tomar para revertir la migración. Rails nos permite unificar esto en un `change`.

  Desvariando un poco más, hay migraciones que no se pueden revertir, esto suma a la importancia de **no modificar migraciones ya subidas al repo**.

Las migraciones tienen acciones (`add_column`/`remove_column`, `add_index`, `create_table`) que el nombre es bastante explicativo, en el repo originalmente se subieron dos migraciones para crear los modelos de `anime` y `character`. Los tipos de los capmos puden ser `string`, `text`, `integer`, `float`, `datetime`, etc.

Por más info de migraciones, la [guía de rails es muy buena](https://guides.rubyonrails.org/v3.2/migrations.html)

## Schema!

Una vez hayas entendido las tablitas de arriba, podes ver todas las tablas que tenemos en la aplicación en el archivo `schema.rb` en la carpeta `db/`. Recordamos que este archivo sólo se crea una vez completado el readme (particularmente con `rails db:create`).

---

# [Relaciones en bases](https://guides.rubyonrails.org/association_basics.html)

Estamos trabajando con datos de bases _relacionales_, que significa esto? Que tenemos entidades en nuestra base que estan relacionadas (un poco reiterativo). La idea de relacionar dos modelos es que podamos acceder desde uno al otro de manera "directa", dependiendo de como sea esa relación (1-1, 1-N, N-N) vamos a tener distintas formas de modelarlo a nivel de base

Sacando un poco lo abstracto, vamos a ver el ejemplo del repo:

1. ## Relacion `1 - N` (X puede tener muchos Y) ##

    Empiezo con esta relación porque es la que tenemos entre anime y personaje.

    Es fácil pensar en las relaciones cuando las llevamos a lenguaje natural (1 anime tiene entre 0 y muchos personajes, duh).

    Para modelar esto rails nos ofrece la relación `has_many` (ver modelo `Anime`). A nivel de bases de datos, basta con agregar un campo `anime_id` a la tabla de personajes, si vemos la migración donde se carga la tabla de personajes vemos que hay un

    ```
      add_reference :characters, :anime, foreign_key: true
    ```

    Se que ya leiste la guia de rails y sos experto en migraciones, pero completo para dejar pronta la guía. Add reference hace dos cosas por nosotros:

    ```
      add_column :characters, :anime_id, :integer, default: 0, null: false
      add_index :characters, :anime_id
    ```

    La primera linea agrega la columna `anime_id` en `characters`. Si vemos un anime:

    ```
      C:\Users\Garcia\Development\AnimeApp\rails-api>rails c
      irb(main):001:0> Character.first
      Character Load (0.4ms)  SELECT "characters".* FROM "characters" ORDER BY "characters"."id" ASC LIMIT $1  [["LIMIT", 1]] =>
        #<Character id: 1, name: "Itachi Uchiha", biography: "Ichizokugoroshi no Itachi", created_at: "2021-06-08 17:59:07.425621000 +0000", updated_at: "2021-06-08 17:59:07.425621000 +0000", anime_id: 2>
    ```

    Vemos que tiene un campo anime_id con valor 2 (El id del `Anime` con nombre Naruto).

    Segundo, agrega un indice a la columna `anime_id` en `Characters`.

    - Info extra: Un indice en base de datos sirve como un puntero al objeto del otro lado de la relación. No importa que entiendas que signifca esto, pero queremos indices en las relaciones porque mejoran el tiempo de respuesta de las busquedas

    Pregunta: Habría que agregar un campo en la tabla de anime? Por qué?

2. ## Relacion `1 - 1` ##

    Cuando un modelo se relaciona con sólo otro modelo de la relación que planteamos. En el repo, este es el caso de los personajes (Los personajes tienen 1 anime). Otro ejemplo de esto (sin que del otro lado sea una relación `1 a N`) puede ser el linaje del personaje (1 personaje tiene 1 linaje, y 1 linaje tiene 1 personaje) (olvidemosnos de los hermanos)

    Existen dos formas de modelar esta relación a nivel de modelo, podemos decir que:

      * X pertenece a Y

        Esta relación se corresponde con el primer escenario planteado (cuando sos uno de los `N` en una relacion `1 a N`). Para esto rails nos brinda `belongs_to`

      * X tiene un Y

        Este sería el otro escenario, en donde tenés 1, pero no te pertenece. En este caso usamos `has_one`

  * Que implica pertencer? (a.k.a diferencia entre `has_one` vs `belongs_to`)

      Cuando un elemento en la relación te pertence (ej: Anime-Personajes), modelamos la relación del lado del elemento "hijo". En castellano, como es el personaje quien pertenece al anime, es el personaje quien tiene el campo `anime_id`

      Para el caso de el linaje, va a ser la tabla `lineage` quien tenga un campo `character_id`.

      Esta idea de tener un `modelo_id` en otra tabla se llama foreign key.

3. ## Relacion `M - N` (La complicada) ##

    Cuando queremos relacionar de 1 a 1 podemos agregar una columna en la base que tenga el id de quien queremos relacionarnos.

    Para relacionarnos 1 a N, usamos la misma lintea que antes pero dejando el id en la relacion que va a ser N

    Como podemos hacer cuando tenemos M objetos que se pueden relacionar con N de otro modelo?

    Llevemoslo a un ejemplo concreto, querémos agregar poderes. Un poder puede "tener" más de un personaje (ej: el kamehameha puede ser un poder tanto de Goku como de Gohan), mientras que un personaje puede tener más de un poder (ej: Deku y su fruta).

    Como podemos modelar esto? Basicamente estaríamos queriendo tener una columna en cualquiera de las dos tablas que sea un arreglo de ids, pero eso no existe a nivel de base de datos, porque si quisesemos tener un arreglo lo que las bases nos permiten es agregar otro modelo

    Entonces esa es la solución, vamos a tener una tabla "PoderesPersonajes" (o el nombre que se te cante) que nos permita modelar esta relación. Cuando queramos decir que un personaje y un poder están relacionados, vamos a tener un registro en la tabla "PoderesPersonajes" con el id del personaje y el id del poder a relacionar

    Para el ejemplo, tenemos dos tablas:

    ```
      | Characters |    | Skills |
      | ---------- |    | ------ |
      | id         |    | id     |
      | name       |    | name   |
    ```

    Y queremos crear la relación M a N entre ellas, entonces creamos la tabla:

    ```
      | CharacterSkills |
      | --------------- |
      | character_id    |
      | skill_id        |
    ```

    Decimos que un personaje tiene un poder a través de la tabla `CharacterSkill`

    ```
      en Character.rb
        has_many characterSkills
        has_many skills, through: characterSkills

      en Skill.rb
        has_many characterSkills
        has_many characters, through: characterSkills
    ```

    - Mas info:

      En realidad este ejemplo es erroneo. Hay dos formas de modelar una relacion M-N, `has_many ..., through: ...` o `has_and_belongs_to_many ...`.

      En este caso querríamos utilizar el segundo, ya que la tabla "CharacterSkills" no tiene sentido para nosotros.

      Esto está mejor detallado en la guía (link en el titulo), pero la idea es que si el modelo que une las dos tablas tiene sentido como modelo (y no un nombre pedorro como `CharacterSkills`) vas a querer utilizar `has_many through` mientras que en el otro escenario utilizarías `has_and_belongs_to_many`.

      En esta guía ilustré con la primera opción porque es el caso más general, o sea `has_and_belongs_to_many` es un caso particular de `has_many through`. Nos queda una tabla creada que no nos importa pero ya era

      Un ejemplo de un caso donde quieras usar `has_many through` es el de estudiantes, clases y profesores

      - 1 estudiante tiene muchas clases (1 - N)

      - 1 profesor tiene muchas clases (1 - N)

      - Una clase tiene N estudiantes y 1 profesor (1-N y 1-1)

      Si quiero llegar a que profesores tiene un estudiante (M-N), tendría que ver que clases cursa primero, por lo que tendría

      ```
        Student.rb
          has_many :lessons
          has_many :teachers, through: lessons
      ```
