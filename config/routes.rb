	Rails.application.routes.draw do
  get 'errors/not_found'

  resources :sale_details

  resources :sales

  resources :icecreams

  post "/add" => 'shopping_cart#add_to_cart'
  post "/drop" => 'shopping_cart#drop_current_shopping_cart'
  post "/remove" => 'shopping_cart#remove_item_from_cart'
        
  get "/current_cart" => 'shopping_cart#get_current_cart'
  get "/finish_sale" => 'shopping_cart#finish_current_sale'

  get '/buy_from_us' => "icecreams#index", as: :user_root
  
  get '/api/public/u/:id' => 'users#fetch_data'
        
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users

  get '*a' => 'errors#not_found'
end
