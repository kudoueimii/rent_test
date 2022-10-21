class LocalStationsController < ApplicationController
  before_action :set_local_station, only: %i[ show edit update destroy ]

  # GET /local_stations or /local_stations.json
  def index
    @local_stations = LocalStation.all
  end

  # GET /local_stations/1 or /local_stations/1.json
  def show
  end

  # GET /local_stations/new
  def new
  end

  # GET /local_stations/1/edit
  def edit
  end

  # POST /local_stations or /local_stations.json
  def create
    @local_station = LocalStation.new(local_station_params)
    
    respond_to do |format|
      if @local_station.save
        format.html { redirect_to @local_station, notice: "Local station was successfully created." }
        format.json { render :show, status: :created, location: @local_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @local_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_stations/1 or /local_stations/1.json
  def update
    respond_to do |format|
      if @local_station.update(local_station_params)
        format.html { redirect_to @local_station, notice: "Local station was successfully updated." }
        format.json { render :show, status: :ok, location: @local_station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @local_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_stations/1 or /local_stations/1.json
  def destroy
    @local_station.destroy
    respond_to do |format|
      format.html { redirect_to local_stations_url, notice: "Local station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_local_station
    @local_station = LocalStation.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def local_station_params
    params.require(:local_station).permit(:line, :station, :distance)
  end
end
