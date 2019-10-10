# class Feedback < ApplicationRecord
class Feedback
  include ActiveModel::Validations
  include ActiveModel::Model

  attr_accessor :title, :body, :email
  validates :title, :body, :email, presence: true

  def id
    @messages
  end
end
