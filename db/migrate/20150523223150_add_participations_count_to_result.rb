class AddParticipationsCountToResult < ActiveRecord::Migration
  def change
    add_column :results, :participations_count, :integer
  end
end
