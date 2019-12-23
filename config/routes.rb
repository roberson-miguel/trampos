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
    resources :profilejobs
  end
 
  
end
