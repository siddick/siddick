set :application, "siddick"
set :repository,  "git://github.com/siddick/siddick.git"
set :scm, :git

set :user, "apps"
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :use_sudo, false

set :bundle_exec, lambda{ "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec" }
set :rake_exec,   lambda{ "#{bundle_exec} rake" }

set :rvm_type, :system

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
    run "test -f #{shared_path}/env || echo -e 'RAILS_ENV=#{rails_env}' > #{shared_path}/env"
    deploy.stop
    run "cd #{current_path}; rvmsudo bundle exec foreman export upstart /etc/init -f Procfile -e #{shared_path}/env -u #{user} -a #{application} -l #{shared_path}/log -d #{current_path} -c web=1 -p #{deploy_port}"
    deploy.start
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
  task :create_directories do
    run "mkdir -p #{shared_path}/assets #{shared_path}/log"
    run "rm -rf #{release_path}/public/assets #{release_path}/log; true"
    run "ln -sfT #{shared_path}/assets #{release_path}/public/assets"
    run "ln -sfT #{shared_path}/log #{release_path}/log"
  end
end
before "bundle:install", "deploy:create_directories"
before "bundle:install", "deploy:default_setup"
