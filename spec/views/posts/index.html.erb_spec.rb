require 'spec_helper'

describe "posts/index.html.erb" do
  before(:each) do
    assign(:posts, [
      Factory(:post),
      Factory(:post)
    ])
  end

  it "renders a list of posts" do
    render
  end
end
