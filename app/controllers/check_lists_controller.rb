class CheckListsController < ApplicationController
  before_action :set_check_list, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:update, :destroy]


  # GET /check_lists
  # GET /check_lists.json
  def index
    @check_lists = CheckList.all
  end

  # GET /check_lists/1
  # GET /check_lists/1.json
  def show
  end

  # GET /check_lists/new
  def new
    @check_list = CheckList.new
  end

  # GET /check_lists/1/edit
  def edit
  end

  # POST /check_lists
  # POST /check_lists.json
  def create
    @check_list = CheckList.new(check_list_params)

    respond_to do |format|
      if @check_list.save
        if params[:new_check_list_item][:id].present?
          @check_list.check_list_items.create(check_id: params[:new_check_list_item][:id])
        end
        format.html { redirect_to @check_list, notice: 'Check list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @check_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_lists/1
  # PATCH/PUT /check_lists/1.json
  def update
    if params[:new_check_list_item][:id].present?
      @check_list.check_list_items.create(check_id: params[:new_check_list_item][:id])
    end
    if params[:cli]
      params[:cli].each do |cli_array|
        cli = CheckListItem.find(cli_array[0].to_i)
        cli.position = cli_array[1].to_i
        cli.save
      end
    end

    respond_to do |format|
      if @check_list.update(check_list_params)
        format.html { redirect_to :back, notice: 'Check list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_lists/1
  # DELETE /check_lists/1.json
  def destroy
    @check_list.destroy
    respond_to do |format|
      format.html { redirect_to check_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def check_if_admin
      unless current_user.admin
        redirect_to "/login"
      end
    end

    def set_check_list
      @check_list = CheckList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_list_params
      params.require(:check_list).permit(:name)
    end
end
