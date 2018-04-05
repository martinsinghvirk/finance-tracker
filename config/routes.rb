Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :registrations => "user/registrations" }

  root 'welcome#index'

  # Här lagras en användares aktier.
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'

  resources :user_stocks, only: [:create, :destroy]
end
