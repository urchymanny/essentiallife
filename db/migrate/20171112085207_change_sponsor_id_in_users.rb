class ChangeSponsorIdInUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :sponsor_id, :string
  end
end
