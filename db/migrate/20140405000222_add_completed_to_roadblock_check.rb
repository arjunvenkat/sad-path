class AddCompletedToRoadblockCheck < ActiveRecord::Migration
  def change
    add_column :roadblock_checks, :completed, :boolean
  end
end
