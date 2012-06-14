module HomeHelper
  def simple_form_recaptcha_tag(resouce)
    content_tag("div", :class => "control-group#{ " error" if resouce.errors[:recaptcha].present? }") do
      content_tag("div", :class => "controls" ) do
        recaptcha_tags +
        content_tag("span", resouce.errors[:recaptcha].join, :class => "help-inline")
      end
    end
  end
end
