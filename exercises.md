# Primero creemos una rama para trabajar (subir los ejercicios).

Esta rama va a ser tu "master", no vamos a hacer 1 por ejercicio si no que acá vas a subirlos a medida vayas haciendolos. El nombre puede ser el que te pinte, yo le pondría algo onda "bruno-workspace"

  Nota: De ahora en más cuando pushees va a ser siempre a esta rama, ej: $ git push origin bruno-workspace

  Nota2: Cuando te sientas mas comodo con git, vamos a hacer que los ejercicios los hagas en ramas separadas y hagas un Pull Request (PR) con los ejercicios, pero lo dejamos para después. Yo te dejo estas notas de cosas que vamos a hacer después por si ya te sentis comodo para hacerlas me digas y las apuramos, pero la idea no es acribillarte.

# Vamos a hacer la guerra!

O al menos algo parecido.

Estaba pensando en algo sencillo de hacer pero no caer en una agenda de personajes, y se me ocurrió un juego parecido a la guerra clasica de cartas, donde cada jugador va a recibir un mazo con la mitad de los personajes que haya en el sistema y van a "luchar".

## Para esto vamos a precisar algunas cosas en el modelo de personajes:

* Necesitamos que los personajes tengan vida, para esto quiero que crees una migración que agregue el campo `hp` de tipo `int` a la tabla de characters, el por defecto va a ser `100`.

  A demás, quiero saber si los personajes son malvados o no, para eso vamos a necesitar una campo booleano con nombre `evil` en la tabla de personajes y que empiece por defecto en `false` (asumamos que la gente es buena por defecto)

  ** Puntos extra: **
    * Agregar los dos campos en la misma migracion
    * Agregar al seed (`db/seeds.rb`) dos personajes que tengan `evil` en `true`, del anime que quieras (no hay puntos extra por crear otro anime (? )

---

* Vamos a necesitar obtener un mazo de personajes!

  Para eso quiero una funcion en el controlador de characters que me devuelva un json con la siguiente forma:
    
    ```
    {
      deck1: [{ personaje1, personaje2, personaje3 }],
      deck2: [{ personaje4, personaje5, personaje6 }]
    }
    ```
  
  El largo de cada arreglo debe ser la mitad de la cantidad de personajes que haya en el sistema (Quiero usar todos los personajes)

  Recordamos que hacer una función implica agregarle una ruta a esa función (esto no vas a poder hacerlo en el round1)

  ** Puntos extra: **
    * Que los dos arreglos no vengan necesariamente ordenados por id como en el ejemplo de más arriba, ej:

    ```
      {
        deck1: [{ personaje2, personaje4, personaje3 }],
        deck2: [{ personaje6, personaje1, personaje5 }]
      }
    ```

---

* Para sumarle otro poquito de aleatoriedad, agreguemos poderes!

  * Quiero que los personajes tengan poderes con los cuales van a atacar. Estos poderes tienen una cantidad de daño que vamos a representar como un entero y un elemento. En un comienzo, los elementos pueden ser "Fuego", "Planta" y "Agua". Esto en ralis se modela con un `enumerado`.

  * El modelo no debe permitir la creacion de un poder sin elemento (notar que no trae un valor por defecto tampoco)

  * Para mantenerlo sencillo, un personaje va a tener muchos poderes, pero un poder tiene 1 sólo personaje (1-N)

---

* WIP.