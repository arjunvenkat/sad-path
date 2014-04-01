class MakeInstructorFalseDefaultForUsers < ActiveRecord::Migration
  def change
    change_column :enrollments, :instructor, :boolean, default: false
  end
end
