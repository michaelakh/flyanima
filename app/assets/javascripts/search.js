//Jquery ui autocomplete
$(document ).on('turbolinks:load', function() {
    $( "#test" ).autocomplete({
      source: "/airports/autocomplete.json",
      icons: { submenu: "ui-icon-circle-triangle-e" }
    });
  } );

//Twitter Typahead autocomplete
$(document ).on('turbolinks:load', function() {
      var cityAirports = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
   
    remote: {
      url: '/airports/autocomplete?term=%QUERY',
      wildcard: '%QUERY',
    }
  });
    
  $('#query,#query2').typeahead(null, {
    source: cityAirports,
       limit: 10
  });
  });