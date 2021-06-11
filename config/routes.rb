Rails.application.routes.draw do
  # Sí, está mal. Si vemos en rails routes vemos que nos está devolviendo un get a
  # /decks
  # pero tampoco está usando el controlador de personajes

  # Tengo que escribirte de rutas, pero hay dos formas de presentarlas
  
  # 1. Estamos trabajando con una api y la ruta no es la que va a ir en el explorador

  # a.k.a. No importa si la ruta es "/conseguir_mazos" o "/decks/get_decks"
  # Nos aprovechamos de esto utilizando la forma de definirlas "dentro" del recurso
  # O sea, dentro del controlador

  resources :animes do
    # Dejo un ejemplo de como sería una ruta post para vincular dos animes
    # Que es vincular dos animes? Quien sabrá, pero esto sólo define la ruta
    # Lo que hace el metodo depende de lo que diga el controlador
    # post :link, on: :collection

    # Recordamos lo de on collection y on member lo hablamos por meet y
    # planeo detallarlo cuando emprolije estas notas y las haga un .md
  end

  resources :characters

  get 'decks' => 'decks', as: :decks #está mal

  # 2. Como side note
  # Supongamos que queremos que la ruta sea algo especifico, ya sea porque no es una api
  # y queremos rutas lindas en el explorador, o porque se me canta

  # En ese caso podemos definir una ruta de forma literal (que es lo que hace la linea
  # que dejaste, sólo que de manera incompleta)

  # get 'nombre-de-mi-ruta', to: 'controller_name#action_name'
end



