class AddDescriptionToArrangemts < ActiveRecord::Migration
  def change
    add_column :arrangements, :description, :string
  end
end
