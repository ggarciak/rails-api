json.animes @animes do |anime|
  json.id anime.id
  json.name anime.name
end

json.total_animes @animes.size