class AuthProvider < ActiveRecord::Base

  AutoPublish = { :facebook => { :scope => "publish_stream" },
                  :twitter  => { :force_login =>true, :x_auth_access_type => "write" } }

  attr_accessible :provider, :uid, :info, :credentials, :auto_publish

  belongs_to :user
  store :extra, :accessors => [ :info, :credentials ]
  scope :provider, lambda{|provider| where( :provider => provider ) }

  validates_presence_of   :provider, :uid
  validates_uniqueness_of :provider, :scope => [ :uid ]

  def self.find_or_create_by_omniauth(auth, current_user)
    auth_provider = find_by_provider_and_uid(auth["provider"], auth["uid"].to_s)
    if auth_provider
      auth_provider.update_attributes( :info => auth.info, :credentials => auth.credentials )
    else
      current_user ||= User.new( :name => auth.info["name"], :email => auth.info["email"] )
      auth_provider  = current_user.auth_providers.build( :provider => auth["provider"], :uid => auth["uid"].to_s,
                          :info => auth.info, :credentials => auth.credentials )
      current_user.save!
    end
    auth_provider
  end
end
