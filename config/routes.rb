Rails.application.routes.draw do
  resources :sale_details

  resources :sales

  resources :icecreams

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users
end
