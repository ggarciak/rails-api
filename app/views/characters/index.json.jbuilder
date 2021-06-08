json.characters @characters do |character|
  json.id character.id
  json.name character.name
  json.biography character.biography
  
  json.anime character.anime do |anime|
    json.name anime.name
  end

  json.decks @fighting_decks do |fighting_deck|
    json.deck json.deck
  end 
end