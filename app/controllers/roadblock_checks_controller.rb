class RoadblockChecksController < ApplicationController
  before_action :set_roadblock_check, only: [:show, :edit, :update, :destroy, :reopen]

  def reopen
    @roadblock_check.completed = false
    @roadblock_check.save
    redirect_to :back
  end

  # GET /roadblock_checks
  # GET /roadblock_checks.json
  def index
    @roadblock_checks = RoadblockCheck.all
  end

  # GET /roadblock_checks/1
  # GET /roadblock_checks/1.json
  def show
  end

  # GET /roadblock_checks/new
  def new
    @roadblock_check = RoadblockCheck.new
  end

  # GET /roadblock_checks/1/edit
  def edit
  end

  # POST /roadblock_checks
  # POST /roadblock_checks.json
  def create
    @roadblock_check = RoadblockCheck.new(roadblock_check_params)

    respond_to do |format|
      if @roadblock_check.save
        format.html { redirect_to @roadblock_check, notice: 'Roadblock check was successfully created.' }
        format.json { render action: 'show', status: :created, location: @roadblock_check }
      else
        format.html { render action: 'new' }
        format.json { render json: @roadblock_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roadblock_checks/1
  # PATCH/PUT /roadblock_checks/1.json
  def update
    respond_to do |format|
      if @roadblock_check.update(roadblock_check_params)
        format.html { redirect_to "/stuck"}
        format.json { head :no_content }
      else
        format.html { redirect_to "/stuck" }
        format.json { render json: @roadblock_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roadblock_checks/1
  # DELETE /roadblock_checks/1.json
  def destroy
    @roadblock_check.destroy
    respond_to do |format|
      format.html { redirect_to roadblock_checks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roadblock_check
      @roadblock_check = RoadblockCheck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roadblock_check_params
      params.require(:roadblock_check).permit(:check_id, :roadblock_id, :completed_at, :completed, :solved_it, :user_input)
    end
end
