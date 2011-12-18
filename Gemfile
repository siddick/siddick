source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'devise'
gem 'activeadmin'
gem 'sass-rails',   '~> 3.1.4'
gem 'friendly_id',  '>= 4.0.0.beta14'
gem 'redcarpet',    '>= 2.0.0'
gem 'paperclip'
gem 'resque', :require => "resque/server"

group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier',     '>= 1.0.3'
end
gem 'jquery-rails'

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'rcov', :require => false
  gem 'guard-rspec'
  gem 'spork', '>= 0.9.0.rc9'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'guard-spork'
end

group :production do
  gem 'pg'
  gem 'dalli'
  gem 'aws-sdk'
end

group :extra do
  gem 'thin'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'foreman'
end
