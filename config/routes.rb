Rails.application.routes.draw do
  root to: 'bets#new'
  resources :bets, only: [:new, :edit, :create] do
  	resources :qrs, only: :show
  end

  resources :transactions, only: [:index]
end
