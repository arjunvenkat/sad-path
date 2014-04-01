class CourseCheckListsController < ApplicationController
  before_action :set_course_check_list, only: [:show, :edit, :update, :destroy]

  # GET /course_check_lists
  # GET /course_check_lists.json
  def index
    @course_check_lists = CourseCheckList.all
  end

  # GET /course_check_lists/1
  # GET /course_check_lists/1.json
  def show
  end

  # GET /course_check_lists/new
  def new
    @course_check_list = CourseCheckList.new
  end

  # GET /course_check_lists/1/edit
  def edit
  end

  # POST /course_check_lists
  # POST /course_check_lists.json
  def create
    @course_check_list = CourseCheckList.new(course_check_list_params)

    respond_to do |format|
      if @course_check_list.save
        format.html { redirect_to @course_check_list, notice: 'Course check list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_check_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @course_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_check_lists/1
  # PATCH/PUT /course_check_lists/1.json
  def update
    respond_to do |format|
      if @course_check_list.update(course_check_list_params)
        format.html { redirect_to @course_check_list, notice: 'Course check list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_check_lists/1
  # DELETE /course_check_lists/1.json
  def destroy
    @course_check_list.destroy
    respond_to do |format|
      format.html { redirect_to course_check_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_check_list
      @course_check_list = CourseCheckList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_check_list_params
      params.require(:course_check_list).permit(:course_id, :check_list_id)
    end
end
