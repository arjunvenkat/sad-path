class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :roadblocks
  scope :recent, -> { roadblocks }
  # scope :recent, -> { where(name: "Latin Web Dev")}
  scope :recent_roadblocks, -> { roadblocks.order(created_at: :desc).limit(10) }
end
