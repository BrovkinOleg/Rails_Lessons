class Test < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  def self.tests_array_show(category)
    sql = 'JOIN categories ON categories.id = tests.categories_id'
    joins(sql).where(categories: { title: category }).order('tests.id DESC').pluck(:title)
  end
end
