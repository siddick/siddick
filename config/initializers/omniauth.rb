Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :twitter,   ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']   if ENV['TWITTER_KEY'].present?
  provider :facebook,  ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'] if ENV['FACEBOOK_KEY'].present?
end
