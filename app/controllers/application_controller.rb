class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :detect_user
  protect_from_forgery

  protected
  

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
    
    def detect_user
        if session[:user_id]
        @user = User.find_by_id(session[:user_id])
        @courses = @user.courses.each
        else
        end
    end
    
end