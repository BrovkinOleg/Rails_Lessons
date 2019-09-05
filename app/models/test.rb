class Test < ApplicationRecord
  has_many :questions
  belongs_to :user
  belongs_to :category
  # has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.tests_array_show(category)
    sql = 'JOIN categories ON categories.id = tests.categories_id'
    joins(sql).where(categories: { title: category }).order('tests.id DESC').pluck(:title)
  end
end
