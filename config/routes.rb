Siddick::Application.routes.draw do

  resources :posts, :only => [ :index, :show ] do
    collection do
      get "tags/:tag/page/:page" => "posts#index"
      get "tags/:tag" => "posts#index", :as => :tag
      get "page/:page" => "posts#index"
    end
  end
  resource :profile, :only => [ :show, :update ] do
    resources :auth_providers, :only => [ :destroy, :update ]
  end

  ActiveAdmin.routes(self)
  match '/auth/:provider/callback', to: 'auth_providers#create'

  devise_for :user

  root :to => "posts#index"
  get "sitemap"    => "home#sitemap", :format => :xml
  get "search"         => "home#search"
  get "about"          => "home#about"
  match "contact"      => "home#contact"
  get "update_caching" => "application#update_caching", :format => :js

  match "*path" => "home#not_found"

end
