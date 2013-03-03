class Post < ActiveRecord::Base

  belongs_to :user
  acts_as_taggable
  acts_as_taggable_on :archive

  self.per_page = 10

  attr_accessible :title, :raw_content, :tag_list, :published, :published_at

  validates_presence_of :title, :raw_content, :published_at, :tag_list, :user_id

  scope :published, where(:published => true).order("published_at DESC")

  extend FriendlyId
  friendly_id :title, :use => :slugged

  before_validation :generate_content, :if => :raw_content_changed?
  before_validation :add_archive_list, :if => :published_at_changed?

  def generate_content
    self.content = GenerateContent.render(raw_content)
  end

  def add_archive_list
    self.archive_list = published_at.strftime("%Y, %Y-%m")
  end

  def self.published_tags
    published.tag_counts.order("count DESC")
  end

end
