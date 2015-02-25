	Rails.application.routes.draw do
  resources :sale_details

  resources :sales

  resources :icecreams

  post "/add" => 'shopping_cart#add_to_cart'
    
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users
end
