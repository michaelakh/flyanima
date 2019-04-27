class CityAirportItaCodesController < ApplicationController
  before_action :set_city_airport_ita_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:autocomplete]
  
  def autocomplete
    render json: CityAirportItaCode.search(params[:query], {
      fields: [:code, :city, :airport, :country],
      order: {_score: :desc},
      limit: 11,
      load: false,
      misspellings: {below: 2}
    }).map{|f| "#{f.city}, (#{f.code}), #{f.airport}, #{f.country}"}.sort
  end
    
  # GET /city_airport_ita_codes
  # GET /city_airport_ita_codes.json
  def index
    @city_airport_ita_codes = CityAirportItaCode.all

    respond_to do |format|
      format.html
      format.json { render json: @city_airport_ita_codes.to_json }
    end
  end
    
  def import
    CityAirportItaCode.import(params[:file])
    redirect_to root_url, notice: "City, Airport, Country and ITA codes imported."
  end

  # GET /city_airport_ita_codes/1
  # GET /city_airport_ita_codes/1.json
  def show
  end

  # GET /city_airport_ita_codes/new
  def new
    @city_airport_ita_code = CityAirportItaCode.new
  end

  # GET /city_airport_ita_codes/1/edit
  def edit
  end

  # POST /city_airport_ita_codes
  # POST /city_airport_ita_codes.json
  def create
    @city_airport_ita_code = CityAirportItaCode.new(city_airport_ita_code_params)

    respond_to do |format|
      if @city_airport_ita_code.save
        format.html { redirect_to @city_airport_ita_code, notice: 'City airport ita code was successfully created.' }
        format.json { render :show, status: :created, location: @city_airport_ita_code }
      else
        format.html { render :new }
        format.json { render json: @city_airport_ita_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_airport_ita_codes/1
  # PATCH/PUT /city_airport_ita_codes/1.json
  def update
    respond_to do |format|
      if @city_airport_ita_code.update(city_airport_ita_code_params)
        format.html { redirect_to @city_airport_ita_code, notice: 'City airport ita code was successfully updated.' }
        format.json { render :show, status: :ok, location: @city_airport_ita_code }
      else
        format.html { render :edit }
        format.json { render json: @city_airport_ita_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_airport_ita_codes/1
  # DELETE /city_airport_ita_codes/1.json
  def destroy
    @city_airport_ita_code.destroy
    respond_to do |format|
      format.html { redirect_to city_airport_ita_codes_url, notice: 'City airport ita code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_airport_ita_code
      @city_airport_ita_code = CityAirportItaCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_airport_ita_code_params
      params.require(:city_airport_ita_code).permit(:code, :city, :airport, :country, :searches)
    end
end
