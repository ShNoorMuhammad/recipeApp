Rails.application.routes.draw do
  root "pages#home"
  get "pages#home" , to:"pages#home"

  resources :items

  get '/signup' , to: 'chefs#new'
  resources :chefs , except: [:new] 

  get '/login' , to: 'sessions#new' 
  post '/login' , to: 'sessions#create'
  post '/logout' , to: 'sessions#destroy'
  
end
