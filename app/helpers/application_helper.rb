module ApplicationHelper
  def title
    @title ||= @post.try(:title) || params[:action].humanize
  end

  def title=(page_title)
    @title = page_title
  end

  def li_link_to(name, path, *args)
    content_tag("li", :class => (request.path == path) ? "active" : nil ) do
      link_to(name, path, *args)
    end
  end

  def body_class
    "controller-#{params[:controller]} action-#{params[:action]}"
  end

  def post_page_header_class
    class_names = []
    class_names.push("type-#{(@post.type||"post").downcase}") if @post.present? 
    class_names.push("tag tag-#{params[:tag]}") if params[:tag].present? 
    class_names.join(" ")
  end

end
