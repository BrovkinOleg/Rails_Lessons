class Test < ApplicationRecord

  def self.tests_array_show(category)
    my_array = Test.where('title == ?', category)
    my_array.order('id DESC')
  end
end
