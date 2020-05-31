class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.string :creditor
      t.integer :balance_owed
      t.integer :monthly_payment
      t.integer :due_date
    end
  end
end
