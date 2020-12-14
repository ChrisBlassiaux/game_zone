class Avatar < ApplicationRecord
  validates :url, presence: true, format: { with: /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/ }
end
