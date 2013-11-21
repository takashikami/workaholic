class OverworksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_overwork, only: [:show, :edit, :update, :destroy]

  # GET /overworks
  # GET /overworks.json
  def index
    shimebi = 20
    m = Date.today
    if m.day > shimebi
      @me = Date.new(m.year, m.month+1, shimebi)
    else
      @me = Date.new(m.year, m.month, shimebi)
    end
    @ms = @me - 1.month + 1.day

    #@overworks = current_user.overworks
    overworks = Overwork.where(user_id: current_user.id, work_date: @ms..@me).order(:work_date)

    ak = (@ms..@me).to_a
    av = Array.new(ak.size, nil)
    @overworks = Hash[*[ak,av].transpose.flatten]
    logger.error @overworks
    overworks.each do |overwork|
      @overworks[overwork.work_date] = overwork
    end

  end

  # GET /overworks/1
  # GET /overworks/1.json
  def show
  end

  # GET /overworks/new
  def new
    work_date = params[:work_date]
    work_date ||= Date.today
    @overwork = Overwork.where(user_id: current_user.id, work_date: work_date).first
    if @overwork.nil? then
      @overwork = current_user.overworks.new
      @overwork.work_date = work_date
      @overwork.work_start_time = Time.new(0)+18*3600
      @overwork.work_finish_time = Time.new(0)+18*3600
    end
  end

  # GET /overworks/1/edit
  def edit
  end

  # POST /overworks
  # POST /overworks.json
  def create
    #@overwork = Overwork.new(overwork_params)
    @overwork = current_user.overworks.new(overwork_params)
    @overwork.work_hours = (@overwork.work_finish_time - @overwork.work_start_time)/3600
    respond_to do |format|
      if @overwork.save
        format.html { redirect_to overworks_path, notice: 'Overwork was successfully created.' }
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
      @overwork.assign_attributes(overwork_params)
      @overwork.work_hours = (@overwork.work_finish_time - @overwork.work_start_time)/3600
      if @overwork.save
        format.html { redirect_to overworks_path, notice: 'Overwork was successfully updated.' }
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
      @overwork = nil if @overwork.user_id != current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overwork_params
      params.require(:overwork).permit(:work_date, :subject, :work_start_time, :work_finish_time, :comment)
    end
end
