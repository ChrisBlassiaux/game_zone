class Park < ApplicationRecord
  validates :first_part_schedules, presence: true
  validates :second_part_schedules, presence: true
  validates :last_part_schedules, presence: true

  has_many :attractions
  has_many :news
end
