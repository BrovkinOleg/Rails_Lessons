class Test < ApplicationRecord

  def self.tests_array_show(category)
    Test.where('title == ?', category).order('id DESC')
  end
end
