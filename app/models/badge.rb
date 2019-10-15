class Badge < ApplicationRecord

  RULES_NAME = %w[success_category success_on_first_try success_all_level].freeze

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
