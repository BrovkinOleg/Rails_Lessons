class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :log_out

  protected

  def configure_permitted_parameters
    attributes = %i[first_name last_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  private

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

