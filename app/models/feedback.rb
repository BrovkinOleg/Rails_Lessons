# class Feedback < ApplicationRecord
class Feedback
  include ActiveModel::Validations
  include ActiveModel::Model

  attr_accessor :feedback_email, :body, :email
  validates :feedback_email, :body, :email, presence: true

  def id
    @messages
  end
end
