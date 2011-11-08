require 'aws/ec2'

Capistrano::Configuration.instance.load do

  set :aws_key,     lambda{ ENV["AWS_KEY"] || raise("Need AWS_KEY and AWS_SECRET") }
  set :aws_secret,  lambda{ ENV["AWS_SECRET"] || raise("Need AWS_KEY and AWS_SECRET") }
  
  set :ec2,         lambda{ AWS::EC2.new( :access_key_id => aws_key, :secret_access_key => aws_secret ) }
  set :ec2_ami,     "ami-a6f7c5d2"
  set :ec2_appname, lambda{ fetch(:application) }
  set :ec2_filter,  lambda{ fetch(:ec2).instances.tagged("capistrano-app").tagged_values(ec2_appname) }
  set :ec2_tags,    lambda{|roles| { "capistrano-app" => application, "capistrano-role" => roles.join(",") } }
  
  namespace :ec2 do
    desc "Find the Ec2 instances"
    task :find do
      STDERR.puts("Application: #{application}")
      ec2_filter.each{|instance|
        STDERR.puts("Server: #{instance.ip_address} = #{instance.tags["capistrano-role"]}")
        server( instance.ip_address, *instance.tags["capistrano-role"].split(",") )
      }
    end
    task :create do
      roles = (ENV["ROLE"] || "web,app,db").split(",")
      instance = ec2.instances.create( :image_id => ec2_ami ) 
      ec2_tags(roles).each{|key,value| instance.tags[key] = value }
      server( instance.ip_address, *roles )
    end
    task :destroy do
      ec2_filter.each{|instance|
        instance.destroy()
      }
    end
    task :stop do
      ec2_filter.each{|instance|
        instance.stop()
      }
    end
  end
  
  before "deploy", "ec2:find"
  
end
