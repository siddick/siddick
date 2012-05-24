
namespace :heroku do

  task :compile_assets do
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

  task :deploy => :compile_assets_on_heroku do
    system <<-SYSTEM
      git push heroku heroku:master
    SYSTEM
  end

  task :deploy_code do
    system("git checkout heroku") || abort("Please correct the problem")
    system <<-SYSTEM
      git merge master
      git push heroku heroku:master
      git checkout master
    SYSTEM
  end

end
