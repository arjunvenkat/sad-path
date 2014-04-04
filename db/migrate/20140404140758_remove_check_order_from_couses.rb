class RemoveCheckOrderFromCouses < ActiveRecord::Migration
  def change
    remove_column :courses, :check_order, :text
  end
end
