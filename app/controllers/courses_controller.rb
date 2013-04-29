class CoursesController < ApplicationController
  
   skip_before_filter :verify_authenticity_token
  # GET /courses
  # GET /courses.json
  def index
    @current_user = User.find_by_id(session[:user_id])
    @courses = @current_user.courses.paginate page: params[:page], order: 'created_at asc', per_page: 25
    if @current_user.courses.empty?
      redirect_to new_course_url, notice: "You Have No Courses Yet"
      return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @current_user = User.find_by_id(session[:user_id])
    session[:course_id] = @course.id
    @pass_d_point = @course.pass_d_points.build
    @designated_point = DesignatedPoint.find_by_id(session[:d_id])
    @students = @course.students.paginate page: params[:page], order: 'lname asc', per_page: 25

    if @course.user_id == @current_user.id
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @students }
    end
    else
      redirect_to login_url, notice: "Not Authorized"
    end
  end
  # GET /courses/new
  # GET /courses/new.json
  def new
    @user = User.find_by_id(session[:id])
    @course = Course.new
    @lecture_day = @course.lecture_days.build
    @quick_points = @course.quick_points.build
    @designated_points = @course.designated_points.build
 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    @current_user = User.find_by_id(session[:user_id])
    session[:course_id] = @course.id

    if @course.user_id == @current_user.id
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
    else
      redirect_to login_url, notice: "Not Authorized"
    end
  end

  # POST /courses
  # POST /courses.json
  def create
     if (params[:course])
        @course = Course.new(params[:course])
        @user = User.find_by_id(session[:user_id])
     else
        params[:course] = {:name=>params[:title], 
                            :f_day=>params[:description],   
                            :l_day=>params[:price]
                            }
        @course = Course.new(params[:course])
        @course.user_id = session[:user_id]
    end
    
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: courses_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    
    if (!params[:course])
     params[:course] = {:name=>params[:title], 
                            :f_day=>params[:description],   
                            :l_day=>params[:price]
                            }   
    end

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
  
  def take_attendance
    @course = Course.find(params[:id])
    @attendance = @course.attendances.build 
    @course = Course.find(params[:id])
    @current_user = User.find_by_id(session[:user_id])


    if @course.user_id == @current_user.id
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
    else
      redirect_to login_url, notice: "Not Authorized"
    end
  end
  
  def statistic
    @course = Course.includes(students: :attendances).find(params[:id])
    @current_user = User.find_by_id(session[:user_id])
    @students = @course.students.paginate page: params[:page], order: 'lname asc', per_page: 25


    if @course.user_id == @current_user.id
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
    else
      redirect_to login_url, notice: "Not Authorized"
    end
  end
  
  def points
    @course = Course.find(params[:id])
    @pass_q_point = @course.pass_q_points.build 
  end
  
end