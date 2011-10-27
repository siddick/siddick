class AdminUser < User
  devise_modules = []
  devise :database_authenticatable, :rememberable, :trackable, :validatable

end
