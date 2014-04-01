class AddInputFieldToRoadblockCheck < ActiveRecord::Migration
  def change
    add_column :roadblock_checks, :user_input, :text
  end
end
