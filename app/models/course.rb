class Course < ActiveRecord::Base
  has_many :topics, -> { order("position ASC") }
  has_many :course_check_lists
  has_many :check_lists, through: :course_check_lists
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :roadblocks, through: :enrollments, source: :roadblocks
  scope :recent, -> { roadblocks }
  # scope :recent, -> { where(name: "Latin Web Dev")}
  scope :recent_roadblocks, -> { roadblocks.order(created_at: :desc).limit(10) }

  before_create :generate_enrollment_hash

  def generate_enrollment_hash
    generate_another = true
    while generate_another
      hash = rand(36**4).to_s(36)
      unique = true
      Course.all.each do |course|
        if course.enrollment_hash == hash
          unique = false
        end
      end
      generate_another = false if unique == true
    end
    self.enrollment_hash = hash
  end

  def selected_check_list
    self.check_lists.first
  end

  def instructors
    self.enrollments.map {|e| e.user if e.instructor}.compact
  end

end
