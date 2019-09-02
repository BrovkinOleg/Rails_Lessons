class User < ApplicationRecord

  # def tests_list_show(complexity_level)
  #   test_array = Test.where('level == ?', complexity_level)
  #   test_titles = []
  #   test_array.each do |test|
  #     test_titles << test.title.to_s + '_' + test.level.to_s
  #   end
  #   puts "Tests list for complexity_level = #{complexity_level} :"
  #   puts test_titles
  # end
  def tests_list_show(complexity_level)
    Test.where('level == ?', complexity_level)
  end
end
