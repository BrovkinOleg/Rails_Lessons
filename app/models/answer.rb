class Answer < ApplicationRecord
  belongs_to :question

  scope :right_answer, -> { where(correct: true) }
end
