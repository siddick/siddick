Siddick::Application.routes.draw do
  resources :posts

  ActiveAdmin.routes(self)

  devise_for :admin_user, ActiveAdmin::Devise.config
  devise_for :user

  authenticate :admin_user do
    mount Resque::Server, :at => "/admin/resque"
  end

  root :to => "home#index"
end
