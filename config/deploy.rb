set :application, "siddick"
set :repository,  "git://github.com/siddick/siddick.git"
set :scm, :git

set :user, "apps"
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :use_sudo, false

set :bundle_exec, lambda{ "cd #{current_path}; bundle exec" } 
set :thin_exec,   lambda{ "#{bundle_exec} thin -C #{shared_path}/thin.conf" }
set :rake_exec,   lambda{ "#{bundle_exec} rake" }

namespace :deploy do
  task :start do
    run "#{thin_exec} start"
  end
  task :stop do
    run "#{thin_exec} stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{thin_exec} restart"
  end
  task :thin do
    run "thin config -S #{shared_path}/web.socket -e #{default_stage} -c #{current_path}"
  end
end

namespace :deploy do
  namespace :assets do
    task :create_directory do
      run "mkdir -p #{shared_path}/assets"
      run "ln -sfT #{shared_path}/assets #{release_path}/public/assets"
    end
  end
end
before "deploy:assets:precompile", "deploy:assets:create_directory"