class AddPositionToRoadblockChecks < ActiveRecord::Migration
  def change
    add_column :roadblock_checks, :position, :integer
  end
end
