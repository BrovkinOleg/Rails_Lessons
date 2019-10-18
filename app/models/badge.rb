class Badge < ApplicationRecord

  RULES_NAME = %w[success_category
                  success_on_first_try
                  success_all_level].freeze

  has_many :users_badges
  has_many :users, through: :users_badges
  validates :title, :image, presence: true

  def get_title(param)
    case param
    when 'success_category' then '.text1'
    when 'success_on_first_try' then '.text2'
    when 'success_all_level' then '.text3'
    end
  end

  def self.images
    images_path = 'app/assets/images/'
    badges = Dir.glob("#{images_path}badges/*")
    badges.map do |badge_path|
      badge_path.gsub(images_path, '')
    end
  end
end
