class Badge < ApplicationRecord
  RULES = [
    ['Passing all tests of the category', 1],
    ['Passing one test on the first step', 2],
    ['Passing all tests of a certain level', 3]
  ].freeze

  has_many :users_badges
  has_many :users, through: :users_badges
  validates :title, :image, presence: true

  def self.images
    images_path = 'app/assets/images/'
    badges = Dir.glob("#{images_path}badges/*")
    badges.map do |badge_path|
      badge_path.gsub(images_path, '')
    end
  end
end
