EC2 = ENV["EC2"] || "siddick.in"
server EC2, :app, :web, :db, :primary => true
set :deploy_to, "/u/apps/siddick"