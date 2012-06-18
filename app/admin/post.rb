ActiveAdmin.register Post do
  index do
    column :title
    column :published
    column :published_at
    default_actions
  end

  filter :title

  form do |f|
    f.inputs :title, :raw_content, :tag_list, :published, :published_at
    f.buttons
  end

  collection_action :video_info, :method => :get do
    render :json => VideoInfo.new(params[:url])
  end

  controller do
    cache_sweeper :post_sweeper

    def new
      new!{ @post.published_at = Time.now }
    end

    def create
      @post = Post.new(params[:post])
      @post.user = current_admin_user
      create!
    end

    def update
      resource.user ||= current_admin_user
      update!
    end
  end

end
