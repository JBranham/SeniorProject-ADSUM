class DesignatedPointsController < ApplicationController
  # GET /designated_points
  # GET /designated_points.json
  def index
    @designated_points = DesignatedPoint.all
    @course = Course.find_by_id(session[:course_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @designated_points }
    end
  end
  

  # GET /designated_points/1
  # GET /designated_points/1.json
  def show
    @designated_point = DesignatedPoint.find(params[:id])
    @course = Course.find_by_id(session[:course_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @designated_point }
    end
  end

  # GET /designated_points/new
  # GET /designated_points/new.json
  def new
    @designated_point = DesignatedPoint.new
    @course = Course.find_by_id(session[:course_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @designated_point }
    end
  end
  
  
  
  

  # GET /designated_points/1/edit
  def edit
    @designated_point = DesignatedPoint.find(params[:id])
    @course = Course.find_by_id(session[:course_id])
  end

  # POST /designated_points
  # POST /designated_points.json
  def create
    @designated_point = DesignatedPoint.new(params[:designated_point])
    @course = Course.find_by_id(session[:course_id])
    respond_to do |format|
      if @designated_point.save
        format.html { redirect_to @designated_point, notice: 'Designated point was successfully created.' }
        format.json { render json: @designated_point, status: :created, location: @designated_point }
      else
        format.html { render action: "new" }
        format.json { render json: @designated_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /designated_points/1
  # PUT /designated_points/1.json
  def update
    @designated_point = DesignatedPoint.find(params[:id])
    @course = Course.find_by_id(session[:course_id])
    respond_to do |format|
      if @designated_point.update_attributes(params[:designated_point])
        format.html { redirect_to @designated_point, notice: 'Designated point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @designated_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designated_points/1
  # DELETE /designated_points/1.json
  def destroy
    @designated_point = DesignatedPoint.find(params[:id])
    @designated_point.destroy

    respond_to do |format|
      format.html { redirect_to designated_points_url }
      format.json { head :no_content }
    end
  end
end
