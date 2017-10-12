class CreateBonusWalletDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :bonus_wallet_details do |t|
      t.decimal :amount, default: 0.00
      t.text :remark
      t.integer :user_id

      t.timestamps
    end
  end
end
