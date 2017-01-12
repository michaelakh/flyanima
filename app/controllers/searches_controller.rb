class SearchesController < ApplicationController
    def index
    end
    
    def show
        #Prepare data for Google QPX Api Call
        if params[:type] == "OW"
        elsif params[:type] == "R"
        elsif params[:type] == "M"
        end
        #@depart_city_ita = params[:query1_1].split(/, \(/)[1][0..2]
           
        #@arrive_city_ita = params[:query1_2].split(/, \(/)[1][0..2]
        @date_leave = params[:datetime_leave]
        @date_return = params[:datetime_return]
        @adult = params[:adult]
        @child = params[:child]
            
        #Prepare the Json Request
        @json_req = {request: 
                [
                    slice:
                    [
                        origin: @depart_city_ita, 
                        destination: @arrive_city_ita,
                        date: @date_leave
                    ],
                    passengers:
                    [
                        adultCount: @adult,
                        childCount: @child
                    ],
                    solutions: 20,
                    refundable: false
                ]}
            
        if @depart_city_ita == "), "
          @depart_city_ita = params[:query].split(/\), /)
          #After finding empty iata records airport name, search other database for the iata name, update the main database and send it in googles api
        elsif @arrive_city_ita == "), "
          @depart_city_ita = params[:query].split(/,/)[0]
          #After finding empty iata records airport name, search other database for the iata name, update the main database and send it in googles api
        else
        params[:querys].each do |x, y|
            @test = y[:query1_1]
        end
        @response = @test
            
            #HTTP.post('https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyCizuMFFkD3mMU1Ng9p6nJ0kaT_7b0_5Dw', :json => #@json_req)
           
        end
    end
    
    def search
    end
end
