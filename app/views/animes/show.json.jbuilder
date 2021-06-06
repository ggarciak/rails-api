json.id @anime.id
json.name @anime.name

json.characters @anime.characters do |character|
  json.name character.name
  json.biography character.biography
end