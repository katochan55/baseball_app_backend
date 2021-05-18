class AddLeagueToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :league, :integer, default: 0, null: false
  end
end
