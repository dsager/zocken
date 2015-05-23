class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :player, index: true, foreign_key: true, null: false
      t.references :result, index: true, foreign_key: true, null: false
      t.references :bet, index: true, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
