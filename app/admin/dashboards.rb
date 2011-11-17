ActiveAdmin::Dashboards.build do

  section "Users" do
    table_for User.limit(5) do |user|
      user.column :name
      user.column :email
      user.column :last_sign_in_at
    end
  end
  
  section "Post" do
  end

end
