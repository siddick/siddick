class AddAutoPublishToAuthProviders < ActiveRecord::Migration
  def change
    add_column :auth_providers, :auto_publish, :boolean, :null => false, :default => false
  end
end
