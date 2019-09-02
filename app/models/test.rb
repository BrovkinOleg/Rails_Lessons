class Test < ApplicationRecord

  def self.tests_array_show(category)
    line = Category.find_by(title: category)
    puts 'Find tests for' + line.title
    array = Test.where('categories_id == ?', line.id)
    array = array.order('id DESC')
    test_titles = []
    array.each { |test| test_titles << test.title + ' ' + test.level.to_s }
    puts test_titles
  end
end
