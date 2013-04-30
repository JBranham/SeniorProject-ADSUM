class PassDPoint < ActiveRecord::Base
  
  belongs_to :student
  belongs_to :course
  belongs_to :designated_point
  
  attr_accessible :course_id, :student_id, :descr, :student_attributes, :designated_points_attributes, :designated_point_id
  
  before_save :pop_descr
  after_save :add_dp
  
  private
  
  def pop_descr
    
    if self.descr = 'none'
    self.descr = self.designated_point.name
    end
    
  end
  
  def add_dp
    current_student = self.student
    points = current_student.points
    dp = self.designated_point
    num = dp.num.to_f
    
    points += num
    
    self.student.update_attribute(:points, points)
  end
    
  
  
end