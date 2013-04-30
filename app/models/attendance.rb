class Attendance < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  attr_accessible :absent, :course_id, :Date, :excused, :present, :student_id, :tardy
  
  def attendance_to_asterisk (attendance_field)
    
    if attendance_field
      return "| * |"
    else
       return "  "
    end  
  end
  
end