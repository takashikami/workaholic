class OffsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_off, only: [:show, :edit, :update, :destroy]

  # GET /offs
  # GET /offs.json
  def index
    @fy = params[:fy] ? params[:fy].to_i : to_fy(Date.today)
    @offs = current_user.offs.where(fy:@fy).order(:off_date)

    @offs0 = @offs.where(off_type:0).order(:off_date)
    @offs1 = @offs.where(off_type:1).order(:off_date)
    @offs2 = @offs.where(off_type:2).order(:off_date)

  end

  # GET /offs/1
  # GET /offs/1.json
  def show
  end

  # GET /offs/new
  def new
    @off = current_user.offs.new
    @off.subject = '私用'
  end

  # GET /offs/1/edit
  def edit
  end

  # POST /offs
  # POST /offs.json
  def create
    @off = current_user.offs.new(off_params)
    calc_off

    respond_to do |format|
      if @off.save
        format.html { redirect_to offs_url, notice: 'Off was successfully created.' }
        format.json { render action: 'show', status: :created, location: @off }
      else
        format.html { render action: 'new' }
        format.json { render json: @off.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offs/1
  # PATCH/PUT /offs/1.json
  def update
    @off.assign_attributes(off_params)
    calc_off

    respond_to do |format|
      if @off.save
        format.html { redirect_to offs_url, notice: 'Off was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @off.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offs/1
  # DELETE /offs/1.json
  def destroy
    @off.destroy
    respond_to do |format|
      format.html { redirect_to offs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_off
      @off = Off.find(params[:id])
      @off = nil if @off.user_id != current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def off_params
      params.require(:off).permit(:off_date, :subject, :off_type, :off_half_type, :off_quarter_time)
    end

  # helper
  def to_fy(date)
    date.year - (date.month < 4 ? 1 : 0)
  end

  def calc_off
    @off.off_days = 1.0 / (2**@off.off_type)
    @off.off_half_type = nil unless @off_type == 1
    @off.off_quarter_time = nil unless @off.off_type == 2
    @off.fy = to_fy(@off.off_date)
    @off
  end
end
