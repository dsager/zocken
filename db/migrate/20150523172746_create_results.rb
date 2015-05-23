class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :is_true
      t.references :bet, index: true, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
