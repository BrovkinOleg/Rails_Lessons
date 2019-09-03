class User < ApplicationRecord

  def tests_list_show(complexity_level)
    sql = 'JOIN users ON users.id = tests.users_id'
    Test.joins(sql).where(level: complexity_level, users_id: id)
  end
end
