class AddSolvedToRoadblock < ActiveRecord::Migration
  def change
    add_column :roadblocks, :solved, :boolean, default: false
  end
end
