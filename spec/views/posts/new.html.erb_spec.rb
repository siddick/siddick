require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
    assign(:post, stub_model(Post,
      :user => nil,
      :title => "MyString",
      :content => "MyText",
      :raw_content => "MyText",
      :raw_content_type => "MyString",
      :published => false
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_user", :name => "post[user]"
      assert_select "input#post_title", :name => "post[title]"
      assert_select "textarea#post_content", :name => "post[content]"
      assert_select "textarea#post_raw_content", :name => "post[raw_content]"
      assert_select "input#post_raw_content_type", :name => "post[raw_content_type]"
      assert_select "input#post_published", :name => "post[published]"
    end
  end
end
