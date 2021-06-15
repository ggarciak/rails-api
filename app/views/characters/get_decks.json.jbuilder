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

json.first_deck @first_deck do |first_deck|
  # Acá adentro, estamos iterando sobre los objetos de @deck1, y estamos
  # diciendo que de ellos queremos devolver

  # Para acceder a como es el objeto usamos lo que escribimos entre los "| |"

  # Dejo escrito para que devuelva el nombre, pero te dejo para que agregues el resto
  # Quiero todos los datos del personaje

  # Podes ver otras vistas para ayudarte
  json.character_id first_deck.id
  json.name first_deck.name
  json.biography first_deck.biography
  json.anime_name first_deck.anime.name
  json.is_evil first_deck.evil
  json.hp_count first_deck.hp
end

json.second_deck @second_deck do |second_deck|
  json.character_id second_deck.id
  json.name second_deck.name
  json.biography second_deck.biography
  json.anime_name second_deck.anime.name
  json.is_evil second_deck.evil
  json.hp_count second_deck.hp
end