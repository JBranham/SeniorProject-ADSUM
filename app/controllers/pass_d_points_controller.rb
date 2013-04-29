class PassDPointsController < ApplicationController
  # GET /pass_d_points
  # GET /pass_d_points.json
  def index
    @pass_d_points = PassDPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pass_d_points }
    end
  end

  # GET /pass_d_points/1
  # GET /pass_d_points/1.json
  def show
    @pass_d_point = PassDPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pass_d_point }
    end
  end

  # GET /pass_d_points/new
  # GET /pass_d_points/new.json
  def new
    @pass_d_point = PassDPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pass_d_point }
    end
  end

  # GET /pass_d_points/1/edit
  def edit
    @pass_d_point = PassDPoint.find(params[:id])
  end

  # POST /pass_d_points
  # POST /pass_d_points.json
  def create
    @pass_d_point = PassDPoint.new(params[:pass_d_point])
    @course = Course.find_by_id(session[:course_id])
    @student = Student.find_by_id(1)
    
    num = 3
   
      @student.points += num
  

    respond_to do |format|
      if @pass_d_point.save
        format.html { redirect_to @course, notice: 'Points Saved' }
        format.json { render json: @course, status: :created, location: @pass_d_point }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pass_d_points/1
  # PUT /pass_d_points/1.json
  def update
    @pass_d_point = PassDPoint.find(params[:id])

    respond_to do |format|
      if @pass_d_point.update_attributes(params[:pass_d_point])
        format.html { redirect_to @pass_d_point, notice: 'Pass d point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pass_d_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pass_d_points/1
  # DELETE /pass_d_points/1.json
  def destroy
    @pass_d_point = PassDPoint.find(params[:id])
    @pass_d_point.destroy

    respond_to do |format|
      format.html { redirect_to pass_d_points_url }
      format.json { head :no_content }
    end
  end
end
