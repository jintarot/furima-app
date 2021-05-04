Rails.application.routes.draw do
  
  root to:"items#index"
  devise_for :users
  get 'items/index'
  resources :items,only:[:index,:new,:create,:show,:edit,:update,:destroy,:search] do 
    resources :orders,only:[:index,:create]
    resources :comments,only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
