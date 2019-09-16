class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  # belongs_to :current_question
  belongs_to :question
end
