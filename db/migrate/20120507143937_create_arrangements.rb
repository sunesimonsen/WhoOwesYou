class CreateArrangements < ActiveRecord::Migration
  def change
    create_table :arrangements do |t|
      t.string :uuid, :null => false, :unique => true
      t.timestamps
    end
  end
end
