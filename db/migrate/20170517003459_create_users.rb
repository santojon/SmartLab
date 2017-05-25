class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :cpf, :null => false, :unique => true
      t.string :password, :null => false
      t.boolean :admin, :null => false, :default => false

      t.timestamps
    end
  end
end
