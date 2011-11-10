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
	
	
	 $('#items_quote tfoot a').live('click', function() {
		
		var content = $('#quote_lines_fields_blueprint table tbody').html(); // Fields template
	
		// Make a unique ID for the new child
	    var regexp  = new RegExp('new_' + 'quote_lines', 'g');
	    var new_id  = new Date().getTime();
	    content     = content.replace(regexp, "new_" + new_id);
		$('#items_quote tfoot').before(content);
	
		
	});	
});