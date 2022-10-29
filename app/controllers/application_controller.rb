class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    dash_boards_path(resource)
  end

  def after_update_path_for(resource)
    root_url
  end

  def configure_permitted_parameters  
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
