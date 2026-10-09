class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  layout :layout_by_resource
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :banned, :institution])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :banned])
  end

  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end 
  end
end
