class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :url, presence: true

  def gist_hash
    self.gist_url.split('/')[-1]
  end
end
