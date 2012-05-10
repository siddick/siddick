class GenerateContent
  @queue = :generate_content

  class << self
    def perform(post_id)
      post = Post.find(post_id)
      post.content = render(post.raw_content)
      post.save
    end

    def markdown
      @markdown ||= begin
        html_render = CustomHTMLRender.new( :filter_html => true, :hard_wrap => true )
        Redcarpet::Markdown.new(html_render, :autolink => true, :no_intra_emphasis => true, :fenced_code_blocks => true, :tables => true)
      end
    end

    def render(text)
      markdown.render(text)
    end

  end

  class CustomHTMLRender < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= "ruby"
      CodeRay.scan(code, language).div(:css => :class)
    end
  end

end
