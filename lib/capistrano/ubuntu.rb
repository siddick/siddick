Capistrano::Configuration.instance.load do
  
  set :default_gems,  "bundler foreman"
  set :postgresql_packages, "postgresql"
  namespace :ubuntu do
    task :postgresql, :roles => :db do
      run "sudo apt-get install #{postgresql_packages}"
    end
  end
end