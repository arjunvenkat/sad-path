class CheckList < ActiveRecord::Base
  has_many :check_list_items, -> { order("position ASC") }
  has_many :course_check_lists
  has_many :courses, through: :course_check_lists
end
