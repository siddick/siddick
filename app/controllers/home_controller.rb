class HomeController < ApplicationController
  def index
    @posts = Post.limit(5)
  end

  def sitemap
    @posts = Post.last_posted.select("id, slug, updated_at")
  end

end
