Rails.application.routes.draw do
  resources :animes
  resources :characters

  get 'characters/decks' => 'characters#decks', as: :characers_decks
end
