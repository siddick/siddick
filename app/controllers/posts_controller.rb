class PostsController < ApplicationController
  caches_action :index

  def index
    @posts  = Post.published.includes(:tags).page(params[:page])
    @posts  = @posts.tagged_with(params[:tag]) if params[:tag].present?
    @title  = params[:tag].try(:humanize) || "Home"
  end

  def show
    @post = Post.find(params[:id])
  end
end
