# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "lucid32"

  config.vm.host_name = "blog.l.siddick.com"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [ "cookbooks", "#{ENV['HOME']}/cookbooks" ]
    chef.log_level = :debug
    chef.add_recipe "siddick"
  end

end
