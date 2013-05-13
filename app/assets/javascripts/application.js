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
//= require jquery-ui-timepicker-addon
//= require jquery.knob.js
//= require_tree .


jQuery.ajaxSetup({
  'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
});

$.fn.subSelectWithAjax = function() {
  var that = this;

  this.change(function() {
    $.post(that.attr('rel'), {id: that.val()}, null, "script");
  });
}

$.extend( $.fn.dataTableExt.oStdClasses, {
  "sWrapper": "dataTables_wrapper form-inline"
} );

jQuery(document).ready(function($) {

  $('.knob').knob({
    'min':0,
    'max':100,
    'readOnly': true,
    'width': 120,
    'height': 120,
    'dynamicDraw': true,
    'thickness': 0.2,
    'tickColorizeValues': true,
    'skin':'tron'
  });

  //inizializzazione del datetime picker jquery-ui-timepicker-addon
  $('.date').datetimepicker({
   beforeShow: function(input, inst)
   {
    inst.dpDiv.css({marginTop: -input.offsetHeight + 80 + 'px', marginLeft: input.offsetWidth + 'px'});
  },
  dateFormat: "yy-mm-dd"

});



  //popolazione dell'attributo rel con i client appartenti alla società selezionata nel dropdown
  $("#report_company_id").subSelectWithAjax();

  //inizializzazione del plugin select2 per gli elementi di dropdown e select
  $('select[multiple="multiple"]').select2({ width: "element" });
  $('select').select2({  width: "element"  });

  //configurazione dei datatable per filtraggio e paginazione
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



