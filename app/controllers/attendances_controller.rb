class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.json
  def index
    @course = Course.find_by_id(session[:course_id])
    @attendances = @course.attendances.paginate page: params[:page], order: 'date desc', per_page: 25

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])
    @course = Course.find_by_id(session[:course_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance = Attendance.new
    @course = Course.find_by_id(session[:course_id])   

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
    @student = @attendance.student
    @course = @attendance.course
    @current_user = User.find_by_id(session[:user_id])
    
      if @course.user_id == @current_user.id
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
    else
      redirect_to attendances_path, notice: "Not Authorized"
    end
    
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(params[:attendance])
    @course = Course.find_by_id(session[:course_id])
    
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to take_attendance_course_path(@course.id), notice: 'Attendance was successfully created.' }
        format.js   { @current_attendance = @attendance }
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])
    @course = Course.find_by_id(session[:course_id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to attendances_path, notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    @course = Course.find_by_id(session[:course_id])

    respond_to do |format|
      format.html { redirect_to @course }
      format.json { head :no_content }
    end
  end
end