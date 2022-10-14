class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  # before_action :current_user
  before_action :authenticate_user!

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :photo, :bio, :password, :password_confirmation, :avatar)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :photo, :bio, :password, :current_password, :avatar)
    end
  end
end
