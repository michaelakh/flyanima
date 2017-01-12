//Jquery ui autocomplete
$(document ).on('turbolinks:load', function() {
    $( "#test" ).autocomplete({
      source: "/airports/autocomplete.json",
      icons: { submenu: "ui-icon-circle-triangle-e" }
    });
  } );
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
    console.log("hello");
}
//Twitter Typahead autocomplete
$(document ).on('turbolinks:load', function() {
    typeahead_initialize();
  });

  