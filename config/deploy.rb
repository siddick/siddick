set :application, "siddick"
set :repository,  "git://github.com/siddick/siddick.git"
set :scm, :git

set :user, "apps"
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :use_sudo, false

set :bundle_exec, lambda{ "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec" } 
set :thin_exec,   lambda{ "#{bundle_exec} thin -C #{shared_path}/thin.conf" }
set :rake_exec,   lambda{ "#{bundle_exec} rake" }

namespace :deploy do
  task :start do
    run "#{rake_exec} sunspot:solr:start"
    run "#{thin_exec} start"
  end
  task :stop do
    run "#{thin_exec} stop"
    run "#{rake_exec} sunspot:solr:stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    deploy.stop
    deploy.start
  end
  task :thin do
    run "thin config -S #{shared_path}/web.socket -e #{default_stage} -c #{current_path}"
  end
end

namespace :rails do
  task :log do
    run "tail -f #{current_path}/log/production.log"
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
end
before "deploy:assets:precompile", "deploy:assets:create_directory"
before "bundle:install", "deploy:default_setup"
