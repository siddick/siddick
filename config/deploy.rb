set :application, "siddick"
set :repository,  "git://github.com/siddick/siddick.git"
set :scm, :git

set :stages, ["staging", "production"]
set :default_stage, "staging"

set :use_sudo, false
set :bundle_exec, "cd #{current_path}; bundle exec"
set :thin, "#{bundle_exec} thin -C #{shared_path}/thin.conf"
set :rake, "#{bundle_exec} rake"

namespace :deploy do
  task :assets do
    run "#{rake} assets:precompile"
  end
  task :start do
    run "#{thin} start"
  end
  task :stop do
    run "#{thin} stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{thin} restart"
  end
  tast :thin do
    run "#{thin} config -p 3000"
  end
end
