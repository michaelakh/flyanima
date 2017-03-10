class AirlinesController < ApplicationController
  before_action :set_airline, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:autocomplete]

  def autocomplete
    render json: Airline.search(params[:term], {
      fields: ["name","iata","comments"],
      where: {iata:{not: nil}, DST: ["E","A","O","Z"]},
      boost_where: {name: "All Airports"},
      match: :word_start,
      limit: 11,
      load: false,
      misspellings: {below: 2}
    }).map{|f| "#{f.city}, (#{f.iata}), #{f.name} - #{f.country}"}
  end
    
  # GET /airlines
  # GET /airlines.json
  def index
    @airlines = Airline.all
  end

  def import
    Airline.import(params[:file])
    redirect_to root_url, notice: "Airports information imported."
  end

  # GET /airlines/1
  # GET /airlines/1.json
  def show
  end

  # GET /airlines/new
  def new
    @airline = Airline.new
  end

  # GET /airlines/1/edit
  def edit
  end

  # POST /airlines
  # POST /airlines.json
  def create
    @airline = Airline.new(airline_params)

    respond_to do |format|
      if @airline.save
        format.html { redirect_to @airline, notice: 'Airline was successfully created.' }
        format.json { render :show, status: :created, location: @airline }
      else
        format.html { render :new }
        format.json { render json: @airline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airlines/1
  # PATCH/PUT /airlines/1.json
  def update
    respond_to do |format|
      if @airline.update(airline_params)
        format.html { redirect_to @airline, notice: 'Airline was successfully updated.' }
        format.json { render :show, status: :ok, location: @airline }
      else
        format.html { render :edit }
        format.json { render json: @airline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airlines/1
  # DELETE /airlines/1.json
  def destroy
    @airline.destroy
    respond_to do |format|
      format.html { redirect_to airlines_url, notice: 'Airline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airline
      @airline = Airline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airline_params
      params.require(:airline).permit(:name, :iata, :phone_no, :contact_link, :pet_info_link, :comments)
    end
end
