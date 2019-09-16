class Question < ApplicationRecord
  belongs_to :test
  has_many :test_passages
  has_many :answers, dependent: :destroy
  validates :body, presence: true
end
