require 'spec_helper'

describe PostsController do

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = FactoryGirl.create(:post)
      get :index
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create(:post)
      get :show, :id => post.id
      response.should be_success
    end
  end

end
