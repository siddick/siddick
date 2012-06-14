if ENV['AWS_ACCESS_KEY_ID'] and ENV['AWS_SECRET_ACCESS_KEY']
  Siddick::Application.config.action_mailer.delivery_method = :amazon_ses
end
