include_recipe "apt"
include_recipe "rvm::ruby_193"
include_recipe "nodejs"
include_recipe "nginx"
include_recipe "postgresql::server"

# Variables
shared_path  = "/a/apps/#{node[:siddick][:name]}/shared"
current_path = "/a/apps/#{node[:siddick][:name]}/current"

user node[:siddick][:user] do
  home  "/a/apps"
  shell "/bin/bash"
end

[ "tmp", "log", "assets", "solr" ].each do |dir_name|
  directory "#{shared_path}/#{dir_name}" do
    owner node[:siddick][:user]
    recursive true
  end
end

group "rvm" do
  action  :modify
  members [ "apps" ]
  append  true
end

execute "createuser apps --createdb --createrole --no-superuser" do
  user "postgres"
  ignore_failure true
end

gem_package "bundler"

deploy "/a/apps/#{node[:siddick][:name]}" do
  repo node[:siddick][:repo]
  user node[:siddick][:user]
  environment "RAILS_ENV" => node[:siddick][:env]
  migrate true
  migration_command "bundle && bundle exec rake db:create && bundle exec rake db:migrate"
  before_migrate "script/setup"
  create_dirs_before_symlink []
  symlink_before_migrate({})
  symlinks "tmp" => "tmp", "log" => "log", "assets" => "public/assets", "solr" => "solr"
end

execute "bundle exec rake assets:precompile" do
  user node[:siddick][:user]
  cwd current_path
end

script "Install startup scripts" do
  interpreter "bash"
  cwd current_path
  code <<-CODE
    echo 'RAILS_ENV=#{node[:siddick][:env]}' > #{shared_path}/env
    bundle exec foreman export upstart /etc/init/ -f Procfile.deploy \
      -e #{shared_path}/env -u #{node[:siddick][:user]} -a #{node[:siddick][:name]} \
      -l #{shared_path}/log -d #{current_path}
  CODE
end

execute "service #{node[:siddick][:name]} restart"
