class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :roadblock_id
      t.text :contents

      t.timestamps
    end
  end
end
