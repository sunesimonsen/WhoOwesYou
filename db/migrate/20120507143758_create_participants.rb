class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :user_id, :null => false 
      t.string :arrangement_uuid, :null => false
      t.timestamps
    end
  end
end
