class Avatar < ApplicationRecord
  validates :url, format: { with: /(https?|ftp|ssh|mailto):\/\/[a-z0-9\/:%_+.,#?!@&=-]+/,
    message: "This is not an URL!" }
end
