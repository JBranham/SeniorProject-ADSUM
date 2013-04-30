class Course < ActiveRecord::Base
  attr_accessible :name, :user_id, :f_day, :l_day, :course_id, :pass_d_points_attributes, :lecture_days_attributes, :quick_points_attributes, :designated_points_attributes, :students_attributes, :attendances_attributes
  has_many :students, dependent: :destroy
  has_many :quick_points, dependent: :destroy
  has_many :designated_points, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :pass_q_points, dependent: :destroy
  has_many :pass_d_points, dependent: :destroy
  has_many :lecture_days, dependent: :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :students, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  accepts_nested_attributes_for :attendances
  accepts_nested_attributes_for :pass_q_points
  accepts_nested_attributes_for :lecture_days
  accepts_nested_attributes_for :quick_points
  accepts_nested_attributes_for :designated_points
  accepts_nested_attributes_for :pass_d_points
  
  def decrease(student_id)
    current_student = students.find(student_id)
    if current_student.points != nil
      current_student.points -= 1
    else
      current_student.points = 0
    end
    current_student
  end

  def increase(student_id)
    current_student = students.find(student_id)
    if current_student.points != nil
      current_student.points += 1
    else
      current_student.points = 0
    end
    current_student
  end
  
  def dp(student_id)
    current_student = students.find(student_id)
    current_student
  end

end