class CreateLabs < ActiveRecord::Migration[5.0]
  def change
    create_table :labs do |t|
      t.string :building
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
