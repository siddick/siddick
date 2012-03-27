class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  validates_presence_of :name, :email
  validates_presence_of :password, :on => :create
  
  scope :last_sign_in, order("last_sign_in_at DESC")
  
  before_save do
    self.avatar_url = generate_avatar_url unless self.avatar_url.present?
  end
  
  def generate_avatar_url
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
  
  def admin?
    self.is_a? AdminUser
  end

end
