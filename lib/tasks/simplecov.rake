namespace :spec do
  desc "Simplecov"
  task :simplecov do
    require 'simplecov'
    SimpleCov.start
    Rake::Task["spec"].invoke
  end
end
