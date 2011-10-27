Siddick::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_user, ActiveAdmin::Devise.config
  devise_for :user

  root :to => "home#index"
end
