class Post < ActiveRecord::Base

  belongs_to :user
  acts_as_taggable

  scope :last_posted, where(:published => true).order("published_at DESC")

  extend FriendlyId
  friendly_id :title, :use => :slugged

  before_save do
    self.content = GenerateContent.render(raw_content) if raw_content_changed?
  end

end
