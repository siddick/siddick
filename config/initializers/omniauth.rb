OmniauthProviders = {
    :twitter  => { :auto_publish_scope => "" },
    :facebook => { :auto_publish_scope => "" },
    :github   => {} }
Rails.application.config.middleware.use OmniAuth::Builder do
  OmniauthProviders.each do |name, options|
    config_name = name.upcase
    provider name, ENV["#{config_name}_KEY"], ENV["#{config_name}_SECRET"] if ENV["#{config_name}_KEY"].present?
  end
end
