class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:current_url]
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def store_location
    cookies[:current_url] = request.original_url if request.get?
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
