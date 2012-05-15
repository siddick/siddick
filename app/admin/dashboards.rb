ActiveAdmin::Dashboards.build do

  section "Users" do
    table_for User.last_sign_in.limit(5) do |user|
      user.column :name do |user|
        link_to user.name, admin_user_path(user)
      end
      user.column :email
      user.column :last_sign_in_at
    end
  end

  section "Posts" do
    table_for Post.published.limit(5) do |post|
      post.column :title do |post|
        link_to post.title, admin_post_path(post)
      end
      post.column :published_at
    end
  end

end
