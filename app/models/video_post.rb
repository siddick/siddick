class VideoPost < Post
  def generate_content
    video = VideoInfo.new(raw_content)
    self.title   = video.title if self.title.blank?
    self.content = video.embed_code
  rescue => err
    errors.add( :raw_content, "not a valid video url" )
  end
end
