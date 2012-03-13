set :application, "siddick"
set :repository,  "git://github.com/siddick/siddick.git"
set :scm, :git

set :user, "apps"
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :use_sudo, false

set :bundle_exec, lambda{ "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec" }
set :rake_exec,   lambda{ "#{bundle_exec} rake" }

namespace :deploy do
  task :start do
    run "sudo service #{application} start"
  end
  task :stop do
    run "sudo service #{application} stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo service #{application} restart"
  end
  task :service do
    run "echo 'RAILS_ENV=#{rails_env}' > #{shared_path}/env"
    run "cd #{current_path}; sudo bundle exec foreman export upstart /etc/init/ -f Procfile.deploy -e #{shared_path}/env -u #{user} -a #{application} -l #{shared_path}/log -d #{current_path}"
  end
end

namespace :rails do
  task :log do
    run "tail -f #{current_path}/log/#{rails_env}.log"
  end
end

namespace :deploy do
  task :default_setup do
    run "cd #{release_path}; ruby script/setup"
  end
  namespace :assets do
    task :create_directory do
      run "mkdir -p #{shared_path}/assets"
      run "ln -sfT #{shared_path}/assets #{release_path}/public/assets"
    end
  end
  task :solr do
    task :create_directory do
      run "mkdir -p #{shared_path}/solr"
      run "ln -sfT #{shared_path}/solr #{release_path}/solr"
    end
  end
end
before "deploy:assets:precompile", "deploy:assets:create_directory"
before "deploy:assets:precompile", "deploy:solr:create_directory"
before "bundle:install", "deploy:default_setup"
