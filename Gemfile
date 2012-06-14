source 'https://rubygems.org'

gem 'rails', '3.2.5'
gem 'devise'
gem 'activeadmin',  '>= 0.4.0'
gem 'sass-rails',   '~> 3.2.0'
gem 'friendly_id'
gem 'redcarpet'
gem 'coderay'
gem 'paperclip'
gem 'simple_form'
gem 'acts-as-taggable-on'
gem 'video_info'
gem 'recaptcha', :require => 'recaptcha/rails'

group :assets do
  gem 'coffee-rails', '~> 3.2.0'
  gem 'uglifier',     '>= 1.0.3'
  gem 'compass-rails'
  gem 'twitter-bootstrap-rails'
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
  gem 'dalli'
  gem 'aws-sdk'
end

group :extra do
  gem 'thin'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano'
  gem 'foreman'
end
