Siddick::Application.routes.draw do
  resources :posts, :only => [ :index, :show ]

  ActiveAdmin.routes(self)

  devise_for :user

  root :to => "posts#index"
end
