class VolumesController < ApplicationController
  before_action :set_volume, only: [:show, :edit, :update, :destroy]

  # GET /volumes
  # GET /volumes.json
  def index
    @volumes = Volume.all
  end

  # GET /volumes/1
  # GET /volumes/1.json
  def show
  end

  # GET /volumes/new
  def new
    @volume = Volume.new
  end

  # GET /volumes/1/edit
  def edit
  end

  # POST /volumes
  # POST /volumes.json
  def create
    @volume = Volume.new(volume_params)

    respond_to do |format|
      if @volume.save
        format.html { redirect_to @volume, notice: 'Volume was successfully created.' }
        format.json { render :show, status: :created, location: @volume }
        LogService::Write.action('Create','volume', current_user.email)
      else
        format.html { render :new }
        format.json { render json: @volume.errors, status: :unprocessable_entity }
        LogService::Write.action('Try create', 'volume', current_user.email )
      end
    end
  end

  # PATCH/PUT /volumes/1
  # PATCH/PUT /volumes/1.json
  def update
    respond_to do |format|
      if @volume.update(volume_params)
        format.html { redirect_to @volume, notice: 'Volume was successfully updated.' }
        format.json { render :show, status: :ok, location: @volume }
        LogService::Write.action('Update', 'volume', current_user.email)
      else
        format.html { render :edit }
        format.json { render json: @volume.errors, status: :unprocessable_entity }
        LogService::Write.action('Try Update', current_user.email)
      end
    end
  end

  # DELETE /volumes/1
  # DELETE /volumes/1.json
  def destroy
    @volume.destroy
    respond_to do |format|
      format.html { redirect_to volumes_url, notice: 'Volume was successfully destroyed.' }
      LogService::Write.action('Destroyed', 'volume', current_user.email)
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volume
      @volume = Volume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volume_params
      params.fetch(:volume, {})
    end
end
