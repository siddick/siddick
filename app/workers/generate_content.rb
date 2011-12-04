class GenerateContent
  @queue = :generate_content

  def self.perform(post_id)
    post = Post.find(post_id)
    post.content = markdown.render(post.raw_content)
    post.save
  end

  def self.markdown
    @markdown ||= Redcarpet::Markdown.new( 
      Redcarpet::Render::HTML.new( :filter_html => true, :hard_wrap => true ),
      :autolink => true, :no_intra_emphasis => true, :fenced_code_blocks => true )
  end

end
