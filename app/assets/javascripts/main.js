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

// test to see if data is json object

function isJson(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

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

function tomorrowsDate() {
    var tomorrow = new Date(new Date().getTime() + 24 * 60 * 60 * 1000);
    var dd = tomorrow.getDate()
    var mm = tomorrow.getMonth() + 1
    var yyyy = tomorrow.getFullYear()
    
    if(dd<10) {
        dd='0'+dd
    } 

    if(mm<10) {
        mm='0'+mm
    } 
    tomorrow = yyyy+'-'+mm+'-'+dd;
    
    return tomorrow;
}

function CaesarCipher(str, num) {
    // you can comment this line
    str = str.toLowerCase();

    var result = '';
    var charcode = 0;

    for (var i = 0; i < str.length; i++) {
        charcode = (str[i].charCodeAt()) + num;
        result += String.fromCharCode(charcode);
    }
    return result;

}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}

function parseURLParams(url) {
    var queryStart = url.indexOf("?") + 1,
        queryEnd   = url.indexOf("#") + 1 || url.length + 1,
        query = url.slice(queryStart, queryEnd - 1),
        pairs = query.replace(/\+/g, " ").split("&"),
        parms = {}, i, n, v, nv;

    if (query === url || query === "") return;

    for (i = 0; i < pairs.length; i++) {
        nv = pairs[i].split("=", 2);
        n = decodeURIComponent(nv[0]);
        v = decodeURIComponent(nv[1]);

        if (!parms.hasOwnProperty(n)) parms[n] = [];
        parms[n].push(nv.length === 2 ? v : null);
    }
    return parms;
    
    //example use
    //var params = parseURLParams(window.location.href);
}

// Use the browser's built-in functionality to quickly and safely escape
// the string
function escapeHtml(str) {
    var div = document.createElement('div');
    div.appendChild(document.createTextNode(str));
    return div.innerHTML;
}

// UNSAFE with unsafe strings; only use on previously-escaped ones!
function unescapeHtml(escapedStr) {
    var div = document.createElement('div');
    div.innerHTML = escapedStr;
    var child = div.childNodes[0];
    return child ? child.nodeValue : '';
}

$(document ).on('turbolinks:load', function(){
    var t = document.getElementsByClassName('twitter-typeahead').length;
    if(t == 0) {
        typeahead_initialize();
    }
    var i = 1;
    var x = document.getElementById('flights_title');
    var y = document.getElementById('returning');
    var br = document.getElementById('button-remove');
    var nfc = document.getElementsByClassName('new-flight-container');
    $("#button-add").click(function(){
        ++i;
        if(x.className === "form-col-xl-full off"){
            x.className = "form-col-xl-full on";
        }
        
        if(y.className === "form-col-3 on"){
            y.className = "form-col-3 off";
            y.innerHTML = "";
        }
        
        if(y.className === "form-col-3 on"){
            y.className = "form-col-3 off";
            y.innerHTML = "";
        }
        
        var today = todaysDate();
        var content = "<div class='new-flight-container'><div class='form-col-xl-full on' >" +
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
        "</div></div>" ;
        if(nfc.length > 0){
           br.className = "br-on";
        }   
        $('.query').typeahead('destroy');
        $("#container").append(content);
        typeahead_initialize();
        if(nfc.length > 0){
           br.className = "br-on";
        }
    }); 
    
    $("#button-remove").click(function(){
        var tomorrow = tomorrowsDate(); 
        $(".new-flight-container").last().remove();
        if(nfc.length == 0){
           br.className = "br-off";
           y.className = "form-col-3 on";
            y.innerHTML = '<label for="returing">Returning</label>' +
                '<input type="date" name="query_2_date_r" id="query_2_date_r" value="'+tomorrow+'">';
        }
        i--;
    }); 
    
    
    

var divs = document.getElementsByClassName('result-box clearfix');
for (var d = 0, len = divs.length; d < len; d++){
    divs[d].setAttribute('tabindex', '0');
}
    
});