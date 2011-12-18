class RenameCachedSlugToSlugInPosts < ActiveRecord::Migration
  def up
    rename_column :posts, :cached_slug, :slug
  end

  def down
    rename_column :posts, :slug, :cached_slug
  end
end
