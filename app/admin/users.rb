ActiveAdmin.register User do

  index do
    column "#" do |user|
      image_tag gravatar_image_url(user.email, 15), :size => "15x15", :alt => ""
    end
    column :name
    column :email
    default_actions
  end

  filter :name

  form do |f|
    f.inputs :name, :email, :password, :description
    f.buttons
  end

end
