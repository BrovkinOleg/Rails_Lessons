class Test < ApplicationRecord
  belongs_to :category
  belongs_to :admin, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true,
                    uniqueness: { scope: :level, message: 'Only one test with this name and level' }

  scope :easy, -> { where(level: [0, 1]) }
  scope :middle, -> { where(level: 2..4) }
  scope :heavy, -> { where(level: 5..Float::INFINITY) }
  scope :my_order, -> { order(id: :desc).pluck(:title) }
  scope :tests_array_show, ->(category) { joins(:category).where(categories: { title: category }).my_order }
end
