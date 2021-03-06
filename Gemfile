source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails', '3.2.12'
gem 'devise'
gem 'sass-rails',   '~> 3.2.0'
gem 'friendly_id'
gem 'redcarpet'
gem 'coderay'
gem 'paperclip'
gem 'simple_form'
gem 'acts-as-taggable-on'
gem 'video_info'
gem 'recaptcha', :require => 'recaptcha/rails'
gem 'will_paginate', '~> 3.0'

gem 'less-rails'
gem 'haml-rails'

gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'rest-client'

gem 'dalli'
gem 'twitter-bootstrap-rails'

group :assets do
  gem 'coffee-rails', '~> 3.2.0'
  gem 'uglifier',     '>= 1.0.3'
  gem 'compass-rails'
  gem 'therubyracer'
end
gem 'jquery-rails'

group :test, :development do
  gem 'progress_bar'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'simplecov', :require => false
  gem 'guard-rspec'
  gem 'spork', '>= 0.9.0.rc9'
  gem 'guard-spork'
end

group :production, :staging do
  gem 'pg'
  gem 'aws-sdk'
end

group :extra do
  gem 'thin'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano'
  gem 'foreman'
end
