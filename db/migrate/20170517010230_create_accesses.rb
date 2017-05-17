class CreateAccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :accesses do |t|
		t.integer :desk_id
		t.integer :user_id

		t.datetime :devolution_time
		t.binary :image

		t.timestamps
    end

	add_index :accesses, :desk_id
	add_index :accesses, :user_id
  end
end
