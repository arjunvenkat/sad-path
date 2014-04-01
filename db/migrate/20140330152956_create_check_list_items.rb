class CreateCheckListItems < ActiveRecord::Migration
  def change
    create_table :check_list_items do |t|
      t.integer :check_list_id
      t.integer :check_id
      t.integer :position

      t.timestamps
    end
  end
end
