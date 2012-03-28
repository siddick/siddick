require 'spec_helper'

describe "posts/show.html.erb" do
  before(:each) do
    @post = assign(:post, Factory(:post))
  end

  it "renders attributes in <p>" do
    render
  end
end
