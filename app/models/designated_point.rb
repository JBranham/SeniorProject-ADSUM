class DesignatedPoint < ActiveRecord::Base
  belongs_to :course
  has_many :pass_d_points
  attr_accessible :course_id, :name, :num
end
