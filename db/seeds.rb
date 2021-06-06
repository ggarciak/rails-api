if (Rails.env.development? && Anime.count === 0)
  haikyu = Anime.create!(name: "Haikyu")
  naruto = Anime.create!(name: "Naruto")

  Character.create!(name: "Itachi Uchiha", biography: "Ichizokugoroshi no Itachi", anime_id: naruto.id)
  Character.create!(name: "Kakashi Hatake", biography: "Kopī Ninja no Kakashi", anime_id: naruto.id)
  Character.create!(name: "Sasuke Uchiha", biography: "", anime_id: naruto.id)

  Character.create!(name: "Shōyō Hinata", biography: "Shoyo Hinata (日向 翔陽, Hinata Shōyō) is a first-year student at Karasuno High School and the protagonist.", anime_id: haikyu.id)
  Character.create!(name: "Tobio Kageyama", biography: "He is the team's starting setter and was notoriously known as the 'King of the Court' in Junior High for his tyrannical sets and authoritarian-style leadership", anime_id: haikyu.id)
end