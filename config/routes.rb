	Rails.application.routes.draw do
  resources :sale_details

  resources :sales

  resources :icecreams

  post "/add" => 'shopping_cart#add_to_cart'
  get "/current_cart" => 'shopping_cart#get_current_cart'
  post "/drop" => 'shopping_cart#drop_current_shopping_cart'
  get "/finish_sale" => 'shopping_cart#finish_current_sale'
    
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users
end
