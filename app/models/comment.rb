class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  validates :content, presence: true
end
