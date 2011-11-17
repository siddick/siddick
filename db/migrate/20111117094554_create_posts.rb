class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.string :cached_slug
      t.text :content
      t.text :raw_content
      t.string :raw_content_type
      t.boolean :published

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
