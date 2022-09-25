class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :name, :address, :age, :my_favorite, :live_stance, :status, :icon_image, :user])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password, :name])
  end


end
