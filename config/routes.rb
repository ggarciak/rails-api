Rails.application.routes.draw do
  resources :animes
  resources :characters

  get 'decks' => 'decks', as: :decks #está mal
  
end
