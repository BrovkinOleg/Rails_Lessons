class Admin < User

  validates :first_name, :last_name, presence: true
  has_many :tests, foreign_key: :admin_id, dependent: :destroy

end
