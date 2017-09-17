class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

<<<<<<< HEAD
  add_breadcrumb 'トップ', :posts_path

=======
>>>>>>> e5de3266dfaed05c7acf7cc7be1b9c78a201aaa4
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email]) << :admin
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email]) << :admin
    end
end
