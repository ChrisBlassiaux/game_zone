class Park < ApplicationRecord
  validates :opening_times, presence: true
  validates :closing_times, presence: true

  has_many :attractions
  has_many :news
end
