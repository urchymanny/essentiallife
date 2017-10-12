class AddWalletBalanceAndBonusWalletBalanceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wallet_balance, :decimal, default: 0.00
    add_column :users, :bonus_wallet_balance, :decimal, default: 0.00
  end
end
