class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      
      respond_to do |format|
        format.html {redirect_to courses_url}
        format.json  { render :text => "Valid user/password combination" }
      end      
      #redirect_to courses_url
    else
        respond_to do |format|
        format.html {redirect_to login_url, :alert => "Invalid user/password combination" }
        format.json  { render :text => "Invalid user/password combination" }
      end
       #redirect_to login_url, alert: "Invalid user/password combination"
    end
  end


  def destroy
    session[:user_id] = nil
     respond_to do |format|
        format.html {redirect_to login_url, :notice => "Logged out" }
        format.json  { render :text => "Logged out" }
      end
    #redirect_to login_url, notice: "Logged out"
  end
end
