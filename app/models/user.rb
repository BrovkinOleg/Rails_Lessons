class User < ApplicationRecord

  def tests_list_show(complexity_level)
    Test.where('level == ?', complexity_level)
  end
end
