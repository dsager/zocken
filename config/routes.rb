Rails.application.routes.draw do
  #
  resources :players
  resources :bets
  resources :participations
  resources :results
end
