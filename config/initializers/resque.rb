resque_config = YAML.load_file(File.join(Rails.root, '/config/resque.yml'))[Rails.env]
if resque_config.present?
  resque_config.symbolize_keys!
  Resque.redis = resque_config[:redis]
  Resque.redis.namespace = resque_config[:namespace]
end


# Resque.after_fork do |job|
Resque.before_first_fork do
  # Preload
  ActiveRecord::Base.establish_connection
  GenerateContent.markdown
end

