class User < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  has_many :students, :through => :courses
  
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  validates :password, :length => { :minimum => 5}
  has_secure_password
      
end
