# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  check_gs = $("#company_is_global_service")
  $(document).ready ->
    
  
    if check_gs.is(":checked")
  	
  	  $("#s2id_company_associated_company_ids").css "visibility", "hidden"
  	  
    else

  check_gs.click ->
    if check_gs.is(":checked")
      $("#s2id_company_associated_company_ids").css "visibility", "hidden" 
    else  
      $("#s2id_company_associated_company_ids").css "visibility", "visible" 

