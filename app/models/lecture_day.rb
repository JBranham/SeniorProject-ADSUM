class LectureDay < ActiveRecord::Base
  attr_accessible :course_id, :friday, :monday, :saturday, :sunday, :thursday, :tuesday, :wednesday
end
