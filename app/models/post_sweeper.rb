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
    expire_page(root_path)
    if post.tag_list_changed?
      expire_all_pages(posts_path) 
    else
      expire_page(posts_path)
      expire_page(post_path(post))
    end
  end

  def expire_all_pages(path)
    return unless self.perform_caching
    expire_page(path)
    path = File.join(Rails.public_path, path)
    logger.info "Expire all pages: #{path}"
    FileUtils.rm_r(path) rescue nil
  end
end
