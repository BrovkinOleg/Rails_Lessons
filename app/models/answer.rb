class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  scope :right_answer, -> { where(correct: true) }
end
