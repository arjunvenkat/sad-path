class CreateRoadblocks < ActiveRecord::Migration
  def change
    create_table :roadblocks do |t|
      t.string :error_message
      t.text :code_snippet
      t.text :description
      t.text :solution
      t.integer :user1_id
      t.integer :user2_id

      t.timestamps
    end
  end
end
