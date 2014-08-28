Rails.application.routes.draw do
  root to: 'bets#new'
  resources :bets, only: [:new, :create]
end
