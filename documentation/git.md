# Comandos utiles:
## 1. Información de git

  * **git status**

    De los comandos más basicos y que más van a usar. Este comando nos lista la lista de archivos que tenemos diferentes con respecto al repositorio online.

    Salidas más tipicas:

    1.

    ```
      > On branch $branch_name
      > nothing to commit, working directory clean
    ```

    Indica que no hay ninguna diferencia con respecto a nuestros archivos y el repositorio

    ---

    2.
    ```
      > On branch $branch_name
      > Your branch is up-to-date with 'origin/$branch_name'.
      > Changes not staged for commit:
        > (use "git add <file>..." to update what will be committed)
        > (use "git checkout -- <file>..." to discard changes in working directory)
            > modified:   nombre_archivo1
    ```

    En este caso nos encontramos con que nombre_archivo1 ya existía en el repositorio y nuestra versión local está modificada, pero no ha sido agregado para ser commiteado

    ---
    
    3.
    ```
      > Changes to be committed:
        > (use "git reset HEAD <file>..." to unstage)
            >
            > modified:   README.md
    ```

    En este caso sí fue agregado y está pronta para ser comiteado

    ---

    4.
    ```
      > Untracked files:
        > (use "git add <file>..." to include in what will be committed)
            > archivo_no_trackeado1
            > archivo_no_trackeado2
      > no changes added to commit (use "git add" and/or "git commit -a")
    ```

    En este caso, nos encontramos con dos archivos que no existen en el repositorio pero si en nuestra copia local, tener cuidado de no agregar archivos de configuración/basura (estos últimos suelen estar en el .gitignore, un archivo que nos dice que archivos ignorar en la carpeta del proyecto, como toda la carpeta "node_modules/", pero puede que aparezcan nuevos, favor de comunicarlos si ven alguno).

    ---
    5.
    ```
      > Your branch is behind 'origin/$branch_name' by $n commits, and can be fast-forwarded.
        > (use "git pull" to update your local branch)
    ```

    Nuestra versión es vieja, y no tiene la última versión que hay en el repositorio (alguién agregó archivos desde la última vez que hicimos un pull)

    ---

  * **git diff $expresion_regular**

    Nos da la diferencia de los archivos cuyo nombre cumplan con la expresión regular. En caso de utilizar una expresión vacia nos da la diferencia de todos los archivos

    ---

  * **git log**

    Nos muestra los últimos commits con su identificador y sus respectivos mensajes

    ---

  * **git reflog**

    Nos muestra los últimos comandos ejecutados localmente así como su id para poder volver a un estado anterior en caso de ser necesario.

    Ej: Supongamos que hice mal un amend y quiero volver al paso previo:

    ```
      $ git reflog
        > fa10b30 HEAD@{0}: commit (amend): Initial commit
        > 0991b98 HEAD@{1}: checkout: moving from branch_example to prototype
      $ git reset HEAD@{1}
    ```

    Nos deja el repositorio en el estado pre commit(amend)



## 2. Comunicación con el repositorio

  * **git push remote_name local_branch_source:remote_branch_destination**

    El comando que sube nuestros archivos al repositorio. Hasta no manejar otros ambientes, el nombre remoto va a ser siempre origin, mientras que en la mayoría de los casos el nombre de la rama va a ser la misma a la que quieran pushear.
 
    ```
      $ git push origin brach_example:branch_example
    ```

    ---

  * **git pull remote_name local_branch_destination:remote_branch_source**

    Descarga todos los cambios de la rama remota a nuestra rama local.

    ```
      $ git pull origin branch_example:branch_example
    ```

## 3. Manejo de ramas

  * **git branch**

    Nos da el nombre de la rama en la que estamos trabajando actualmente

    --- 

  * **git fetch remote_name**

    Nos trae el nombre de las ramas del repositorio y sus últimas versiones.

    --- 
  
  * **git checkout branch_name**

    Nos mueve a la rama con nombre branch_name

    --- 
  
  * **git checkout -b "new_branch"**

    Nos mueve a una nueva rama llamada "new_branch"

    --- 
  
  * **git branch -d branch_name**

    Elimina una rama a nivel local. En caso de querer eliminar una rama a nivel de repositorio, basta con pushear la rama eliminada ( git push origin branch_name ), o hacerlo todo en un sólo paso ( git push origin --delete branch_name )


## 4. Manejo de archivos

  * **git add $expresion_regular**

    Agrega los archivos que cumplan con la expresión regular, este comando se utiliza en conjunto a "git commit" para subir archivos al repositorio.

      * Si quiero agregar todos utilizo: "."

      * Para agregar una carpeta especifica: "path/a_la/carpeta/\*"

      * Para un archivo especifico poner la ruta del archivo
      
      * Etc
  
    --- 
  
  * **git checkout $expresion_regular**

    Resetea los archivos que aun no esten agregados al commit al último estado conocido de la rama (última vez que se hizo git pull de la rama). No funciona con archivos commiteados

    --- 
  
  * **git reset HEAD $expresion_regular**

    Opuesto al git add, remueve el archivo de la lista de archivos a ser commiteados (El archivo sigue modificado, no se pierden los cambios)

    --- 
  
  * **git rm $expresion_regular**

    Borra el archivo del repositorio

    --- 
  
  * **git mv $archivo_origen $archivo_destino**

    Mueve o renombra un archivo

