class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new(title: 'your topic', body: 'your question', email: 'test@guru.com')
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, alert: t('.success')
    else
      render :new, alert: t('.failed')
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body, :email)
  end
end
