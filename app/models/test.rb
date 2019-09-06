class Test < ApplicationRecord
  belongs_to :category
  belongs_to :admin, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  def self.tests_array_show(category)
    joins(:category).where(categories: { title: category }).order(id: :desc).pluck(:title)
  end
end
