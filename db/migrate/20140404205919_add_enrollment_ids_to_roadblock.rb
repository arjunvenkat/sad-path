class AddEnrollmentIdsToRoadblock < ActiveRecord::Migration
  def change
    add_column :roadblocks, :enrollment_id, :integer
    add_column :roadblocks, :second_enrollment_id, :integer
  end
end
