function responsive_class(eclass) {
var x = document.getElementsByClassName(eclass);

  for(var i=0; i<x.length; i++) {

    if (x[i].className === eclass) {

        x[i].className += ' responsive';

    }
    else {
        x[i].className = eclass;
    }
  }
}

function responsive_nav() {
    responsive_class('nav-list');
    responsive_class('search');
}