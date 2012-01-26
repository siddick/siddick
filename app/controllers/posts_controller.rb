class PostsController < ApplicationController
  def index
    @search = custom_search(params)
    @posts  = @search.results
  end

  def show
    @search = custom_search
    @post = Post.find(params[:id])
  end

  private
  def custom_search(params={})
    Post.solr_search do
      fulltext params[:q] if params[:q].present?
      with(:tag_list, params[:tag])     if params[:tag].present?
      with(:archive,  params[:archive]) if params[:archive].present?
      with(:published, true)
      with(:published_at).less_than(Time.zone.now)
      order_by :published_at, :desc
      paginate :page => params[:page], :per_page => 7
      facet :tag_list
      facet :archive
    end
  end
end
