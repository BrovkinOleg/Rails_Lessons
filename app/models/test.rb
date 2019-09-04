class Test < ApplicationRecord
  has_many :questions
  belongs_to :user

  def self.tests_array_show(category)
    sql = 'JOIN categories ON categories.id = tests.categories_id'
    joins(sql).where(categories: { title: category }).order('tests.id DESC').pluck(:title)
  end
end
