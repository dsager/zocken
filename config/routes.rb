Rails.application.routes.draw do
  devise_for :players
  get 'home/index'

  #
  root to: 'home#index'
  resources :players, except: [:create, :new]
  resources :bets
  resources :participations
  resources :results
end
