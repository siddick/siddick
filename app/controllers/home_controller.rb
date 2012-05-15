class HomeController < ApplicationController
  def index
    @posts = Post.limit(5)
  end

  def sitemap
    @posts = Post.published.select("id, slug, updated_at")
  end

end
