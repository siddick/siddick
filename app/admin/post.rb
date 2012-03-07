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
    def new
      new!{ @post.published_at = Time.now }
    end
  end

end
