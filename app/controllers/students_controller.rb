class StudentsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  # GET /students
  # GET /students.json
  def index
    @current_user = User.find_by_id(session[:user_id])
    #@students = Student.paginate page: params[:page], order: 'created_at desc', per_page: 25
    @course = Course.find_by_id(session[:course_id])
    @students = @current_user.students.paginate page: params[:page], order: 'lname asc', per_page: 25
  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    @course = Course.find_by_id(session[:course_id])
    @pass_d_points = @student.pass_d_points.paginate page: params[:page], order: 'created_at desc', per_page: 15

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new
    @course = Course.find_by_id(session[:course_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    @course = Course.find_by_id(session[:course_id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])
    @course = Course.find_by_id(session[:course_id])
    
    
    
     if (params[:student])
        @student = Student.new(params[:student])
        @user = User.find_by_id(session[:user_id])
        @course = Course.find_by_id(session[:course_id])
     else
        params[:student] = {:fname=>params[:fname], 
                            :lname=>params[:lname],   
                            :preferred_name=>params[:preferred_name],   
                            :student_no=>params[:student_no]
                            }
        @student = Student.new(params[:student])
        @student.course_id = session[:course_id]
        
    end
    if @student.student_no == nil
      @student.student_no = 0
    end
    @student.points = 0

    respond_to do |format|
      if @student.save
        format.html { redirect_to @course, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])
    @course = Course.find_by_id(session[:course_id])
    
    if (!params[:student])
     params[:student] = {:fname=>params[:fname], 
                            :lname=>params[:lname],   
                            :preferred_name=>params[:preferred_name],   
                            :student_no=>params[:student_no],
                            :points=>params[:points]
                            }    
    end

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @course, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /students/1
  # PUT /students/1.json
  def decrease
    @course = Course.find_by_id(session[:course_id])
    @student= @course.decrease(params[:id])
    

    respond_to do |format|
      if @student.save
        format.html { redirect_to @course, notice: 'Student points successfully decreased.' }
        format.js   { @current_student = @student }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def increase
    @course = Course.find_by_id(session[:course_id])
    @student= @course.increase(params[:id])
    

    respond_to do |format|
      if @student.save
        format.html { redirect_to @course, notice: 'Student points successfully increased' }
        format.js   { @current_student = @student }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /students/1
  # PUT /students/1.json
  def dp
    @course = Course.find_by_id(session[:course_id])
    @student= @course.dp(params[:id])
    @designated_point = DesignatedPoint.find_by_id(params[:pts])
    session[:d_id] = @designated_point.id
    @num = @designated_point.num
    
    if @student.points != nil
      @student.points += @num.to_f
    else
      @student.points = @num.to_f
    end
    respond_to do |format|
      if @student.save
        format.html { redirect_to @course, notice: 'Designated points successfully updated' }
        format.js   { @current_student = @student }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    @course = Course.find_by_id(session[:course_id])

    respond_to do |format|
      format.html { redirect_to @course }
      format.json { head :no_content }
    end
  end
  # import class method
  def import
    Student.import(params[:file])
    redirect_to students_url, notice: "Students imported."
  end
  
end