class User < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  has_many :students, :through => :courses
  
  after_destroy :ensure_a_user_remains
  
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  validates :password, :length => { :minimum => 5}
  has_secure_password
      
      private
      
      def ensure_a_user_remains
        if User.count.zero?
          raise "Can't delete last user"
        end
      end
      
end
