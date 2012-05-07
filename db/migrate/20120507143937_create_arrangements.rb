class CreateArrangements < ActiveRecord::Migration
  def change
    create_table :arrangements do |t|

      t.timestamps
    end
  end
end
