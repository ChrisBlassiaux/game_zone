class Attraction < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :park
end
