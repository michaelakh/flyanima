function responsive_travel_search_helper(eclass, eid) {
var x = document.getElementsByClassName(eclass);
var y = document.getElementById(eid);
    
  for(var i=0; i<x.length; i++) {
    
    if (x[i].className === 'active-search on') {
         x[i].className = 'active-search off';
    }
  }
    
  if(y.className === 'active-search off') {
     y.className = 'active-search on'; 
  }
    
}
function responsive_travel_search_helper_menu (eclass, eid){
    var x = document.getElementsByClassName(eclass);
    var y = document.getElementById(eid);
    
  for(var i=0; i<x.length; i++) {
    
    if (x[i].className === 'button-col-xs-10 on') {
         x[i].className = 'button-col-xs-10 off';
    }
  }
    
  if(y.className === 'button-col-xs-10 off') {
     y.className = 'button-col-xs-10 on'; 
  }
}

function responsive_travel_search(param) {
    if (param === 'Flights'){
        responsive_travel_search_helper('active-search on', 'Flights-search');
        responsive_travel_search_helper_menu('button-col-xs-10', 'Flights-button-search');
    }
    else if (param === 'Hotels'){
        responsive_travel_search_helper('active-search on', 'Hotels-search');
        responsive_travel_search_helper_menu('button-col-xs-10', 'Hotels-button-search');
    }
    else if (param === 'Cars'){
        responsive_travel_search_helper('active-search on', 'Cars-search');
        responsive_travel_search_helper_menu('button-col-xs-10', 'Cars-button-search');
    }
    else if (param === 'Trains'){
        responsive_travel_search_helper('active-search on', 'Trains-search');
        responsive_travel_search_helper_menu('button-col-xs-10', 'Trains-button-search');
    }
    else if (param === 'Activity'){
        responsive_travel_search_helper('active-search on', 'Activity-search');
        responsive_travel_search_helper_menu('button-col-xs-10', 'Activity-button-search');
    }
    else if (param === 'All'){
        responsive_travel_search_helper('active-search on', 'All-search');
        responsive_travel_search_helper_menu('button-col-xs-10', 'All-button-search');
    }
}