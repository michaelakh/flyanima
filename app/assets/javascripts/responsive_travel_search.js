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

function responsive_travel_search(param) {
    if (param === 'Flights'){
        responsive_travel_search_helper('active-search on', 'Flights-search');
    }
    else if (param === 'Hotels'){
        responsive_travel_search_helper('active-search on', 'Hotels-search');
    }
    else if (param === 'Flights_Hotels'){
        responsive_travel_search_helper('active-search on', 'Flights-Hotels-search');
    }
    else if (param === 'Cars'){
        responsive_travel_search_helper('active-search on', 'Cars-search');
    }
    else if (param === 'Trains'){
        responsive_travel_search_helper('active-search on', 'Trains-search');
    }
    else if (param === 'Activity'){
        responsive_travel_search_helper('active-search on', 'Activity-search');
    }
    else if (param === 'All'){
        responsive_travel_search_helper('active-search on', 'All-search');
    }
}