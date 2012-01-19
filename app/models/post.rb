class Post < ActiveRecord::Base

  belongs_to :user
  acts_as_taggable

  searchable do
    integer :user_id
    boolean :published
    text :title, :content
    time :published_at
    string :tag_list, :multiple => true
    string :archive do
      published_at.strftime("%Y-%B") if published_at.present?
    end
  end

  extend FriendlyId
  friendly_id :title, :use => :slugged

  after_save do
    Resque.enqueue(GenerateContent, self.id)  if raw_content_changed?
  end

end
