class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.timestamps

      t.string :amount, :judge, :you, :friend
      t.text :description
    end
  end
end
