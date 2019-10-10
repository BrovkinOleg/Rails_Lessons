class FeedbackMailer < ApplicationMailer
  default to: 'dmlboxline@kaluga.ru'

  def send_feedback(feedback, user_email)
    mail from: feedback.email, subject: user_email, body: feedback.body
  end
end
