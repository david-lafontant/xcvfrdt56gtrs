class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception
  check_authorization unless: :devise_controller?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :role, :banned, :institution ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :role, :banned ])
  end

  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      redirect_to sign_in_url, alert: 'You have to log in to continue.'
    else
      respond_to do |format|
        format.json { render nothing: true, status: :not_found }
        format.html { redirect_to main_app.root_url, alert: "access denied" }
        format.js { render nothing: true, status: :not_found }
      end
    end
  end
  
end
