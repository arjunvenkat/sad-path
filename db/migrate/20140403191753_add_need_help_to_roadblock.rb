class AddNeedHelpToRoadblock < ActiveRecord::Migration
  def change
    add_column :roadblocks, :need_help, :boolean, default: false
  end
end
