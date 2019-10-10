# class Feedback < ApplicationRecord
class Feedback
  include ActiveModel::Validations
  include ActiveModel::Model

  attr_accessor :body, :email
  validates :body, :email, presence: true

  def id
    @messages
  end
end
