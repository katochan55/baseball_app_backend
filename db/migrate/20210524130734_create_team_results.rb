class CreateTeamResults < ActiveRecord::Migration[6.0]
  def change
    create_table :team_results do |t|
      t.references :team, foreign_key: true, index: false, null: false
      t.integer :year, null: false
      t.integer :rank, null: false
      t.integer :wins_count, null: false, default: 0
      t.integer :loses_count, null: false, default: 0

      t.timestamps

      t.index [:team_id, :year], unique: true
    end
  end
end
