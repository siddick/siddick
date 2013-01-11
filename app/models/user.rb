class User < ActiveRecord::Base
  devise :database_authenticatable, # :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :description

  store :properties, :accessors => [ :description ]
  has_many :auth_providers, :autosave => true, :dependent => :delete_all, :order => "id ASC"
  has_many :posts

  validates_presence_of :name, :email
  # validates_presence_of :password, :on => :create

  scope :last_sign_in, order("last_sign_in_at DESC")

  def admin?
    self.is_a? AdminUser
  end

  def password_required?
    auth_providers.empty? && super
  end

end
