class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :model, :null => false
      t.string :description, :null => true
      t.string :tag, :null => false, :unique => true
      t.string :serial, :null => false, :unique => true
      t.belongs_to :user, :optional => true

      t.timestamps
    end
  end
end
