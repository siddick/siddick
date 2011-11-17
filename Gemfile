source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'devise'
gem 'activeadmin'
gem 'sass-rails',   '~> 3.1.4'
gem 'friendly_id',  '>= 4.0.0.beta14'
gem 'redcarpet',    '>= 2.0.0b5'
gem 'paperclip'

group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'sqlite3'
end

group :production do
  gem 'thin', :platforms => :ruby, :require => false
  gem 'pg'
  gem 'memcache-client'
end
