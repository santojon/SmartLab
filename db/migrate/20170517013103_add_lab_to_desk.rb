class AddLabToDesk < ActiveRecord::Migration[5.0]
  def change
    add_reference :desks, :lab, foreign_key: true
  end
end
