class FeedbackMailer < ApplicationMailer
  default to: 'dmlboxline@kaluga.ru'

  def send_feedback(feedback)
    @subject = feedback.title
    @message = feedback.body
    mail from: feedback.email, subject: @subject, body: @message
  end
end
