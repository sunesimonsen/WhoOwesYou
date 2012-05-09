class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name, :null => false
      t.integer :amount, :null => false
      t.integer :participant_id, :null => false

      t.timestamps
    end
  end
end
