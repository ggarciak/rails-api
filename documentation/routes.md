# Ruteo de la api

## CRUD
- Create
- Read
- Update
- Delete

Son las 4 acciones básicas que existen cuando hablamos de datos persistidos.

La idea es que si tengo un modelo generalmente voy a querer poder crear elementos del modelo, "leerlos" (ver la información de 1 o de varios), actualizar uno en concreto y borrar uno en concreto. Los controladores no necesariamente tienen todas las acciones de CRUD (no siempre vas querer dejar que borren cosas, o qcyo), pero en este ejemplo dejo todas para que puedas ir familiarizandote con las acciones básicas.

A demás, podes definir otras acciones en un controlador, un ejemplo sería una acción que reciba dos personajes y cree una relación entre ellos (esto más adelante), que es una acción que importa sobre el modelo de personajes entonces iría en el `characters_controller.rb` pero no es ninguna de las CRUD

Las acciones custom se tienen que especificar en el `config/routes.rb` (para más adelante)
