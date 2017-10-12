class AddRefferalIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :refferal_id, :string
  end
end
