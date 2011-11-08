require 'aws/ec2'

Capistrano::Configuration.instance.load do

  set :aws_key,     lambda{ ENV["AWS_KEY"] || abort("Need AWS_KEY and AWS_SECRET") }
  set :aws_secret,  lambda{ ENV["AWS_SECRET"] || abort("Need AWS_KEY and AWS_SECRET") }
  
  set :ec2,           lambda{ AWS::EC2.new( :access_key_id => aws_key, :secret_access_key => aws_secret ) }
  set :ec2_ami,       "ami-bbf539d2"
  set :ec2_name_key,  "capistrano-app"
  set :ec2_name,      lambda{ fetch(:application) }
  set :ec2_role_key,  "capistrano-role"
  set :ec2_filter,    lambda{ fetch(:ec2).instances.tagged(ec2_name_key).tagged_values(ec2_name) }
  
  namespace :ec2 do
    desc "Find the EC2 instances"
    task :find do
      STDERR.puts("Application: #{application}")
      ec2_filter.each{|instance|
        STDERR.puts("Server: #{instance.ip_address} = #{instance.tags[ec2_role_key]}")
        server( instance.ip_address, *instance.tags[ec2_role_key].split(",") )
      }
    end
    desc "Create EC2 instances"
    task :create do
      roles = (ENV["ROLE"] || "web,app,db").split(",").uniq
      instance = fetch(:ec2).instances.create( :image_id => ec2_ami )
      instance[ec2_name_key] = ec2_name
      instance[ec2_role_key] = roles.join(",")
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
  
  after "multistage:ensure", "ec2:find"
  
end
