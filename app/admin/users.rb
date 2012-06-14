ActiveAdmin.register User do

  index do
    column "#" do |user|
      image_tag user.avatar_url, :size => "15x15", :alt => ""
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
