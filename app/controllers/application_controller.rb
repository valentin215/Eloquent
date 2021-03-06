class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end

# this to redirect to make profile after signing up
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_inactive_sign_up_path_for(resource)
    edit_user_path(current_user)
  end

  def after_sign_up_path_for(resource)
    edit_user_path(current_user)
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

end
