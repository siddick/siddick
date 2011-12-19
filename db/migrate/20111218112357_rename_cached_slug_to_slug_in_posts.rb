class RenameCachedSlugToSlugInPosts < ActiveRecord::Migration
  def up
    rename_column :posts, :cached_slug, :slug
    add_index :posts, :slug
  end

  def down
    remove_index :posts, :slug
    rename_column :posts, :slug, :cached_slug
  end
end
