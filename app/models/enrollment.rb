class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :roadblocks
end
