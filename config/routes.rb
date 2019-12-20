Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :profiles do
    get 'search', on: :collection
    resources :comments
  end
  resources :companies
  resources :skills
  resources :joblevels
  resources :benefits
  resources :jobs do
    get 'search', on: :collection
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
