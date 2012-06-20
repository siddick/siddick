Siddick::Application.routes.draw do
  resources :posts, :only => [ :index, :show ] do
    collection do
      get "tags/:tag/page/:page" => "posts#index"
      get "tags/:tag" => "posts#index", :as => :tag
      get "page/:page" => "posts#index"
    end
  end

  ActiveAdmin.routes(self)
  match '/auth/:provider/callback', to: 'auth_providers#create'

  devise_for :user

  root :to => "posts#index"
  get "sitemap.xml" => "home#sitemap", :format => :xml
  get "search"      => "home#search"
  get "about"       => "home#about"
  match "contact"     => "home#contact"

  match "*path" => "home#not_found"

end
