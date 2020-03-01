Cloudinary.config do |config|
  config.cloud_name = 'dytrrl7hj'
  config.api_key = ENV['CLOUDINARY_API']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
  config.secure = true
  config.cdn_subdomain = true
end
