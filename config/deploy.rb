set :application, "siddick"
set :repository,  "git://github.com/siddick/siddick.git"
set :scm, :git

set :user, "apps"
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :use_sudo, false

def bundle_exec; "cd #{current_path}; bundle exec"; end
def thin_exec; "#{bundle_exec} thin -C #{shared_path}/thin.conf"; end
def rake_exec; "#{bundle_exec} rake"; end

namespace :deploy do
  task :assets do
    run "mkdir -p #{shared_path}/assets"
    run "ln -sfT #{shared_path}/assets #{current_path}/public/assets"
    run "#{rake_exec} assets:precompile"
  end
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
    run "#{thin_exec} config -S #{shared_path}/thin.socket -e #{default_stage} -c #{current_path}"
  end
end

after "deploy:symlink", "deploy:assets"
