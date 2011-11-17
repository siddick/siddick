Siddick::Application.routes.draw do
  resources :posts

  ActiveAdmin.routes(self)

  devise_for :admin_user, ActiveAdmin::Devise.config
  devise_for :user

  root :to => "home#index"
end
