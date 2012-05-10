xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @posts.each do |post|
    xml.url do
      xml.loc url_for(post)
      xml.lastmod post.updated_at.to_date
    end
  end
end
