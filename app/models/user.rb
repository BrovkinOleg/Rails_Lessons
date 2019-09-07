class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :admin_id, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  validates :name, :email, presence: true

  scope :tests_list_show, ->(level) { Test.where(level: level) }
end
