# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$("document").ready ->
  console.log $("#deal_status option:selected").val()
  if $("#deal_status option:selected").attr("value") is "Won"
    $("#deal_real_import").show()
  else
    $("#deal_real_import").hide()
  $("#deal_status").change ->
    if $("#deal_status option:selected").val() is "Won"
      $("#deal_real_import").fadeIn "fast"
    else
      $("#deal_real_import").fadeOut "fast"