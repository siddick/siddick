class AuthProvider < ActiveRecord::Base

  attr_accessible :provider, :uid, :info, :credentials

  belongs_to :user
  store :extra, :accessors => [ :info, :credentials ]
  scope :provider, lambda{|provider| where( :provider => provider ) }

  validates_presence_of   :provider, :uid
  validates_uniqueness_of :provider, :scope => [ :uid ]

  def self.find_or_create_by_omniauth(auth, current_user)
    auth_provider = find_by_provider_and_uid(auth["provider"], auth["uid"])
    if auth_provider
      auth_provider.update_attributes( :info => auth.info, :credentials => auth.credentials )
    else
      current_user ||= User.new( :name => auth.info["name"], :email => auth.info["email"] )
      auth_provider  = current_user.auth_providers.build( :provider => auth["provider"], :uid => auth["uid"],
                          :info => auth.info, :credentials => auth.credentials )
      current_user.save!
    end
    auth_provider
  end
end
