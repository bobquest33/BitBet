class AddAddressesToBets < ActiveRecord::Migration
  def change
    add_column :bets, :your_address, :string
    add_column :bets, :friend_address, :string
    add_column :bets, :you_paid, :boolean, default: false, null: false
    add_column :bets, :friend_paid, :boolean, default: false, null: false
  end
end
