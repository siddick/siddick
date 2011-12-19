# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.components     = [ :placeholder, :label, :custom_format ]
  config.wrapper_class       = "clearfix"
  config.wrapper_error_class = "error"
  config.hint_class     = "help-block"
  config.error_class    = "help-inline"
end

SimpleForm::Inputs::Base.class_eval do
  def custom_format
    "<div class='input'>#{input}#{error}#{hint}</div>"
  end
end
