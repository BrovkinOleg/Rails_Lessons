class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', foreign_key: :admin_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, :email, presence: true

  def tests_list_show(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
