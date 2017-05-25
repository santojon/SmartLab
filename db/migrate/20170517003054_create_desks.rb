class CreateDesks < ActiveRecord::Migration[5.0]
  def change
    create_table :desks do |t|
      t.string :name, :null => false
      t.integer :status, :null => false

      t.timestamps
    end
  end
end
