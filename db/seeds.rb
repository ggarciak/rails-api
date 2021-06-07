if (Rails.env.development? && Anime.count === 0)
  haikyu = Anime.create!(name: "Haikyu")
  naruto = Anime.create!(name: "Naruto")
  aot = Anime.create!(name: "Shingeki No Kyojin")

  Character.create!(name: "Itachi Uchiha", biography: "Ichizokugoroshi no Itachi", anime_id: naruto.id)
  Character.create!(name: "Kakashi Hatake", biography: "Kopī Ninja no Kakashi", anime_id: naruto.id)
  Character.create!(name: "Sasuke Uchiha", biography: "", anime_id: naruto.id)

  Character.create!(name: "Shōyō Hinata", biography: "Shoyo Hinata (日向 翔陽, Hinata Shōyō) is a first-year student at Karasuno High School and the protagonist.", anime_id: haikyu.id)
  Character.create!(name: "Tobio Kageyama", biography: "He is the team's starting setter and was notoriously known as the 'King of the Court' in Junior High for his tyrannical sets and authoritarian-style leadership", anime_id: haikyu.id)

 

  Character.create!(name: "Mikasa Ackerman", biography: "After her parents were murdered by human traffickers, Mikasa was rescued by Eren Yeager and lived with him and his parents, Grisha and Carla, before the fall of Wall Maria. She is the last descendant of the Shogun clan that stayed on Paradis Island, thereby related to the Azumabito family, and holds significant political power in Hizuru.", anime_id: aot.id)
  Character.create!(name: "Reiner Braun", biography: "Reiner Braun (ライナー・ブラウン Rainā Buraun?) is the Vice Captain (副長 Fukuchō?, also translated as 'Deputy Chief' or 'Vice Commander' of the Warrior Unit and the main protagonist of Attack on Titan from the Marleyan perspective. He is the illegitimate son of an Eldian and a Marleyan and grew up in Liberio's internment zone. Eventually, he was selected as a child to become one of Marley's Warriors. At the age of ten, he inherited the power of the Armored Titan.", evil: true, anime_id: aot.id)
  Character.create!(name: "Orochimaru", biography: "Orochimaru (大蛇丸, Orochimaru) is one of Konohagakure's legendary Sannin. With a life-ambition to learn all of the world's secrets, Orochimaru seeks immortality so that he might live all of the lives necessary to accomplish his task. After being caught red-handed performing unethical experiments on his fellow citizens for the sake of this immortality, Orochimaru defected from Konoha rather than be persecuted for his ambitions, and for many years sought the village's destruction in order to take revenge and demonstrate what he had learned. After several apparent deaths in the pursuit of his goals, Orochimaru realises his approach is flawed through Kabuto Yakushi, his former associate, and begins monitoring the choices and actions of his former apprentice, Sasuke Uchiha", evil: true, anime_id: naruto.id)
end

  