class CreateDesks < ActiveRecord::Migration[5.0]
  def change
    create_table :desks do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