## 5. Manejo de commits

  * **git commit -m "$mensaje del commit"**

    A medida que vamos agregando archivos utilizando "git add" se va creando una lista de archivos que queremos updatear del repositorio (recordatorio: Para ver dicha lista podemos usar git status).

    Una vez que agregamos todos los archivos que queremos, utilizamos este comando seguido de un mensaje para crear un contenedor donde están los cambios.

    La idea es que los commits sean explicativos y no masivos (No tener mil archivos). El mensaje no suele ser muy largo, sean simples y concretos

    --- 
  
  * **git commit --amend -CHEAD**

    Nos permite agregar la lista actual de archivos a comitear al último commit realizado, independientemente si este ya fue pusheado o no. Muy útil para evitar commits del tipo "Fix typo" o para cuando se quieren cambiar cosas pequeñas que no ameritan un nuevo commit.

    **NOTA**: Este comando modifica el cabezal de git, por lo que para pushear luego de utilizarlo van a tener que usar la bandera force. Este caso es uno de los pocos donde se habilita el uso de esta bandera, y está prohibido utilizar este comando en commits no pusheados.

    --- 
  
  * **git commit --amend -m "Nuevo mensaje para el último commit"**

    Modifica el mensaje del último commit. Misma nota que para el punto 2 

## Los puntos restantes son git "avanzado" que podemos ignorar por ahora.

## 6. Resolución de conflictos

  Actualmente hay dos comandos que nos permiten resolver conflictos, git merge y git rebase.

  Para saber la diferencia entre estos comandos, los invito a leer este link: https://www.atlassian.com/git/tutorials/merging-vs-rebasing

  * **git rebase [-i] branch_name**

    Este comando nos permite resolver manualmente un merge entre una rama y otra. Una ejecución normal sería pararnos sobre la rama con la cual queremos mergear (de ahora en más shared_branch), pullear dicha rama para tener la última versión y luego movernos a nuestra rama con conflictos (de ahora en más our_branch) para luego ejecutar el rebase

    Entonces:
    ```
      $ git checkout shared_branch
      $ git pull origin shared_branch:shared_branch
      $ git checkout our_branch
      $ git rebase shared_branch
    ```

    En caso de no utilizar la flag i (iterative), el rebase se va a ejecutar de rama a rama. Utilizando "git status" podemos ver los archivos que presentan conflictos para resolverlos en nuestro editor de texto. Una vez resuelto todos los conflictos, agregamos los archivos utilizando "git add" para luego ejecutar "git rebase --continue" terminando así el rebase.

    En caso de utilizar la flag i, el rebase se va haciendo commit por commit (basado en los commits hechos en our_branch). Para selecciónar los commits a ser considerados en el rebase se nos abre un nano con los commits y sus ids, podemos utilizar "dd" para borrar una linea (eliminando así la necesidad de comparar ese commit), y ":wq" (o ctrl+x)) una vez que hayamos seleccionado los que queremos.

    El procedimiento ahora es igual al rebase sin la flag i, lo único que al ejecutar "git rebase --continue" se va a abrir de nuevo el nano para mostrar los commits que quedan por ser evaluados, así hasta terminar con todos (Es por esto que aconsejamos no hacer muchos commits)

    En cualquier caso, utilizando "git rebase --abort" se cancela el rebase

    Una vez realizado un rebase, se modifica el cabezal de la rama **al igual que con amend** por lo que se pushea con la flag force. La misma nota descrita anteriormente aplica aquí.

    --- 

  * **git squash**

    En caso de tener muchos commits repetidos, al momento en que se abre el nano en el rebase, donde dice pick pueden escribir squash, unificando de esta manera los commits
   
## 7. Pila

Para movernos entre ramas, git nos suele pedir que commitemos los cambios, aun cuando nosotros querramos movernos para ver una cosa, o simplemente no creamos que son cambios para commietear.
    
Para esto, git nos brinda una pila (FIFO), con los comandos para meter todos los archivos sin commitear en la misma
  * **git stash**
     
Y un comando que remueve el cabezal de la pila
  * **git stash pop**


---

---

# Git Flow

**Nota:** Lo que se describe en esta sección es un proyecto que tenía, nostros vamos a trabajar sólo con master pero este sería un uso más correcto de git.

Una vez bajado el repositorio, nos encontramos en branch master, que contiene la última versión presentada al cliente
    
Para comenzar a trabajar, y ver lo último mergeado hasta el momento, es necesario que nos movamos a la branch develop
    
     git fetch
     git checkout develop
     
Ahora podemos ver todo lo aprobado hasta el momento, en caso de querer arrancar una funcionalidad nueva, creamos una rama

     git checkout -b "nueva_funcionalidad"

Podemos observar ejecutando `git branch` que estamos sobre nuestra nueva rama. Cada vez que querramos subir nuestras cosas a la rama, se hace realizando un commit y push

     git add los_archivos_que_quieras_subir // En caso de querer todos se utiliza "."
     git commit -m "Un breve mensaje que explique que son los cambios"
     git push origin rama_actual:rama_actual
     
Finalizado el push, podemos ver que la terminal nos retorna un link por si queremos hacer un PR.

Un PR es un pedido a través de la página de github, de unir la rama de ustedes con develop (Integrar su trabajo), la idea es que lo hagan una vez finalizado su funcionalidad y la misma testeada con el flujo principal y los posibles flujos alternativos.

Para esto, tienen que sguir el link que les brinda la terminal y los pasos en la página, recuerden que la rama fuente es la suya, mientras que la rama destino es develop

Una vez finalizado el PR, deben poner el link en el canal de pull_requests, donde algún especialista técnico lo revisará siguiendo las pautas establecidas en ese canal (ver chinchetas)
