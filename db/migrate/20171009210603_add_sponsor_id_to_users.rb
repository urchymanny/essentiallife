class AddSponsorIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sponsor_id, :integer
  end
end
