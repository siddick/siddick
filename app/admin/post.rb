ActiveAdmin.register Post do
  index do 
    column :title
    column :published
    default_actions    
  end
  
  filter :title
  
  form do |f|
    f.inputs :title, :content, :published
    f.buttons
  end
end