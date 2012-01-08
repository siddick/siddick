require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "list posts" do
      get posts_path
      response.status.should be(200)
    end
    
    it "search post" do
      get posts_path, :q => "hello"
      response.status.should be(200)
    end
  end
end
