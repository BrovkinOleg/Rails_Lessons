class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  protect_from_forgery with: :exception

  helper_method :log_out

  private

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
