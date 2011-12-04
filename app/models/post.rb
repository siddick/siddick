class Post < ActiveRecord::Base

  belongs_to :user

  after_save do
    Resque.enqueue(GenerateContent, self.id)  if raw_content_changed?
  end

end
