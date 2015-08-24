$(document).ready(function(){
  $(".datepicker").datepicker({
    format: "dd/mm/yyyy"
  }).on("changeDate", function() {
    return $(this).datepicker("hide");
  });

  // $("#user-datepicker").datepicker({
  //   format: "dd/mm/yyyy"
  // }).on("changeDate", function(ev) {
  //   return $(this).datepicker("hide");
  // });

  $(".timepicker").timepicker({
    showMeridian: false
  });


  $(".chosen-select").chosen({no_results_text: "Ninguna coincidencia!"});
});