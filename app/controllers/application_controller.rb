class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?,
                :log_out

  private

  # def authenticate_user!
  #   unless current_user
  #     cookies[:path] = request.fullpath
  #     redirect_to login_path#, alert: 'Are you Guru? Verify your email and password please!'
  #   end
  # end

  def authenticate_user!
    unless current_user
      # redirect_to login_path, flash[:alert] = 'Verify your Email and Password please'
      redirect_to login_path, alert: 'Verify your Email and Password please'
    end

    # cookies[:email] = current_user.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    @current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
