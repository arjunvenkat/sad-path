class AddEnrollmentHashToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :enrollment_hash, :string
  end
end
