Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
  resource :users, only: [:new,:create]
  resource :session, only: [:new,:create,:destroy]
  resources :products do
    resources :reviews, except: [:index]
  end 
end
