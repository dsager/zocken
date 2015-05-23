class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :title, null: false
      t.text :description
      t.integer :status, null: false, default: 0
      t.timestamps null: false
    end
  end
end
