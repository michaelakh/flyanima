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

$(document ).on('turbolinks:load', function(){
    var i = 1;
    var x = document.getElementById('flights_title');
    $("#button").click(function(){
        ++i;
        if(x.className === "form-col-xl-full off"){
            x.className = "form-col-xl-full on"
        }
        var content = "<div class='form-col-xl-full on' id='flights_title'>" +
        "<h3 class='flight-search-title'>Flight " + i + "</h3>" +
        "</div>" +
        "<div class='form-col-6'>" + 
        "<label for='coming_from'>Coming From</label>" +
        "<input type='text' name='query_" + i + "_1' class='query' placeholder='city or airport' />" +
        "</div>" +
        "<div class='form-col-6'>" +
        "<label for='going_to'>Going To</label>" +
        "<input type='text' name='query_" + i + "_2' class='query' placeholder='city or airport' />" +
        "</div>" +
        "<div class='form-col-3'>" +
        "<label for='leaving'>Leaving</label>"   +
        "<input type='date' name='datetime_leave_" + i + "' id='datetime_leave' value='2017-01-12' />" +
        "</div>"   +
        "<div class='form-col-3'>"    +
        "</div>" +
        "<div class='form-col-f'>" +
        "</div>" +
        "<div class='form-col-2'>" +
        "<label for='adult'>Adult (18+)</label>" +
        "<select name='adult_" + i + "' id='adult'><option selected='selected' value='1'>1</option>" +
        "<option value='2'>2</option>" +
        "<option value='3'>3</option>" +
        "<option value='4'>4</option>" +
        "<option value='5'>5</option>" +
        "<option value='6'>6</option></select>" +
        "</div>" +
        "<div class='form-col-2'>" +
        "<label for='child'>Child (0-17)</label>" +
        "<select name='child_" + i + "' id='child'><option selected='selected' value='0'>0</option>" +
        "<option value='2'>2</option>" +
        "<option value='3'>3</option>" +
        "<option value='4'>4</option>" +
        "<option value='5'>5</option>" +
        "<option value='6'>6</option></select>" +
        "</div>";
            
        $('.query').typeahead('destroy');
        $("#container").append(content);
        typeahead_initialize();
    });        
    
});