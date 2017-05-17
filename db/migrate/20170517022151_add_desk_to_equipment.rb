class AddDeskToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_reference :equipment, :desk, foreign_key: true
  end
end
