class AddInstructorCreatedToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :instructor_created, :boolean
  end
end
