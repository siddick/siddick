module HomeHelper
  def simple_form_recaptcha_tag(resouce)
    content_tag("div", :class => "control-group#{ " error" if resouce.errors[:recaptcha].present? }") do
      content_tag("div", :class => "controls" ) do
        recaptcha_tags +
        content_tag("span", resouce.errors[:recaptcha].join, :class => "help-inline")
      end
    end if ENV['RECAPTCHA_PUBLIC_KEY'].present?
  end

  def gravatar_image_url(email, size = 170)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def icon_with_content(icon, content)
    content_tag('span', '', :class => "icon-#{icon}") + content
  end
end
