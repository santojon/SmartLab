class CreateIncidents < ActiveRecord::Migration[5.0]
  def change
    create_table :incidents do |t|
      t.string :location
      t.string :description
      t.string :measure

      t.timestamps
    end
  end
end
