class Post < ActiveRecord::Base

  belongs_to :user
  acts_as_taggable
  
  scope :last_posted, where(:published => true).order("published_at DESC")

  searchable do
    integer :user_id
    boolean :published
    text :title, :raw_content
    time :published_at
    string :tag_list, :multiple => true
    string :archive,  :multiple => true do
      published_at.strftime("%Y-%I,%Y").split(',') if published_at.present?
    end
  end

  extend FriendlyId
  friendly_id :title, :use => :slugged

  after_save do
    Resque.enqueue(GenerateContent, self.id)  if raw_content_changed?
  end

end
