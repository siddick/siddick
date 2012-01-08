class AddPublishedAtInPosts < ActiveRecord::Migration
  def up
    add_column :posts, :published_at, :timestamp
  end

  def down
    remove_column :posts, :published_at
  end
end
