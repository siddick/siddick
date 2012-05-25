module ApplicationHelper
  def title
    @title ||= @post.try(:title) || params[:action].humanize
  end

  def title=(page_title)
    @title = page_title
  end

end
