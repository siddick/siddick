require 'spec_helper'

describe PostsController do

  def valid_attributes
    Factory.attributes_for(:post)
  end

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index
      assigns(:posts).first.id.should eq(post.id)
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, :id => post.id
      assigns(:post).id.should eq(post.id)
    end
  end

end
