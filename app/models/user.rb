class User < ApplicationRecord

  def tests_list_show(level)
    sql = 'JOIN users_tests ON tests.id = users_tests.tests_id'
    Test.joins(sql).where('level = :lev AND users_tests.users_id = :sym', lev: level, sym: id)#.pluck(:title)
  end
end
