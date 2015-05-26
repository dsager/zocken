Rails.application.routes.draw do

  root to: 'home#index'
  get 'home/index'

  devise_for :players
  resources :players, except: [:create, :new] do
    resources :participations
  end

  resources :bets
  resources :results
end
