#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Siddick::Application.load_tasks

task :compile_assets_on_heroku do

  system("git checkout heroku") || abort("Please correct the problem")
  system <<-SYSTEM
    git merge master
    git rm public/assets -fr
    bundle exec rake assets:precompile
    git add public/assets -f
    git commit -m "Update assets" public/assets
    git checkout master
  SYSTEM
end

task :deploy_on_heroku => :compile_assets_on_heroku do
  system <<-SYSTEM
    git push heroku heroku:master
  SYSTEM
end
