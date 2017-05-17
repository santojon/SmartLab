class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :model
      t.string :description
      t.string :tag
      t.string :serial

      t.timestamps
    end
  end
end
