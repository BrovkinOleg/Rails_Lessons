class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :answers_number

  scope :right_answer, -> { where(correct: true) }

  private

  def answers_number
    count = question.answers.count
    errors.add(:question, 'wrong number of answers') unless (1..4).include?count
  end
end
