class AuthProvider < ActiveRecord::Base

  attr_accessible :provider, :uid, :info

  belongs_to :user
  store :extra, :accessors => [ :info ]
  scope :provider, lambda{|provider| where( :provider => provider ) }

  validates_presence_of   :provider, :uid
  validates_uniqueness_of :provider, :scope => [ :uid ]

  def self.twitter; provider('twitter').first; end
  def self.facebook; provider('facebook').first; end

  def self.find_or_create_by_omniauth(auth, current_user)
    auth_provider = find_by_provider_and_uid(auth["provider"], auth["uid"])
    unless auth_provider
      current_user ||= User.new( :name => auth.info["name"], :email => auth.info["email"] )
      auth_provider  = current_user.auth_providers.build( :provider => auth["provider"], :uid => auth["uid"], :info => auth.info )
      current_user.save
    end
    auth_provider
  end
end
