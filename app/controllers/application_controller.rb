class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_breadcrumb 'トップ', :posts_path

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email])
    end
end
