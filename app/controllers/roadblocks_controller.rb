class RoadblocksController < ApplicationController
  before_action :check_if_signed_in, only: [:create, :edit, :update, :destroy]
  before_action :set_roadblock, only: [:show, :edit, :update, :destroy]

  # GET /roadblocks
  # GET /roadblocks.json
  def index
    @roadblocks = Roadblock.all
  end

  # GET /roadblocks/1
  # GET /roadblocks/1.json
  def show
  end

  # GET /roadblocks/new
  def new
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
    if session[:user2_id]
      @roadblock.user2_id = session[:user2_id].to_i
    end
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
      format.html { redirect_to roadblocks_url }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def roadblock_params
      params.require(:roadblock).permit(:error_message, :code_snippet, :description, :solution, :user1_id, :user2_id)
    end
end
