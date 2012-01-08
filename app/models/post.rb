class Post < ActiveRecord::Base

  belongs_to :user

  searchable do
    integer :user_id
    boolean :published
    text :title, :content
    time :published_at
  end

  extend FriendlyId
  friendly_id :title, :use => :slugged

  after_save do
    Resque.enqueue(GenerateContent, self.id)  if raw_content_changed?
  end

end
