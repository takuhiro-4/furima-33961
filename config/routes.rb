Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'itmes/index'
  resources :items, only: [:inedx, :new, :create, :destroy]
end
