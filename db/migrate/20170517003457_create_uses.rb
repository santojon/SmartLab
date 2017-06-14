class CreateUses < ActiveRecord::Migration[5.0]
  def change
    create_table :uses do |t|
      t.belongs_to :equipment, index: true

      t.timestamps null: false
    end
  end
end
