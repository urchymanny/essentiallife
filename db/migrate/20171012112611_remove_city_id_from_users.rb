class RemoveCityIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :city_id, :integer
    remove_column :users, :state_id, :integer
    remove_column :users, :country_id, :integer
  end
end
