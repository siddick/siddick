class PostsController < ApplicationController
  def index
    @posts  = Post.published.page(params[:page])
    @posts  = @posts.tagged_with(params[:tag]) if params[:tag].present?
  end

  def show
    @post = Post.find(params[:id])
  end
end
