module ApplicationHelper
  def title
    @title ||= @post && @post.title
  end
end
