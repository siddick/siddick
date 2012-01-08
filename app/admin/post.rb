ActiveAdmin.register Post do
  index do 
    column :title
    column :published
    column :published_at
    default_actions    
  end
  
  filter :title
  
  form do |f|
    f.inputs :title, :raw_content, :published, :published_at
    f.buttons
  end

end
