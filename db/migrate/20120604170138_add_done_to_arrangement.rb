class AddDoneToArrangement < ActiveRecord::Migration
  def change
    add_column :arrangements, :done, :boolean, :default => false
  end
end
