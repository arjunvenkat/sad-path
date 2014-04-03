class Course < ActiveRecord::Base
  has_many :topics, -> { order("position ASC") }
  has_many :course_check_lists
  has_many :check_lists, through: :course_check_lists
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :roadblocks
  scope :recent, -> { roadblocks }
  # scope :recent, -> { where(name: "Latin Web Dev")}
  scope :recent_roadblocks, -> { roadblocks.order(created_at: :desc).limit(10) }


end
