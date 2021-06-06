# Instalación de GIT en **Ubuntu**

> Nota, los nombres que comiencen con $ son variables, no es necesario colocar el simbolo.

## Instalación
  1. Instalar [GIT](https://www.linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)

## Configuración
  1. git config --global user.name $nombre_usuario
  2. git config --global user.email $email_usuario@aca_va_su_email.com
  3. SSH: Para evitar que por cada pull y push que querramos hacer se nos va a pedir usuario y contraseña de la página podemos configurar la clave SSH de manera que no se nos pida identificación

    1) Chequear que no tengamos claves SSH ya publicadas
      ```
        cd ~/.ssh
        ls
      ```
      Por defecto las claves tienen el formato id_algo.pub

    2) Generar una clave SSH (Si el comando anterior devolvió un archivo del tipo id_algo.pub y queremos usar esa key, saltear este punto).
      ```
        ssh-keygen -t rsa -b 4096 -C "$sunombre.$suapellido@gitlab.fing.edu.uy"
        Enter file in which to save the key (/home/gero/.ssh/id_rsa): id_rsa
      ```
      Luego nos pide una passphrase que es una medida extra de seguridad para que si alguien entra al equipo no tenga acceso tan fácil a todos sus repos, yo la dejo en blanco pero sientanse libres de poner lo que quieran. Por más info: [Documentación Git](https://help.github.com/articles/working-with-ssh-key-passphrases/)

    3) Agregar la clave SSH a la computadora
      Chequear que el ssh-agent este corriendo (en este caso si va el simbolo de pesos)
      ```
      eval "$(ssh-agent -s)"
      ```
      Agregar la clave (en caso de no haberla creado con el nombre id_rsa, utilizar el nombre que usaron anteriormente):
      ```
      ssh-add ~/.ssh/id_rsa
      ```
    4) Agregar la clave SSH a su cuenta de GitHub
      En la esquina superior de la página de GitHub, donde está la foto de su usuario, acceden a "Settings"
      De ahí en la barra de la izquierda pueden ver el menu "SSH Keys"

      En el campo Key ingresan el contenido de id_rsa, incluyendo el ssh-rsa al comienzo y el nombre.apellido@gitlab.fing.edu.uy del final

  4. Opcional: Configurar la terminal para tener autocompletado de git y que les muestre la rama en la que están parados: https://github.com/jimeh/git-aware-prompt

Por una explicación de como se usa git y los comandos más utilizados ver el archivo `comandos_git.md` en la misma carpeta.
