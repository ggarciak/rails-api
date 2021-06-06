# Bases de datos!

Una base de datos tiene una tabla por modelo (generalmente), ya que son los modelos son las entidades que usamos para modelar el mundo real y es la información que queremos persistir, dejo dos ejemplos de la tabla de character y de la tabla de anime:

### Tabla anime

| nombre del campo | tipo del campo |
| ---------------- | -------------- |
| id               | int            |
| name             | string         |
| created_at       | date           |
| updated_at       | date           |

---

### Tabla character

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

Para modificar la base de datos se usan migraciones (Round 2)

## Relaciones en base de datos

Los modelos pueden estar relacionados:

- 1 a 1
    - X pertenece a Y
    - X tiene 1 Y
- 1 a N
- N a N

Voy a detallar esto en un (Round 3)

## Schema!

Una vez hayas entendido las tablitas de arriba, podes ver todas las tablas que tenemos en la aplicación en el archivo `schema.rb` en la carpeta `db/`