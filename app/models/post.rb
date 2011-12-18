class Post < ActiveRecord::Base

  belongs_to :user

  extend FriendlyId
  friendly_id :title, :use => :slugged

  after_save do
    Resque.enqueue(GenerateContent, self.id)  if raw_content_changed?
  end

end
