source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'devise'
gem 'activeadmin'
gem 'sass-rails',   '~> 3.1.4'
gem 'friendly_id'
gem 'redcarpet'
gem 'coderay'
gem 'paperclip'
gem 'simple_form'
gem 'acts-as-taggable-on'
gem 'resque', :require => 'resque/server'

gem 'sunspot_rails'
gem 'sunspot_solr'

group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier',     '>= 1.0.3'
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
  gem 'rb-inotify'
  gem 'libnotify'
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
  gem 'foreman'
end
