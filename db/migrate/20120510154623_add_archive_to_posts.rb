class AddArchiveToPosts < ActiveRecord::Migration
  def up
    Post.find_each do |post|
      post.add_archive_list
      post.save
    end
  end

  def down
    ActsAsTaggableOn::Tagging.where( :taggable_type => Post.name, :context => 'archive' ).delete_all
  end
end
