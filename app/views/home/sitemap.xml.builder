xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  [ root_url, contact_url, about_url ].each do |url|
    xml.url do
      xml.loc url
      xml.lastmod Date.today
    end
  end
  @posts.each do |post|
    xml.url do
      xml.loc post_url(post)
      xml.lastmod post.updated_at.to_date
    end
  end
  @tags.each do |tag|
    xml.url do
      xml.loc tag_posts_url(tag.name)
      xml.lastmod Date.today
    end
  end
end
