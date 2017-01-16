//uss get('param') to return the value of a get request from current page. e.g get('action')
function get(name){
   if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
      return decodeURIComponent(name[1]);
}

//fixing jquery autocomplete width css
jQuery.ui.autocomplete.prototype._resizeMenu = function () {
  var ul = this.menu.element;
  ul.outerWidth(this.element.outerWidth() + 100);
}


///////////////////
//Flights search JS
//////////////////
//Twitter Typahead autocomplete
function typeahead_initialize() {
    var cityAirports = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
   
    remote: {
      url: '/airports/autocomplete?term=%QUERY',
      wildcard: '%QUERY',
    }
  });
    
    $('.query').typeahead(null, {
    source: cityAirports,
       limit: 10
  });
}

//Jquery ui autocomplete 
//$(document ).on('turbolinks:load', function() {
//   $( "#test" ).autocomplete({
//     source: "/airports/autocomplete.json",
//     icons: { submenu: "ui-icon-circle-triangle-e" }
//   });
// } );


////////////////////////
//get the date of today
////////////////////////

function todaysDate() {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();

        if(dd<10) {
            dd='0'+dd
        } 

        if(mm<10) {
            mm='0'+mm
        } 

        today = yyyy+'-'+mm+'-'+dd;
        return today;
}

$(document ).on('turbolinks:load', function(){
    var t = document.getElementsByClassName('twitter-typeahead').length;
    if(t == 0) {
        typeahead_initialize();
    }
    var i = 1;
    var x = document.getElementById('flights_title');
    var y = document.getElementById('returning');
    
    $("#button").click(function(){
        ++i;
        if(x.className === "form-col-xl-full off"){
            x.className = "form-col-xl-full on";
        }
        
        if(y.className === "form-col-3 on"){
            y.className = "form-col-3 off";
            y.innerHTML = "";
        }
        
        var today = todaysDate(); 
        var content = "<div class='form-col-xl-full on' id='flights_title'>" +
        "<h3 class='flight-search-title'>Flight " + i + "</h3>" +
        "</div>" +
        "<div class='form-col-6'>" + 
        "<label for='coming_from'>Coming From</label>" +
        "<input type='text' name='query[query" + i + "[query_" + i + "_1]]' class='query' placeholder='city or airport' />" +
        "</div>" +
        "<div class='form-col-6'>" +
        "<label for='going_to'>Going To</label>" +
        "<input type='text' name='query[query" + i + "[query_" + i + "_2]]' class='query' placeholder='city or airport' />" +
        "</div>" +
        "<div class='form-col-3'>" +
        "<label for='leaving'>Leaving</label>"   +
        "<input type='date' name='query_" + i + "_date_l' id='datetime_leave' value='"+today+"' />" +
        "</div>"   +
        "<div class='form-col-3'>"    +
        "</div>" +
        "<div class='form-col-f'>" +
        "</div>" ;
            
        $('.query').typeahead('destroy');
        $("#container").append(content);
        typeahead_initialize();
    });        
    
});