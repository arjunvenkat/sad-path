class AddMoreInfoToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :more_info, :text
  end
end
