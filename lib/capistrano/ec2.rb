require 'aws/ec2'

Capistrano::Configuration.instance.load do

  # AWS authentication information
  set :aws_key,     lambda{ ENV["AWS_KEY"] || abort("Need AWS_KEY and AWS_SECRET") }
  set :aws_secret,  lambda{ ENV["AWS_SECRET"] || abort("Need AWS_KEY and AWS_SECRET") }

  # EC2 instance
  set :ec2_ami,           "ami-a7f539ce"
  set :ec2_instance_type, "t1.micro"
  set :ec2_key_pair,      lambda{ ec2_object.key_pairs.first.name }

  # EC2 tags
  set :ec2_name_key,      "Name"
  set :ec2_name,          lambda{ fetch(:application) }
  set :ec2_role_key,      "Role"
  set :ec2_role,          "web,app,db"

  # EC2 objects
  set :ec2_object, lambda{ AWS::EC2.new( :access_key_id => aws_key, :secret_access_key => aws_secret ) }
  set :ec2_filter, lambda{ ec2_object.instances.tagged(ec2_name_key).tagged_values(ec2_name) }

  namespace :ec2 do

    desc "Find the EC2 instances"
    task :find do
      unless @ec2_find_already_executed
        puts("Application: #{application}")
        ec2_filter.each{|instance|
          puts("Server: #{instance.ip_address} = #{instance.tags[ec2_role_key]}")
          roles = ( instance.tags[ec2_role_key] || ec2_role ).split(",")
          server( instance.ip_address, *roles, :primary => true )
        }
        @ec2_find_already_executed = true
      end
    end

    desc "Create EC2 instances"
    task :create do
      roles = (ENV["ROLE"] || ec2_role).split(",").uniq
      instance = ec2_object.instances.create( :image_id => ec2_ami,
        :instance_type => ec2_instance_type, :key_pair => ec2_key_pair )
      instance.tags[ec2_name_key] = ec2_name
      instance.tags[ec2_role_key] = roles.join(",")
      server( instance.ip_address, :new_machine, *roles )
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

  #before "deploy", "ec2:find"
  after "multistage:ensure", "ec2:find"

end
