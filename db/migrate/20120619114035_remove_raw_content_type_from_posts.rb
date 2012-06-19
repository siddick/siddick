class RemoveRawContentTypeFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :raw_content_type
  end

  def down
    add_column :posts, :raw_content_type, :string
  end
end
