Cloudinary.config do |config|
  config.cloud_name = 'gamezonestorage'
  config.api_key = ENV['CLOUDINARY_KEY']
  config.api_secret = ENV['CLOUDINARY_SECRET']
  config.secure = true
  config.cdn_subdomain = true
end