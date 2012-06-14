class HomeController < ApplicationController
  def index
    @posts = Post.limit(5)
  end

  def sitemap
    @posts = Post.published.select("id, slug, updated_at")
    @tags  = Post.published.tag_counts
  end

  def not_found
    redirect_to root_path, :alert => "Requested page is unavailable !!!"
  end

  def contact
    if request.post? and params[:contact].present?
      @contact = Contact.new(params[:contact])
      if @contact.valid? and verify_recaptcha(:model => @contact, :attribute => "recaptcha")
        redirect_to root_path, :notice => "Message send successfully"
      end
    else
      @contact = Contact.new
    end
  end

end
