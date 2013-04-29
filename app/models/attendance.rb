class Attendance < ActiveRecord::Base
  attr_accessible :Date, :absent, :course_id, :excused, :present, :student_id, :tardy
end
