class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  def tests_list_show(level)
    # sql = 'JOIN users_tests ON tests.id = users_tests.tests_id'
    # Test.joins(sql).where(level: level, users_tests: { users_id: id })
    Test.where(level: level, users_tests: { users_id: id })
  end
end
