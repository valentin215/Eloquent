import "bootstrap";
import "jquery";

$(document).ready(function(){
  $(".category-choice").click(function(){
      console.log("heloo")
    $(this).toggleClass("active");
  });
});
