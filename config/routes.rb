Rails.application.routes.draw do

  devise_for :users, :controllers => {
  	:registrations => 'users/registrations'} 
  
  # devise_scope :user do
  #   get 'users/:id/edit' => 'users/registrations#edit', :as => :edit_user_registration_admin
  # end

  resources :users, :only => [:index, :show]

  resources :posts

  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
