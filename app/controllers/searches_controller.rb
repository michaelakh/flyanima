class SearchesController < ApplicationController
    def index
    end
    
    def show
        #Prepare data for Google QPX Api Call
        @depart_city_ita = params[:query].split(/, \(/)[1][0..2]
           
        @arrive_city_ita = params[:query2].split(/, \(/)[1][0..2]
        @date_leave = params[:datetime_leave]
        @date_return = params[:datetime_return]
        @adult = params[:adult]
        @child = params[:child]
        
        
    @response = HTTP.post('https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyCizuMFFkD3mMU1Ng9p6nJ0kaT_7b0_5Dw', :json => {
      "request": {
        "slice": [
          {
            "origin": "#{@depart_city_ita}",
            "destination": "#{@arrive_city_ita}",
            "date": "2017-02-27"
          }
        ],
        "passengers": {
          "adultCount": 1,
          "infantInLapCount": 0,
          "infantInSeatCount": 0,
          "childCount": 0,
          "seniorCount": 0
        },
        "solutions": 20,
        "refundable": false
      }
    })
        
        
    end
    
    def search
    end
end
