class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :log_out

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(user)
    # flash[:greeting] = "Welcome, #{user.full_name}"
    if user.admin?
      admin_tests_path
    else
      tests_path
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

