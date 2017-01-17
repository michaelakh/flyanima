class SearchesController < ApplicationController
    def index
    end
    
    def show
        #Prepare data for Google QPX Api Call
        if params[:type] == "OW"
        elsif params[:type] == "R"
        elsif params[:type] == "M"
        end
        @date_leave = params[:datetime_leave_1]
        @date_return = params[:datetime_return_1]
        @adult = params[:adult]
        @child = params[:child]
            
        
            
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
        query_count = params[:query].count
        params[:query].each do |x, y|
            i = i + 1
            j = i + 1
            origin = ""
            
            if y["query_#{i}_1"] != nil
                origin = y["query_#{i}_1"].split(/, \(/)[1][0..2]
            end
                
            if y["query_#{i}_2"] != nil
                destination = y["query_#{i}_2"].split(/, \(/)[1][0..2]
            date = y["query_#{i}_2"]
            end
            if params["query_#{i}_date_l"] == params["query_#{j}_date_l"]
                redirect_to root_url, notice: "You can't leave and return on the same day"
            elsif params["query_#{i}_date_l"] != nil
                date_leave = params["query_#{i}_date_l"]
            end
            
            @slice.push "origin" => origin, "destination" => destination, "date" => date_leave
                
            if params[:type][:pass_confirm] == "r"
                date_return = params["query_#{j}_date_l"]
                @slice.push "origin" => destination, "destination" => origin, "date" => date_return 
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
        end
    end
    
    def search
    end
end