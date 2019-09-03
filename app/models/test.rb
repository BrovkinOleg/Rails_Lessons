class Test < ApplicationRecord

  def self.tests_array_show(category)
    sql = 'JOIN categories ON categories.id = tests.categories_id'
    joins(sql).where('categories.title = :cat', cat: category).order('tests.id DESC').pluck(:title)
  end
end
