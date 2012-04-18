class PostsController < ApplicationController
  def index
    @posts  = Post.last_posted.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end
end
