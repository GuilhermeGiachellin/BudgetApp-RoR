Rails.application.routes.draw do
  devise_for :users
  root 'entities#index'
  resources :entities
  resources :groups
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
