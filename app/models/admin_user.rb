class AdminUser < User
  self.devise_modules = []    # Clear the configuration did in User model
  devise :database_authenticatable, :rememberable, :trackable, :validatable

end
