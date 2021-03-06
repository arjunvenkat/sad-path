class RoadblocksController < ApplicationController
  before_action :check_if_signed_in
  before_action :set_roadblock, only: [:show, :edit, :update, :destroy, :need_help, :solved_it, :add_sol, :not_solved, :update_sol]
  before_action :check_if_authorized, only: [:edit, :update, :destroy]

  def need_help
    @roadblock.need_help = true
    @roadblock.save
    session[:roadblock_id] = nil
    redirect_to roadblocks_url
  end

  def solved_it
    @roadblock.solved = true
    @roadblock.need_help = false
    @roadblock.save
    redirect_to :back
  end

  def not_solved
    @roadblock.solved = false
    @roadblock.save
    redirect_to :back
  end

  def add_sol
    c = Check.create(description: params[:solution])
    RoadblockCheck.create(check_id: c.id, roadblock_id: @roadblock.id, completed_at: DateTime.now, solved_it: true)
    session[:roadblock_id] = nil
    redirect_to :back, notice: "Solution successfully added"
  end

  def update_sol
    c = Check.find_by_id(params[:check_id])
    c.description = params[:solution]
    c.save

    redirect_to :back, notice: "Solution successfully updated"
  end

  def longlist
    @roadblocks = Roadblock.order(created_at: :desc)
  end

  # GET /roadblocks
  # GET /roadblocks.json
  def index
    current_course = Course.find(session[:course_id])
    @roadblocks = current_course.roadblocks.order(created_at: :desc)
  end

  # GET /roadblocks/1
  # GET /roadblocks/1.json
  def show
  end

  # GET /roadblocks/new
  def new
    @roadblock = Roadblock.new
  end

  def new_conceptual
    @roadblock = Roadblock.new
  end

  def new_bug
    @roadblock = Roadblock.new
  end

  # GET /roadblocks/1/edit
  def edit
  end

  # POST /roadblocks
  # POST /roadblocks.json
  def create
    @roadblock = Roadblock.new(roadblock_params)
    @roadblock.user1_id = @user.id
    @roadblock.course_id = current_course.id
    @roadblock.enrollment_id = current_enrollment.id
    respond_to do |format|
      if @roadblock.save
        format.html { redirect_to '/' }
        format.json { render action: 'show', status: :created, location: @roadblock }
      else
        format.html { render action: 'new' }
        format.json { render json: @roadblock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roadblocks/1
  # PATCH/PUT /roadblocks/1.json
  def update
    respond_to do |format|
      if @roadblock.update(roadblock_params)
        format.html { redirect_to @roadblock, notice: 'Roadblock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @roadblock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roadblocks/1
  # DELETE /roadblocks/1.json
  def destroy
    @roadblock.destroy
    respond_to do |format|
      format.html { redirect_to "/roadblocks-dash" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_roadblock
      @roadblock = Roadblock.find(params[:id])
    end

    def check_if_signed_in
      unless session[:user_id]
        redirect_to "/login", notice: "Please sign in first"
      end
      @user = User.find(session[:user_id])
    end

    def check_if_authorized
      roadblock = Roadblock.find(params[:id])
      user = User.find_by_id(session[:user_id])
      unless roadblock.user1_id == user.id || current_enrollment.instructor == true
        redirect_to "/roadblocks", notice: "You can only access roadblocks you've created"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roadblock_params
      params.require(:roadblock).permit(:error_message, :code_snippet, :description, :solution, :user1_id, :user2_id)
    end
end
