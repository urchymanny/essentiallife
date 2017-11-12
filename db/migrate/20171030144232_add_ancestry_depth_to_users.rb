class AddAncestryDepthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ancestry_depth, :integer, default: 0
  end
end
