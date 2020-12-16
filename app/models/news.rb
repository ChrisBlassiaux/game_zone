class News < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :description, presence: true
  
  belongs_to :park

  has_one_attached :picture
end
