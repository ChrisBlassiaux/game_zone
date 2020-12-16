class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates :name, presence: true, length: {within: 2..40}
  validates :unit_price_ht, presence: true
  validates :unit_price_ttc, presence: true
  validates :tva, presence: true

  has_one_attached :picture
  has_many :order_items
end
