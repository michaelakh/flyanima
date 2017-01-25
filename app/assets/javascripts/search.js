
  function show_details(){
          event.target.parentNode.parentNode.childNodes[3].className = "extra-info-details-wrapper on";
          event.target.parentNode.parentNode.childNodes[5].className = "extra-info-fares-wrapper off";
          event.target.className = "extra-info-menu on";
          event.target.parentNode.childNodes[3].className = "extra-info-menu off";
  }

    function show_fares(){
        event.target.parentNode.parentNode.childNodes[5].className = "extra-info-fares-wrapper on";
        event.target.parentNode.parentNode.childNodes[3].className = "extra-info-details-wrapper off";
        event.target.className = "extra-info-menu on"
        event.target.parentNode.childNodes[1].className = "extra-info-menu off";
  }

