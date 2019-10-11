class Badge < ApplicationRecord
  BADGES_AWARD =
    {
      category_complete: 'Passing all tests of the category',
      first_try: 'Passing the test on the first try',
      level_complete: 'Passing all tests of a certain level'
    }.freeze

  has_many :users_badges
  has_many :users, through: :users_badges
  validates :title, :image, presence: true
end
