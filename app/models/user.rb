class User < ApplicationRecord
  has_many :tests

  def tests_list_show(level)
    sql = 'JOIN users_tests ON tests.id = users_tests.tests_id'
    Test.joins(sql).where(level: level, users_tests: { users_id: id })
  end
end
