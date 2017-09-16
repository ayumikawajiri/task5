Rails.application.routes.draw do

<<<<<<< HEAD
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations'} 
  
  # devise_scope :user do
  #   get 'users/:id/edit' => 'users/registrations#edit', :as => :edit_user_registration_admin
  # end

=======
  devise_for :users
>>>>>>> e5de3266dfaed05c7acf7cc7be1b9c78a201aaa4
  resources :users, :only => [:index, :show]

  resources :posts

  root 'posts#index'
<<<<<<< HEAD

=======
>>>>>>> e5de3266dfaed05c7acf7cc7be1b9c78a201aaa4
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
