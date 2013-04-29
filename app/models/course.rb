class Course < ActiveRecord::Base
  attr_accessible :f_day, :l_day, :name, :user_id
end
