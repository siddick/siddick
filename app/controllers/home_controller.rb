class HomeController < ApplicationController
  def index
    @posts = Post.limit(5)
  end

  def sitemap
    @posts = Post.published.select("id, slug, updated_at")
    @tags  = Post.published.tag_counts
  end

  def not_found
    redirect_to root_path, :alert => "Requested page is unavailable !!!"
  end

end
