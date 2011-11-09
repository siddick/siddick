Capistrano::Configuration.instance.load do
  
  set :default_rubygems,        "bundler foreman"
  set :default_ubuntu_packages, [ "language-pack-en-base", 
    "build-essential libreadline6-dev libssl-dev sqlite3 libsqlite3-dev libxml2-dev git git-core " +
    "memcached libmemcached-dev libcurl4-openssl-dev imagemagick nodejs s3cmd libxslt1-dev " + 
    "libffi-dev libyaml-dev libpq-dev" ]
  set :default_db_packages,     "postgresql"
  
  namespace :ubuntu do
    task :postgresql, :roles => :db do
      run "sudo apt-get install #{postgresql_packages}"
    end
  end
end