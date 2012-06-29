OmniauthProviders = []

Rails.application.config.middleware.use OmniAuth::Builder do
  [ :twitter, :facebook, :github ].each do |name|
    config_name = name.upcase
    if ENV["#{config_name}_KEY"].present?
      provider name, ENV["#{config_name}_KEY"], ENV["#{config_name}_SECRET"]
      OmniauthProviders.push(name)
    end
  end
end
