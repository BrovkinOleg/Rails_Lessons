class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :answers_number

  scope :correct, -> { where(correct: true) }

  private

  def answers_number
    errors.add(:question, 'wrong number of answers') if question.answers.count >= 4
  end
end
