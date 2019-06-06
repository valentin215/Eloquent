import "bootstrap";
import "jquery";

import 'mapbox-gl/dist/mapbox-gl.css';
import { initAutocomplete } from '../plugins/init_autocomplete'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initAutocompleteCourse } from '../plugins/init_autocomplete'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import '../plugins/flatpickr';
import { initMapbox } from '../plugins/init_mapbox';
import { toggleFilter } from '../dropdown.js';


// import { dropwdown } from 'dropwdown'

toggleFilter();
initMapbox();
initAutocomplete();
initAutocompleteCourse();

$(document).ready(function(){
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
  });
});
