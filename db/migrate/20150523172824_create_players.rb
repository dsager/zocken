class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.integer :points, null: false, default: 0
      t.timestamps null: false
    end
    add_index :players, :name
    add_index :players, :email
  end
end
