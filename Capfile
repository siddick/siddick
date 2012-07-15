load 'deploy' if respond_to?(:namespace) # cap2 differentiator

# Uncomment if you are using Rails' asset pipeline
# load 'deploy/assets' unless ENV['DONOT_COMPILE_ASSETS']

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks
load "deploy/assets"

require 'bundler/capistrano'
$LOAD_PATH.push('./lib')
require 'capistrano/ec2' if ENV['AWS_KEY'] and ENV['AWS_SECRET']
require 'capistrano/ext/multistage'
require 'rvm/capistrano'
