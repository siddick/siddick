require 'spec_helper'

describe "posts/index.html.erb" do
  before(:each) do
    posts = [ Factory(:post), Factory(:post) ]
    assign(:posts, Kaminari.paginate_array(posts).page(1))
  end

  it "renders a list of posts" do
    render
  end
end
