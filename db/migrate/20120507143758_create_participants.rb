class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name, :null => false
      t.string :arrangement_uuid, :null => false
      t.timestamps
    end
  end
end
