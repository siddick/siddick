set :application, "siddick"
set :repository,  "git://github.com/siddick/siddick.git"
set :scm, :git

set :user, "apps"
set :stages, ["staging", "production"]
set :default_stage, "staging"

set :use_sudo, false
set :bundle_exec, "cd #{current_path}; bundle exec"
set :thin_exec, "#{bundle_exec} thin -C #{shared_path}/thin.conf"
set :rake, "#{bundle_exec} rake"

namespace :deploy do
  task :assets do
    run "#{rake} assets:precompile"
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
    run "#{thin_exec} config -p 3000"
  end
end
