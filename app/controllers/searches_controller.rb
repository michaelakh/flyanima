class SearchesController < ApplicationController
    
    
    def index
        #Prepare data for Google QPX Api Call
        
        #test to see if an adult is going on the trip
        if params[:adult] == nil || params[:adult] == 0
            redirect_to root_uri, notice: "Please select atleast <b>1</b> adult for the trip"
        else
           @adult = params[:adult] 
        end
        
        @child = params[:child]
        
        #search for empty iata records (UPDATE, Must store these records as something to fix later on)
        if @depart_city_ita == "), "
          @depart_city_ita = params[:query].split(/\), /)
          #After finding empty iata records airport name, search other database for the iata name, update the main database and send it in googles api
        elsif @arrive_city_ita == "), "
          @depart_city_ita = params[:query].split(/,/)[0]
          #After finding empty iata records airport name, search other database for the iata name, update the main database and send it in googles api
        else
            #Prepare the Json Request
            i = 0;

            @slice = Array.new

            params[:query].each do |x, y|
                i = i + 1
                j = i + 1
                origin = ""

                #Check if origin was passed in
                if y["query_#{i}_1"] != nil
                    origin = y["query_#{i}_1"].split(/, \(/)[1][0..2]
                    @origin = origin
                else
                    redirect_to root_uri, notice: "Please complete the 'coming from' field"
                end

                #Check if a destination was passed in
                if y["query_#{i}_2"] != nil
                    destination = y["query_#{i}_2"].split(/, \(/)[1][0..2]
                    @destination = destination
                else
                    redirect_to root_uri, notice: "Please complete the 'going to' field"
                end

                #check if different dates were set (OHIOZE AKHAZEMEA UPDATE THIS)
                if params["query_#{i}_date_l"] == params["query_#{j}_date_l"]

                    redirect_to root_url, notice: "You can't leave and return on the same day"
                end  
                if params["query_#{i}_date_l"] != nil

                    date_leave = params["query_#{i}_date_l"]
                    @departure_first = params["query_1_date_l"]
                    @departure_last = date_leave
                else
                    redirect_to root_uri, notice: "Please set a leaving date"
                end

                @slice.push "origin" => origin, "destination" => destination, "date" => date_leave

                if params["query_#{j}_date_r"] != nil
                    date_return = params["query_#{j}_date_r"]

                    @slice.push "origin" => destination, "destination" => origin, "date" => date_return 

                    @departure_last = date_return
                end
            end
            @request = {}
            @request["request"] = {}
            @request["request"]["slice"] = {}
            @request["request"]["slice"] = @slice
            @request["request"].store("passengers", ["adultCount" => @adult, "childCount" => @child]) 
            @request["request"].store("solutions", 20)
            @request["request"].store("refundable", false)
                
        
        @json_request = @request
        @httprequest = HTTP.post('https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyCizuMFFkD3mMU1Ng9p6nJ0kaT_7b0_5Dw', :json => @json_request)
        
        @response = JSON.parse(@httprequest)
        @airport = Hash.new 
        @aircraft = Hash.new 
        @carrier = Hash.new 
        @city = Hash.new 
        @tax = Hash.new   
        @response["trips"]["data"]["airport"].each do |a|
        @airport.store(a["code"], a["name"])
        end 
        @response["trips"]["data"]["aircraft"].each do |a|
        @aircraft.store(a["code"], a["name"])
        end 
        @response["trips"]["data"]["carrier"].each do |c|
        @carrier.store(c["code"], c["name"])
        end 
        @response["trips"]["data"]["city"].each do |c|
        @city.store(c["code"], c["name"])
        end
        @response["trips"]["data"]["tax"].each do |t|
        @tax.store(t["id"], t["name"])
        end 
        @baseprice = @response["trips"]["tripOption"][0]["saleTotal"][3..8]
        end
    end

    def show
    end
    
    def search
    end
end