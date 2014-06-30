class Check < ActiveRecord::Base
  has_many :roadblock_checks, dependent: :destroy
  has_many :roadblocks, through: :roadblock_checks

  scope :instructor_created, -> { where(instructor_created: true)}
end
