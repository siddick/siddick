# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :tag => :div, :class => :clearfix,
                  :error_class => :error do |b|
    # Extensions
    b.use :html5
    b.optional :pattern
    b.use :maxlength
    b.use :placeholder
    b.use :readonly

    # Inputs
    b.use :label
    b.wrapper :tag => :div, :class => "input" do |ba|
      ba.use :input
      ba.use :error, :wrap_with => { :tag => :span, :class => "help-inline" }
      ba.use :hint,  :wrap_with => { :tag => :span, :class => "help-block" }
    end
  end
end

