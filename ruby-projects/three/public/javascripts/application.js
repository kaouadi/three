// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(function($) {
	
	$('form a.remove_fields').live('click', function() {
	    var hidden_field = $(this).prev('input[type=hidden]')[0];
	    if(hidden_field) {
	      hidden_field.value = '1';
	    }
	    $(this).closest('.fields').hide();
	    //$(this).closest("form").trigger('nested:fieldRemoved');
	    return false;
	  });	
});