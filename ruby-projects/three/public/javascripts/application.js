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
		
		
		var context = $('#items_quote tbody>tr').length;
		var content = $('#quote_lines_fields_blueprint table tbody').html(); // Fields template
		// Make a unique ID for the new child
	    var regexp  = new RegExp('new_' + 'quote_lines', 'g');
	    //content     = content.replace(regexp, "new_" + new_id);
	 	content     = content.replace(regexp, context);
		$('#items_quote tbody>tr:last').after(content);
		
	});	
	
	$('#page_status_form a').live('click', function() {
		var hidden_field = $(this).parent('form').find('input[name=status]')[0];
		if(hidden_field) {
			hidden_field.value = $(this).data("status");
		}
	 	$(this).parent('form').submit()   
		 
	
		
	
	});
	
	
});