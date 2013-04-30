class LectureDay < ActiveRecord::Base
  belongs_to :course
  
  attr_accessible :course_id, :friday, :monday, :saturday, :sunday, :thursday, :tuesday, :wednesday
end
