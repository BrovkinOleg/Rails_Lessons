class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', foreign_key: :admin_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :feedbacks

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def tests_list_show(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    if first_name.nil? || last_name.nil?
      " Anonimous "
    else
    " #{first_name.capitalize} #{last_name.capitalize} "
    end
  end
end
