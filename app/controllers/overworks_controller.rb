class OverworksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_overwork, only: [:show, :edit, :update, :destroy]

  # GET /overworks
  # GET /overworks.json
  def index
    #@overworks = Overwork.all
    @overworks = current_user.overworks
  end

  # GET /overworks/1
  # GET /overworks/1.json
  def show
  end

  # GET /overworks/new
  def new
    #@overwork = Overwork.new
    @overwork = current_user.overworks.new
  end

  # GET /overworks/1/edit
  def edit
  end

  # POST /overworks
  # POST /overworks.json
  def create
    #@overwork = Overwork.new(overwork_params)
    @overwork = current_user.overworks.new(overwork_params)

    respond_to do |format|
      if @overwork.save
        format.html { redirect_to @overwork, notice: 'Overwork was successfully created.' }
        format.json { render action: 'show', status: :created, location: @overwork }
      else
        format.html { render action: 'new' }
        format.json { render json: @overwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overworks/1
  # PATCH/PUT /overworks/1.json
  def update
    respond_to do |format|
      if @overwork.update(overwork_params)
        format.html { redirect_to @overwork, notice: 'Overwork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @overwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overworks/1
  # DELETE /overworks/1.json
  def destroy
    @overwork.destroy
    respond_to do |format|
      format.html { redirect_to overworks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overwork
      @overwork = Overwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overwork_params
      params.require(:overwork).permit(:work_date, :subject, :work_start_time, :work_finish_time, :comment)
    end
end
