$(document).ready(function(){

  $(".datepicker").datepicker({
    format: "dd/mm/yyyy"
  }).on("changeDate", function(ev) {
    return $(this).datepicker("hide");
  });

  $(".timepicker").timepicker({
    showMeridian: false
  });
});