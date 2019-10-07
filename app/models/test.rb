class Test < ApplicationRecord

  belongs_to :category
  belongs_to :admin, class_name: 'User'
  has_many :questions, dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true,
                    uniqueness: { scope: :level, message: 'Only one test with this name and level' }

  scope :easy, -> { where(level: [0, 1]) }
  scope :middle, -> { where(level: 2..4) }
  scope :heavy, -> { where(level: 5..Float::INFINITY) }
  scope :tests_scope, ->(category) { joins(:category).where(categories: { title: category }) }

  def self.tests_array_show(category)
    tests_scope(category).order(id: :desc).pluck(:title)
  end
end
