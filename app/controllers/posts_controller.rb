class PostsController < ApplicationController
  def index
    @search = Post.solr_search do
      fulltext params[:q] if params[:q].present?
      with(:tag_list,  params[:tag]) if params[:tag].present?
      with(:archive,   params[:archive]) if params[:archive].present?
      with(:published, true)
      with(:published_at).less_than(Time.zone.now)
      order_by :published_at, :desc
      paginate :page => params[:page], :per_page => 10
      facet :tag_list
      facet :archive
    end
    @posts = @search.results
  end

  def show
    @post = Post.find(params[:id])
  end
end
