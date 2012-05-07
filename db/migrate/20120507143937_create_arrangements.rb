class CreateArrangements < ActiveRecord::Migration
  def change
    create_table :arrangements , {:id => false} do |t|
      t.string :uuid, :primary => true
      t.timestamps
    end
  end
end
