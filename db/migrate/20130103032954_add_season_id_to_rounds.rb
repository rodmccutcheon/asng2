class AddSeasonIdToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :season_id, :int
  end
end
