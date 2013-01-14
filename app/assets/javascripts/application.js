// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require select2
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require dataTables/extras/TableTools
//= require dataTables/extras/ZeroClipboard
//= require cocoon
//= require_tree .

$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );

jQuery(document).ready(function($) {
	$('select[multiple="multiple"]').select2({ width: "element" });

	$('select').select2({  width: "element"  });

	$('.datatable').dataTable({
  		"sDom": "<'row-fluid'<'span2'l><'span4'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",

          
"oTableTools": {
      "aButtons": [
        "copy",
        "print",
        {
          "sExtends":    "collection",
          "sButtonText": 'Save <span class="caret" />',
          "aButtons":    [ "csv", "xls", "pdf" ]
        }
      ]
    },
  		"sPaginationType": "bootstrap",
  		"oLanguage": {
      		"sSearch": "<i class='icon-search'></i>",
      		"sZeroRecords": "Nessun elemento disponibile",
      		"sLengthMenu": "Mostra _MENU_ righe",
      		"sPrevious": "Precedente",
      		"sNext": "Successivo",
      		 "sInfo": "da <b>_START_</b> a <b>_END_</b> totali: <span class='label label-info'>_TOTAL_</span>",
    	},

	});


});

/*
 * TableTools Bootstrap compatibility
 * Required TableTools 2.1+
 */



