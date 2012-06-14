if ENV['RECAPTCHA_PUBLIC_KEY'].present? and  ENV['RECAPTCHA_PRIVATE_KEY'].present?
  Recaptcha.configure do |config|
    config.public_key  = ENV['RECAPTCHA_PUBLIC_KEY']
    config.private_key = ENV['RECAPTCHA_PRIVATE_KEY']
  end
end
