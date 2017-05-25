class CreateIncidents < ActiveRecord::Migration[5.0]
  def change
    create_table :incidents do |t|
      t.string :location, :null => false
      t.string :description, :null => false
      t.string :measure, :null => true

      t.timestamps
    end
  end
end
