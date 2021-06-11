# Un poco de contexto para jbuilder:

# Acá definimos que se va a devolver en la respuesta para un endpoint especifico

# Endpoint son las acciones de los controladores, las que devolvemos en rutas,
# los "puntos de acceso" a la aplicación desde el front

# Cuando queremos devolver algo, ponemos
# "json.nombre_del_campo valor_del_campo"

# Ej: Si quisiese devolver la cantidad de personajes en un mazo podría hacer:
# json.first_deck_length @first_deck.length

# Entonces en el front me va a llegar un json así:
# (suponiendo hay 3 personajes en el mazo)
# {
#   first_deck_length: 3
# }


# Muchas veces vamos a querer devolver un objeto, como puede ser los mazos aca
# Actualmente tenemos dos variables con un arreglo de personajes, entonces queremos
# "desmenuzarla"

# Para esto usamos un forEach, que es lo que escribiste luego de "json.deck" 

# Cuando agregamos un "do" al final es porque vamos a hacer algo mas
# Es como un begin, esto aplica también para cuando mires el routes.rb

json.deck @deck1 do |deck1|
  # Acá adentro, estamos iterando sobre los objetos de @deck1, y estamos
  # diciendo que de ellos queremos devolver

  # Para acceder a como es el objeto usamos lo que escribimos entre los "| |"

  # Dejo escrito para que devuelva el nombre, pero te dejo para que agregues el resto
  # Quiero todos los datos del personaje

  # Podes ver otras vistas para ayudarte

  json.name deck1.name
end

json.deck @deck2 do |deck2|
end