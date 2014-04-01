class CreateRoadblockChecks < ActiveRecord::Migration
  def change
    create_table :roadblock_checks do |t|
      t.integer :check_id
      t.integer :roadblock_id
      t.datetime :completed_at, default: DateTime.new(1970,1,1)
      t.boolean :solved_it, default: false

      t.timestamps
    end
  end
end
