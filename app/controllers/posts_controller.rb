class PostsController < InheritedResources::Base
  def index
    @search = Post.solr_search do
      fulltext params[:q] if params[:q].present?
      with(:published, true)
      with(:published_at).less_than(Time.zone.now)
    end
    @posts = @search.results
  end
end
