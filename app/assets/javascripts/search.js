
  function show_details(){
      event.target.parentNode.parentNode.childNodes[1].className = "extra-info-details-wrapper on";   
      event.target.parentNode.parentNode.childNodes[2].className = "extra-info-fares-wrapper off";
      event.target.className = "extra-info-menu on";
      event.target.parentNode.childNodes[1].className = "extra-info-menu off";
  }

    function show_fares(){
        event.target.parentNode.parentNode.childNodes[2].className = "extra-info-fares-wrapper on";
        event.target.parentNode.parentNode.childNodes[1].className = "extra-info-details-wrapper off";
        event.target.className = "extra-info-menu on"
        event.target.parentNode.childNodes[0].className = "extra-info-menu off";
  }

//show page

function getTripSearchData() {
    try {
    var content = ""; 
    var m = 0;
      for(n=0;n < Object.keys(response['slice']).length; n++) {
                    if (m == 0) {
                    content += "<h2 class='extra-info-title'>" +
                                    "Depart" +
                               "</h2>";
                    }
                    else if (m == 1) {
                        content += "<h2 class='extra-info-title'>" +
                                        "Return" +
                                   "</h2>";
                    }

                    for(o=0; o < Object.keys(response['slice'][n]['segment']).length;o++){
                        content += "<div class='extra-info-body'>" +
                            "<div class='flight-time sb-container'>" +
                                "<div class='flight-carrier'>";
                                for(k=0; k < Object.keys(data['carrier']).length; k++) {
                                    if(data['carrier'][k]['code'] == response['slice'][n]['segment'][o]['flight']['carrier']) {
                                       content += data['carrier'][k]['name'];
                                    }
                                }
                                content += "</div>" +
                                "<div class='flight-time flightDepart'>" +
                                    "<span class='flight-destination'>" +
                                response['slice'][n]['segment'][o]['leg'][0]["departureTime"].substring(11,16) +
                                "</span> - " +
                                "<span class='flight-destination-iata'>" +
                                    response['slice'][n]['segment'][o]['leg'][0]["origin"] +
                                    "<span class='flight-destination-name'>";
                                    for(k=0; k < Object.keys(data['airport']).length; k++) {

                                        if(data['airport'][k]['code'] == response['slice'][n]['segment'][o]['leg'][0]["origin"]) {
                                           content += data['airport'][k]['name']
                                        }
                                    }
                                    content += "</span><span class='flight-desc-pointer'></span>" +
                                "</span>" +
                                "</div>" +
                                "<div class='flight-time arrow'>&#8594;</div>" +
                                "<div class='flight-time flightDepart'>" +
                                    "<span class='flight-destination'>" +
                                        response['slice'][n]['segment'][o]['leg'][0]["arrivalTime"].substring(11,16) +
                                    "</span> - " +
                                    "<span class='flight-destination-iata'>" +
                                        response['slice'][n]['segment'][o]['leg'][0]["destination"] +
                                     "<span class='flight-destination-name'>";
                                    for(k=0; k < Object.keys(data['airport']).length; k++) {

                                        if(data['airport'][k]['code'] == response['slice'][n]['segment'][o]['leg'][0]["destination"]) {
                                           content += data['airport'][k]['name']
                                        }
                                    }
                                    content += "</span><span class='flight-desc-pointer'></span>" +
                                    "</span>" +
                                "</div>" +

                                "<div class='flight-time flight-duration'>" +
                                   "<span class='flight-grey'>" + 
                                    Math.floor(response['slice'][n]['segment'][o]["duration"]/60).toString() + 
                                    "hr" + 
                                    (response['slice'][n]['segment'][o]["duration"] % 60 ) +
                                    "m" +
                                    "</span>" +
                                "</div>" +
                                "<div class='flight-time'>" +
                                    "<span class='flight-grey'>" +
                                    moment(response['slice'][n]['segment'][o]['leg'][0]["departureTime"]).format("MMM Do YY") +
                                    "</span>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                    }

                    m = m + 1;
                }
    return content;
    } catch (e) {
        return "<b class='red-important'>this search result has expired, please make another search</b> <p> read the information bellow for general advice on pet travel </p>"
    }
}

function getContactLink() {
            
    preParams = parseURLParams(window.location.href)

    params = "passenger%5Badult%5D="+preParams["passenger[adult]"] +
             "&passenger%5Bchild%5D="+preParams["passenger[child]"]+
             "&passenger%5Bdogs%5D="+preParams["passenger[dogs]"]+
             "&passenger%5Bcats%5D="+preParams["passenger[cats]"]+
             "&passenger%5Bother_pet%5D="+preParams["passenger[other_pet]"];

    r = 0;
    iata = [];

    for(s=0;s < Object.keys(response['slice']).length; s++) {
        for(t=0; t < Object.keys(response['slice'][s]['segment']).length;t++){
                if(iata[iata.length - 1] != response['slice'][s]['segment'][t]['flight']['carrier']){
                   iata[iata.length] = response['slice'][s]['segment'][t]['flight']['carrier'];
                }
        } 
    }
    for(u=0;u < iata.length;u++){
        params += "&iata["+u+"]="+iata[u];
    }

    url = window.location.href.split("search_show")[0]+"contact/airlines?"+params;
    
        window.location.href = url
}

