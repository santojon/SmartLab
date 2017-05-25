class CreateLabs < ActiveRecord::Migration[5.0]
  def change
    create_table :labs do |t|
      t.string :building, :null => false
      t.string :code, :null => false, :unique => true
      t.string :name, :null => false

      t.timestamps
    end
  end
end
