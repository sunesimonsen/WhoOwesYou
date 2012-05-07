class AddIndexToArrangementUuid < ActiveRecord::Migration
  def change
    add_index :arrangements, :uuid, :unique => true
  end
end
