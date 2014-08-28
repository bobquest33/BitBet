class RenameYourAddressInBets < ActiveRecord::Migration
  def change
    rename_column :bets, :your_address, :you_address
  end
end
