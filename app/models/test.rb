class Test < ApplicationRecord
  has_many :questions
  # has_many :tests_users
  # has_many :users, through: :tests_users
  has_and_belongs_to_many :users
  belongs_to :user

  def self.tests_array_show(category)
    sql = 'JOIN categories ON categories.id = tests.categories_id'
    joins(sql).where(categories: { title: category }).order('tests.id DESC').pluck(:title)
  end
end
