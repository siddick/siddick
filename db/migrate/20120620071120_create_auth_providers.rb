class CreateAuthProviders < ActiveRecord::Migration
  def change
    create_table :auth_providers do |t|
      t.string :provider, :null => false
      t.string :uid,      :null => false
      t.references :user, :null => false
      t.text :extra

      t.timestamps
    end
    add_index :auth_providers, [ :user_id, :provider, :uid ]
    add_index :auth_providers, [ :provider, :uid ], :unique => true
  end
end
