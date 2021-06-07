# Bases de datos!

Una base de datos tiene una tabla por modelo (generalmente), ya que son los modelos son las entidades que usamos para modelar el mundo real y es la información que queremos persistir, dejo dos ejemplos de la tabla de character y de la tabla de anime:

---

## Tabla anime ###

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

Para modificar la base de datos, usamos migraciones. Son quienes crean, modifican y eliminan tablas y sus valores. Las migraciones son también un paso a paso de como se construyó el esquema de la base, y como tal es importante que esten correctamente ordenados en fechas.Este orden se suele dar normalmente porque cuando creas una migración le pones la fecha en la que la creas.

* Info extra:

  Hablo del camino para llegar al esquema porque durante el desarrollo las tablas van ganando y perdiendo columnas por errores en la etapa de analisis, puede pasar que tengas una migración que cree una tabla con ciertos campos, te diste cuenta que un campo no tenía útilidad y lo borras después en otra migración

  Por que no borrar el campo en la creación de la tabla y que las migraciones no sean todas "create_table" y listo?. Cuando ejecutas una migración en una base de datos haces el cambio que la migración indica, y si después ese archivo se modifica no importa porque la migración ya se corrió sobre la base.

  Si borras toda tu base y corres las migraciones no habría problema porque no estás modificando migraciones ya corridas, pero borrar toda la base de datos cada vez que quieras modificar algo no es un camino razonable.

  Podes pensar en escribir con una migración como analogo de escribir con lapicera (Y acá el lado azul de la goma tampoco funciona), una vez subiste una migración al repo esa migración quedó escrita con lapicera, y para cambiarla no basta con modificar el archivo, tenés que crear un rayón nuevo para taparlo (otra migración)

En rails, las migraciones son una clase con una funcion change que indican que van a modificar

* Más info extra:

  Una migración suele tener un `up` que son las cosas que va a modificar la migración, y un `down` que es las acciones que hay que tomar para revertir la migración. Rails nos permite unificar esto en un `change`.

  Desvariando un poco más, hay migraciones que no se pueden revertir, esto suma a la importancia de **no modificar migraciones ya subidas al repo**.

Las migraciones tienen acciones (`add_column`/`remove_column`, `add_index`, `create_table`) que el nombre es bastante explicativo, en el repo originalmente se subieron dos migraciones para crear los modelos de `anime` y `character`. Los tipos de los capmos puden ser `string`, `text`, `integer`, `float`, `datetime`, etc.

Por más info de migraciones, la [guía de rails es muy buena](https://guides.rubyonrails.org/v3.2/migrations.html)


## Schema!

Una vez hayas entendido las tablitas de arriba, podes ver todas las tablas que tenemos en la aplicación en el archivo `schema.rb` en la carpeta `db/`. Recordamos que este archivo sólo se crea una vez completado el readme (particularmente con `rails db:create`).


Las migraciones tienen un nombre de archivo de la forma
```
  YYYYMMDDHHmmss_breve_descripcion.rb
```

---

---

# WIP

## Relaciones en base de datos

Los modelos pueden estar relacionados:

- 1 a 1
  - X pertenece a Y
  - X tiene 1 Y
- 1 a N
- N a N

Voy a detallar esto en un (Round 3)

