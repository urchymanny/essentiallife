class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.text :address
      t.integer :city_id
      t.integer :state_id
      t.integer :country_id
      t.string :zip_code
      t.integer :account_number
      t.string :bank_name
      t.string :account_name
      t.string :password_digest

      t.timestamps
    end
  end
end
