Rails.application.routes.draw do
  
  root 'home#index' 

  devise_for :users

  resources :profiles do
    get 'search', on: :collection
    put :favorite, on: :member
    resources :comments
  end
  resources :companies
  resources :skills
  resources :joblevels
  resources :benefits
  resources :jobs do
    get 'search', on: :collection
    resources :profilejobs do
      get 'search', on: :collection
    end
  end
 
  namespace :api do
    namespace :v1 do
      resources :companies, only: %i[show]
    end
  end
  
end
