Siddick::Application.routes.draw do
  resources :posts, :only => [ :index, :show ]
  get "tags/:tag" => "posts#index", :as => :tag

  ActiveAdmin.routes(self)

  devise_for :user

  root :to => "posts#index"
  get "sitemap.xml" => "home#sitemap", :format => :xml
  get "search" => "home#search"
end
