class AddTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :type, :string
    add_index  :posts, :type
  end
end
