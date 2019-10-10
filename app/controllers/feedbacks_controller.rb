class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @feedback = Feedback.new(body: 'your question', email: 'test@guru.com')
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @email = current_user.email unless @current_user.nil?
    if @feedback.valid?
      FeedbackMailer.send_feedback(@feedback, @email).deliver_now
      redirect_to root_path, alert: t('.success')
    else
      render :new, alert: t('.failed')
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body, :email)
  end
end
