    $( function() {
      var cityAirports = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
   
    remote: {
      url: '/airports/autocomplete?query=%QUERY',
      wildcard: '%QUERY',
    }
  });
    
  $('#query,#query2').typeahead(null, {
    source: cityAirports,
       limit: 10
  });
  });