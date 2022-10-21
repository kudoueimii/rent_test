class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
    @local_stations = LocalStation.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    # @property = Property.find(property_params[:id])
    # @local_station = LocalStation.find(local_station_params[:id])
  end

  # GET /properties/new
  def new
    @property = Property.new
    @property.local_stations.build
  end

  # GET /properties/1/edit
  def edit
    @property.local_stations.build
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    @property.local_stations.build
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    def set_local_station
      @local_station = LocalStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(
        :name, 
        :rent, 
        :address, 
        :age, 
        :note,
        local_stations_attributes: [:line, :station, :distance, :property_id, :id, :destroy]
      )
    end
end
