Rails.application.routes.draw do

  resources :categories
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations'} 

  get '/users/menu' => 'users#menu', as: 'menu'
  resources :users, :only => [:index, :show]

  resources :posts do
    resources :orders, :only => [:new, :create, :edit, :update, :destroy]
  end

  root 'posts#index'
  get '/orders' => 'orders#index', as: 'orders'
  get '/orders/:id' => 'orders#show', as: 'order'
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
