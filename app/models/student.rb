class Student < ActiveRecord::Base
  attr_accessible :course_id, :fname, :lname, :points, :preferred_name, :student_no
end
