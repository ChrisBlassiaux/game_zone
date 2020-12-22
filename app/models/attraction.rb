class Attraction < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :park

  has_many_attached :pictures
  has_many :comments
end