class PostSweeper < ActionController::Caching::Sweeper
  observe Post

  def after_create(post)
    expire_cache_for(post)
  end

  def after_update(post)
    expire_cache_for(post)
  end

  def after_destroy(post)
    expire_cache_for(post)
  end

  private
  def expire_cache_for(post)
    expire_all_pages(posts_url, Post.published.count)
    Post.published.tag_counts.each do |tag|
      expire_all_pages(tag_posts_url(tag.name), tag.count)
    end
    expire_action(post_url(post))
    expire_fragment('tag_counts')
  end

  def expire_all_pages(expire_url, posts_count)
    pages = posts_count / Post.default_per_page
    expire_action(expire_url)
    pages.times do |page|
      expire_action("#{expire_url}/page/#{page}")
    end
  end
end
